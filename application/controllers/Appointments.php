<?php defined('BASEPATH') or exit('No direct script access allowed');
/* ----------------------------------------------------------------------------
 * Easy!Appointments - Open Source Web Scheduler
 *
 * @package     EasyAppointments
 * @author      A.Tselegidis <alextselegidis@gmail.com>
 * @copyright   Copyright (c) 2013 - 2020, Alex Tselegidis
 * @license     https://opensource.org/licenses/GPL-3.0 - GPLv3
 * @link        https://easyappointments.org
 * @since       v1.0.0
 * ---------------------------------------------------------------------------- */

/**
 * Appointments Controller
 *
 * @package Controllers
 */
class Appointments extends EA_Controller {
    /**
     * Class Constructor
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('payment'); 
        $this->load->library('paypal_lib'); 
        $this->load->helper('installation');
        $this->load->helper('google_analytics');
        $this->load->model('appointments_model');
        $this->load->model('providers_model');
        $this->load->model('admins_model');
        $this->load->model('secretaries_model');
        $this->load->model('services_model');
        $this->load->model('customers_model');
        $this->load->model('settings_model');
        $this->load->library('timezones');
        $this->load->library('synchronization');
        $this->load->library('notifications');
        $this->load->library('availability');
        $this->load->driver('cache', ['adapter' => 'file']);
    }

    /**
     * Default callback method of the application.
     *
     * This method creates the appointment book wizard. If an appointment hash is provided then it means that the
     * customer followed the appointment manage link that was send with the book success email.
     *
     * @param string $appointment_hash The appointment hash identifier.
     */
    public function index($appointment_hash = '')
    {
        try
        {
            if ( ! is_app_installed())
            {
                redirect('installation/index');
                return;
            }

            $available_services = $this->services_model->get_available_services();
            $available_providers = $this->providers_model->get_available_providers();
            $available_levels = $this->services_model->get_all_levels();
            $available_boards = $this->services_model->get_all_boards();
            $company_name = $this->settings_model->get_setting('company_name');
            $book_advance_timeout = $this->settings_model->get_setting('book_advance_timeout');
            $date_format = $this->settings_model->get_setting('date_format');
            $time_format = $this->settings_model->get_setting('time_format');
            $first_weekday = $this->settings_model->get_setting('first_weekday');
            $require_phone_number = $this->settings_model->get_setting('require_phone_number');
            $display_cookie_notice = $this->settings_model->get_setting('display_cookie_notice');
            $cookie_notice_content = $this->settings_model->get_setting('cookie_notice_content');
            $display_terms_and_conditions = $this->settings_model->get_setting('display_terms_and_conditions');
            $terms_and_conditions_content = $this->settings_model->get_setting('terms_and_conditions_content');
            $display_privacy_policy = $this->settings_model->get_setting('display_privacy_policy');
            $privacy_policy_content = $this->settings_model->get_setting('privacy_policy_content');
            $display_any_provider = $this->settings_model->get_setting('display_any_provider');
            $timezones = $this->timezones->to_array();

            // Remove the data that are not needed inside the $available_providers array.
            foreach ($available_providers as $index => $provider)
            {
                $stripped_data = [
                    'id' => $provider['id'],
                    'first_name' => $provider['first_name'],
                    'last_name' => $provider['last_name'],
                    'services' => $provider['services'],
                    'timezone' => $provider['timezone']
                ];
                $available_providers[$index] = $stripped_data;
            }

            // If an appointment hash is provided then it means that the customer is trying to edit a registered
            // appointment record.
            if ($appointment_hash !== '')
            {
                // Load the appointments data and enable the manage mode of the page.
                $manage_mode = TRUE;

                $results = $this->appointments_model->get_batch(['hash' => $appointment_hash]);

                if (empty($results))
                {
                    // The requested appointment doesn't exist in the database. Display a message to the customer.
                    $variables = [
                        'message_title' => lang('appointment_not_found'),
                        'message_text' => lang('appointment_does_not_exist_in_db'),
                        'message_icon' => base_url('assets/img/error.png')
                    ];

                    $this->load->view('appointments/message', $variables);

                    return;
                }

                // If the requested appointment begin date is lower than book_advance_timeout. Display a message to the
                // customer.
                $startDate = strtotime($results[0]['start_datetime']);
                $limit = strtotime('+' . $book_advance_timeout . ' minutes', strtotime('now'));

                if ($startDate < $limit)
                {
                    $hours = floor($book_advance_timeout / 60);
                    $minutes = ($book_advance_timeout % 60);

                    $view = [
                        'message_title' => lang('appointment_locked'),
                        'message_text' => strtr(lang('appointment_locked_message'), [
                            '{$limit}' => sprintf('%02d:%02d', $hours, $minutes)
                        ]),
                        'message_icon' => base_url('assets/img/error.png')
                    ];
                    $this->load->view('appointments/message', $view);
                    return;
                }

                $appointment = $results[0];
                $provider = $this->providers_model->get_row($appointment['id_users_provider']);
                $customer = $this->customers_model->get_row($appointment['id_users_customer']);

                $customer_token = md5(uniqid(mt_rand(), TRUE));

                // Save the token for 10 minutes.
                $this->cache->save('customer-token-' . $customer_token, $customer['id'], 600);
            }
            else
            {
                // The customer is going to book a new appointment so there is no need for the manage functionality to
                // be initialized.
                $manage_mode = FALSE;
                $customer_token = FALSE;
                $appointment = [];
                $provider = [];
                $customer = [];
            }

            // Load the book appointment view.
            $variables = [
                'available_services' => $available_services,
                'available_providers' => $available_providers,
                'available_levels' => $available_levels,
                'available_boards' => $available_boards,
                'company_name' => $company_name,
                'manage_mode' => $manage_mode,
                'customer_token' => $customer_token,
                'date_format' => $date_format,
                'time_format' => $time_format,
                'first_weekday' => $first_weekday,
                'require_phone_number' => $require_phone_number,
                'appointment_data' => $appointment,
                'provider_data' => $provider,
                'customer_data' => $customer,
                'display_cookie_notice' => $display_cookie_notice,
                'cookie_notice_content' => $cookie_notice_content,
                'display_terms_and_conditions' => $display_terms_and_conditions,
                'terms_and_conditions_content' => $terms_and_conditions_content,
                'display_privacy_policy' => $display_privacy_policy,
                'privacy_policy_content' => $privacy_policy_content,
                'timezones' => $timezones,
                'display_any_provider' => $display_any_provider,
            ];
        }
        catch (Exception $exception)
        {
            $variables['exceptions'][] = $exception;
        }

        $this->load->view('appointments/book', $variables);
    }

    /**
     * Cancel an existing appointment.
     *
     * This method removes an appointment from the company's schedule. In order for the appointment to be deleted, the
     * hash string must be provided. The customer can only cancel the appointment if the edit time period is not over
     * yet.
     *
     * @param string $appointment_hash This appointment hash identifier.
     */
    public function cancel($appointment_hash)
    {
        try
        {
            // Check whether the appointment hash exists in the database.
            $appointments = $this->appointments_model->get_batch(['hash' => $appointment_hash]);

            if (empty($appointments))
            {
                throw new Exception('No record matches the provided hash.');
            }

            $appointment = $appointments[0];
            $provider = $this->providers_model->get_row($appointment['id_users_provider']);
            $customer = $this->customers_model->get_row($appointment['id_users_customer']);
            $service = $this->services_model->get_row($appointment['id_services']);

            $settings = [
                'company_name' => $this->settings_model->get_setting('company_name'),
                'company_email' => $this->settings_model->get_setting('company_email'),
                'company_link' => $this->settings_model->get_setting('company_link'),
                'date_format' => $this->settings_model->get_setting('date_format'),
                'time_format' => $this->settings_model->get_setting('time_format')
            ];

            // Remove the appointment record from the data.
            if ( ! $this->appointments_model->delete($appointment['id']))
            {
                throw new Exception('Appointment could not be deleted from the database.');
            }

            $this->synchronization->sync_appointment_deleted($appointment, $provider);
            $this->notifications->notify_appointment_deleted($appointment, $service, $provider, $customer, $settings);
        }
        catch (Exception $exception)
        {
            // Display the error message to the customer.
            $exceptions[] = $exception;
        }

        $view = [
            'message_title' => lang('appointment_cancelled_title'),
            'message_text' => lang('appointment_cancelled'),
            'message_icon' => base_url('assets/img/success.png')
        ];

        if (isset($exceptions))
        {
            $view['exceptions'] = $exceptions;
        }

        $this->load->view('appointments/message', $view);
    }

    /**
     * Payment method -for buying 
     * 
     * @param string $id
     */
    function processPayment(){ 
        // Set variables for paypal form 
        $returnURL = base_url().'index.php/appointments/success'; //payment success url 
        $cancelURL = base_url().'paypal/cancel'; //payment cancel url 
        $notifyURL = base_url().'paypal/ipn'; //ipn url 
        
        $data = $this->input->post('post_data');

        // Add fields to paypal form 
        $this->paypal_lib->add_field('return', $returnURL); 
        $this->paypal_lib->add_field('cancel_return', $cancelURL); 
        $this->paypal_lib->add_field('notify_url', $notifyURL); 
        $this->paypal_lib->add_field('provider_id', $data['provider_id']); 
        $this->paypal_lib->add_field('time_slot', $data['time_slot']); 
        $this->paypal_lib->add_field('currency_code', 'USD'); 
        $this->paypal_lib->add_field('amount', $data['total_amount']); 
        // $this->paypal_lib->add_field('customer_id', $data['customer_id']); 
        $this->paypal_lib->add_field('item_name', $data['item_name']); 
        $this->paypal_lib->add_field('custom', $data['customer_id']); 
        $this->paypal_lib->add_field('item_number', $data['service_id']); 

        $this->session->set_userdata('app-hash', $data['hash']);
        // Render paypal form

        $response = [
            'response_html' => $this->paypal_lib->paypal_auto_form()
        ];

        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($response));
    }
    /**
     * Method to get amount vs teacher & subject
     * 
     * @param string $providerId, $serviceId
     */
    public function ajax_get_service_amount() {
        $providerId = $this->input->post('providerId');
        $serviceId = $this->input->post('serviceId');
        $amount = $this->services_model->get_service_amount($serviceId,$providerId);
        $this->output->set_content_type('application/json')
        ->set_output(json_encode($amount));
    }

    public function httpPost($url, $data)
    {
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($curl);
        curl_close($curl);
        return $response;
    }
    /**
     * GET an specific appointment book and redirect to the success screen.
     *
     * @param string $appointment_hash The appointment hash identifier.
     *
     * @throws Exception
     */
    public function book_success($appointment_hash)
    {
        $appointments = $this->appointments_model->get_batch(['hash' => $appointment_hash]);

        if (empty($appointments))
        {
            redirect('appointments'); // The appointment does not exist.
            return;
        }

        $appointment = $appointments[0];
        unset($appointment['notes']);

        $customer = $this->customers_model->get_row($appointment['id_users_customer']);

        $provider = $this->providers_model->get_row($appointment['id_users_provider']);

        $service = $this->services_model->get_row($appointment['id_services']);

        $company_name = $this->settings_model->get_setting('company_name');

        // Get any pending exceptions.
        $exceptions = $this->session->flashdata('book_success');

        $amount = $this->services_model->get_service_amount($service['id'],$provider['id']);

        $uid = $customer['id'];

        $first_name = $customer['first_name'];

        $last_name = $customer['last_name'];

        $phone = $customer['phone_number'];

        $email = $customer['email'];

        $teacher_name = $provider['first_name'].' '.$provider['last_name'];

        $subject_name = $service['name'];

        $date = $appointment['start_datetime']; 

        $api_data = 
        ['uid' => $uid, 'fname' => $first_name, 'lname' => $last_name, 
        'tname' => $teacher_name, 'email' => $email, 'phone' => $phone, 'subject' => $subject_name,
        'price' => $amount[0]['amount'], 'date' => $date];

        $response = $this->httpPost('https://futurelearnschool.com/api/cms_enquiry/add/?api_key=242vew3',$api_data);

        $view = [
            'appointment_data' => $appointment,
            'provider_data' => [
                'id' => $provider['id'],
                'first_name' => $provider['first_name'],
                'last_name' => $provider['last_name'],
                'email' => $provider['email'],
                'timezone' => $provider['timezone'],
            ],
            'customer_data' => [
                'id' => $customer['id'],
                'first_name' => $customer['first_name'],
                'last_name' => $customer['last_name'],
                'email' => $customer['email'],
                'timezone' => $customer['timezone'],
            ],
            'service_data' => $service,
            'company_name' => $company_name,
            'api_response' => $response,
            'api_data' => $api_data
        ];

        if ($exceptions)
        {
            $view['exceptions'] = $exceptions;
        }

        $this->load->view('appointments/book_success', $view);
    }


    /**
     * Response from Paypal
     * 
     * Success method
     */

    public function success(){ 
        // Get the transaction data 
       try{
        $paypalInfo = $this->input->get(); 
        $notify = $this->session->userdata('notify_values');
        $appointment = $notify['appointment'];
        $service = $notify['service'];
        $provider = $notify['provider'];
        $customer = $notify['customer'];
        $settings = $notify['settings'];
        $manage_mode = $notify['manage_mode'];
        
        if(!empty($paypalInfo['tx']) && !empty($paypalInfo['amt']) && !empty($paypalInfo['cc']) && !empty($paypalInfo['st'])){ 

        $prevPayment = $this->payment->getPayment(array('transaction_id' => $paypalInfo["tx"])); 
                if(!$prevPayment){ 
                    // Insert the transaction data in the database 
                    $data['provider_id']    = $appointment['id_users_provider']; 
                    $data['time_slot']    = $appointment['start_datetime']; 
                    $data['currency_code']    = $paypalInfo["cc"]; 
                    $data['payment_status']    = $paypalInfo["st"]; 
                    $data['total_amount']    = $paypalInfo["amt"];
                    $data['transaction_id'] = $paypalInfo["tx"]; 
                    // $data['customer_id'] = $paypalInfo["custom"]; 
                    $data['service_id'] = $appointment['id_services']; 
                    
                    $this->payment->insertTransaction($data); 
                }
            }
        // Pass the transaction data to view 
        $hash = $this->session->userdata('app-hash');
        $this->notifications->notify_appointment_saved($appointment, $service, $provider, $customer, $settings, $manage_mode);
        $this->book_success($hash);
       }catch(Exception $ex) {
           echo $ex->getTrace();
       }
    } 

    /**
     * Get the available appointment hours for the given date.
     *
     * This method answers to an AJAX request. It calculates the available hours for the given service, provider and
     * date.
     *
     * Outputs a JSON string with the availabilities.
     */
    public function ajax_get_available_hours()
    {
        try
        {
            $provider_id = $this->input->post('provider_id');
            $service_id = $this->input->post('service_id');
            $selected_date = $this->input->post('selected_date');

            // Do not continue if there was no provider selected (more likely there is no provider in the system).
            if (empty($provider_id))
            {
                $this->output
                    ->set_content_type('application/json')
                    ->set_output(json_encode([]));

                return;
            }

            // If manage mode is TRUE then the following we should not consider the selected appointment when
            // calculating the available time periods of the provider.
            $exclude_appointment_id = $this->input->post('manage_mode') === 'true' ? $this->input->post('appointment_id') : NULL;

            // If the user has selected the "any-provider" option then we will need to search for an available provider
            // that will provide the requested service.
            if ($provider_id === ANY_PROVIDER)
            {
                $provider_id = $this->search_any_provider($selected_date, $service_id);

                if ($provider_id === NULL)
                {
                    $this->output
                        ->set_content_type('application/json')
                        ->set_output(json_encode([]));

                    return;
                }
            }

            $service = $this->services_model->get_row($service_id);

            $provider = $this->providers_model->get_row($provider_id);

            $response = $this->availability->get_available_hours($selected_date, $service, $provider, $exclude_appointment_id);
        }
        catch (Exception $exception)
        {
            $this->output->set_status_header(500);

            $response = [
                'message' => $exception->getMessage(),
                'trace' => config('debug') ? $exception->getTrace() : []
            ];
        }

        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($response));
    }

    /**
     * Search for any provider that can handle the requested service.
     *
     * This method will return the database ID of the provider with the most available periods.
     *
     * @param string $date The date to be searched (Y-m-d).
     * @param int $service_id The requested service ID.
     *
     * @return int Returns the ID of the provider that can provide the service at the selected date.
     *
     * @throws Exception
     */
    protected function search_any_provider($date, $service_id)
    {
        $available_providers = $this->providers_model->get_available_providers();

        $service = $this->services_model->get_row($service_id);

        $provider_id = NULL;

        $max_hours_count = 0;

        foreach ($available_providers as $provider)
        {
            foreach ($provider['services'] as $provider_service_id)
            {
                if ($provider_service_id == $service_id)
                {
                    // Check if the provider is available for the requested date.
                    $available_hours = $this->availability->get_available_hours($date, $service, $provider);

                    if (count($available_hours) > $max_hours_count)
                    {
                        $provider_id = $provider['id'];
                        $max_hours_count = count($available_hours);
                    }
                }
            }
        }

        return $provider_id;
    }


    /**
     * Register the appointment to the database.
     *
     * Outputs a JSON string with the appointment ID.
     */
    public function ajax_register_appointment()
    {
        try
        {
            $post_data = $this->input->post('post_data');
            $captcha = $this->input->post('captcha');
            $manage_mode = filter_var($post_data['manage_mode'], FILTER_VALIDATE_BOOLEAN);
            $appointment = $post_data['appointment'];
            $customer = $post_data['customer'];
            $app_data = $post_data['app_data'];

            if ($this->customers_model->exists($customer))
            {
                $customer['id'] = $this->customers_model->find_record_id($customer);
            }

            // if (empty($appointment['location']) && ! empty($service['location']))
            // {
            //     $appointment['location'] = $service['location'];
            // }

            // Save customer language (the language which is used to render the booking page).
            $customer['language'] = config('language');
            $customer_id = $this->customers_model->add($customer);

            $settings = [
                'company_name' => $this->settings_model->get_setting('company_name'),
                'company_link' => $this->settings_model->get_setting('company_link'),
                'company_email' => $this->settings_model->get_setting('company_email'),
                'date_format' => $this->settings_model->get_setting('date_format'),
                'time_format' => $this->settings_model->get_setting('time_format')
            ];

            $dummy_app = NULL;
            $provider = NULL;
            $service = NULL;
            $amount = 0;
            foreach($app_data as $appoint) {
                if ( $appoint['repeat'] == "single" ) {
                    $dummy_app = NULL;
                    $provider = $this->providers_model->get_row($appoint['id_users_provider']);
                    $service = $this->services_model->get_row($appoint['id_services']);
                    $dummy_app['id_users_customer'] = $customer_id;
                    $dummy_app['id_users_provider'] = $appoint['id_users_provider'];
                    $dummy_app['id_services'] = $appoint['id_services'];
                    $dummy_app['notes'] = $appointment['notes'];
                    $dummy_app['is_unavailable'] = (int)$appoint['is_unavailable']; // needs to be type casted
                    $dummy_app['start_datetime'] = $appoint['start_datetime'];
                    $dummy_app['end_datetime'] = $appoint['end_datetime'];
                    $dummy_app['id'] = $this->appointments_model->add($dummy_app);
                    $dummy_app['hash'] = $this->appointments_model->get_value('hash', $dummy_app['id']);
                    $amount += (float)$appoint['price'];
                    $this->synchronization->sync_appointment_saved($dummy_app, $service, $provider, $customer, $settings, $manage_mode);
                } else if ( $appoint['repeat'] == "week" ) {

                    $check_date = new DateTime($appoint['start_datetime']);

                    $check_date->modify("+1 month");

                    $temp = new DateTime($appoint['start_datetime']);

                    $temp_end = new DateTime($appoint['end_datetime']);

                    $in_date = $temp;
                    $end_date = $temp_end;

                    while ( $temp < $check_date ) {

                        $dummy_app = NULL;
                        $provider = $this->providers_model->get_row($appoint['id_users_provider']);
                        $service = $this->services_model->get_row($appoint['id_services']);
                        $dummy_app['id_users_customer'] = $customer_id;
                        $dummy_app['id_users_provider'] = $appoint['id_users_provider'];
                        $dummy_app['id_services'] = $appoint['id_services'];
                        $dummy_app['notes'] = $appointment['notes'];
                        $dummy_app['is_unavailable'] = (int)$appoint['is_unavailable']; // needs to be type casted
                        $dummy_app['start_datetime'] = $in_date->format('Y-m-d H:i:s');
                        $dummy_app['end_datetime'] = $end_date->format('Y-m-d H:i:s');
                        $dummy_app['id'] = $this->appointments_model->add($dummy_app);
                        $dummy_app['hash'] = $this->appointments_model->get_value('hash', $dummy_app['id']);
                        $amount += (float)$appoint['price'];
                        $this->synchronization->sync_appointment_saved($dummy_app, $service, $provider, $customer, $settings, $manage_mode);
                        $temp->modify("+7 day");
                        $temp_end->modify("+7 day");

                    }
                } else if ( $appoint['repeat'] == "day" ) {

                    $check_date = new DateTime($appoint['start_datetime']);

                    $check_date->modify("+7 day");

                    $temp = new DateTime($appoint['start_datetime']);

                    $temp_end = new DateTime($appoint['end_datetime']);

                    $in_date = $temp;
                    $end_date = $temp_end;

                    while ( $temp < $check_date ) {

                        $dummy_app = NULL;
                        $provider = $this->providers_model->get_row($appoint['id_users_provider']);
                        $service = $this->services_model->get_row($appoint['id_services']);
                        $dummy_app['id_users_customer'] = $customer_id;
                        $dummy_app['id_users_provider'] = $appoint['id_users_provider'];
                        $dummy_app['id_services'] = $appoint['id_services'];
                        $dummy_app['notes'] = $appointment['notes'];
                        $dummy_app['is_unavailable'] = (int)$appoint['is_unavailable']; // needs to be type casted
                        $dummy_app['start_datetime'] = $in_date->format('Y-m-d H:i:s');
                        $dummy_app['end_datetime'] = $end_date->format('Y-m-d H:i:s');
                        $dummy_app['id'] = $this->appointments_model->add($dummy_app);
                        $dummy_app['hash'] = $this->appointments_model->get_value('hash', $dummy_app['id']);
                        $amount += (float)$appoint['price'];
                        $this->synchronization->sync_appointment_saved($dummy_app, $service, $provider, $customer, $settings, $manage_mode);
                        $temp->modify("+1 day");
                        $temp_end->modify("+1 day");
                    }
                }

            }
            // Check appointment availability before registering it to the database.
            // $appointment['id_users_provider'] = $this->check_datetime_availability();

            // if ( ! $appointment['id_users_provider'])
            // {
            //     throw new Exception(lang('requested_hour_is_unavailable'));
            // }

            // $provider = $this->providers_model->get_row($appointment['id_users_provider']);
            // $service = $this->services_model->get_row($appointment['id_services']);

            // $appointment['id_users_customer'] = $customer_id;
            // $appointment['is_unavailable'] = (int)$appointment['is_unavailable']; // needs to be type casted
            // $appointment['id'] = $this->appointments_model->add($appointment);
            // $appointment['hash'] = $this->appointments_model->get_value('hash', $appointment['id']);

            // $this->synchronization->sync_appointment_saved($appointment, $service, $provider, $customer, $settings, $manage_mode);

            // $amount = $this->services_model->get_service_amount($service['id'],$provider['id']);

            // Already 
            $require_captcha = $this->settings_model->get_setting('require_captcha');
            $captcha_phrase = $this->session->userdata('captcha_phrase');

            // Validate the CAPTCHA string.
            if ($require_captcha === '1' && $captcha_phrase !== $captcha)
            {
                $this->output
                    ->set_content_type('application/json')
                    ->set_output(json_encode([
                        'captcha_verification' => FALSE
                    ]));

                return;
            }

            $notify_values = array(
                'appointment' => $dummy_app,
                'service' => $service,
                'provider' => $provider,
                'customer' => $customer,
                'settings' => $settings,
                'manage_mode' => $manage_mode
            );

            $this->session->set_userdata('notify_values', $notify_values);

            $uid = $customer_id;

            $first_name = $customer['first_name'];

            $last_name = $customer['last_name'];

            $phone = $customer['phone_number'];

            $email = $customer['email'];

            $teacher_name = $provider['first_name'].' '.$provider['last_name'];

            $subject_name = $service['name'];

            $date = $dummy_app['start_datetime'];

            $api_data = 
                ['uid' => $uid, 'fname' => $first_name, 'lname' => $last_name, 
                'tname' => $teacher_name, 'email' => $email, 'phone' => $phone, 'subject' => $subject_name,
                'price' => $amount, 'date' => $date];

            $api_response = $this->httpPost('https://futurelearnschool.com/api/cms_enquiry/add/simple/?api_key=242vew3',$api_data);

            $response = [
                'appointment_id' => $dummy_app['id'],
                'appointment_hash' => $dummy_app['hash'],
                'price' => $amount,
                'api_response' => $api_response
            ];
        }
        catch (Exception $exception)
        {
            $this->output->set_status_header(500);

            $response = [
                'message' => $exception->getMessage(),
                'trace' => config('debug') ? $exception->getTrace() : []
            ];
        }

        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($response));
    }

    /**
     * Check whether the provider is still available in the selected appointment date.
     *
     * It might be times where two or more customers select the same appointment date and time. This shouldn't be
     * allowed to happen, so one of the two customers will eventually get the preferred date and the other one will have
     * to choose for another date. Use this method just before the customer confirms the appointment details. If the
     * selected date was taken in the mean time, the customer must be prompted to select another time for his
     * appointment.
     *
     * @return int Returns the ID of the provider that is available for the appointment.
     *
     * @throws Exception
     */
    protected function check_datetime_availability()
    {
        $post_data = $this->input->post('post_data');

        $appointment = $post_data['appointment'];

        $date = date('Y-m-d', strtotime($appointment['start_datetime']));

        if ($appointment['id_users_provider'] === ANY_PROVIDER)
        {

            $appointment['id_users_provider'] = $this->search_any_provider($date, $appointment['id_services']);

            return $appointment['id_users_provider'];
        }

        $service = $this->services_model->get_row($appointment['id_services']);

        $exclude_appointment_id = isset($appointment['id']) ? $appointment['id'] : NULL;

        $provider = $this->providers_model->get_row($appointment['id_users_provider']);

        $available_hours = $this->availability->get_available_hours($date, $service, $provider, $exclude_appointment_id);

        $is_still_available = FALSE;

        $appointment_hour = date('H:i', strtotime($appointment['start_datetime']));

        foreach ($available_hours as $available_hour)
        {
            if ($appointment_hour === $available_hour)
            {
                $is_still_available = TRUE;
                break;
            }
        }

        return $is_still_available ? $appointment['id_users_provider'] : NULL;
    }

    /**
     * Get Unavailable Dates
     *
     * Get an array with the available dates of a specific provider, service and month of the year. Provide the
     * "provider_id", "service_id" and "selected_date" as GET parameters to the request. The "selected_date" parameter
     * must have the Y-m-d format.
     *
     * Outputs a JSON string with the unavailable dates. that are unavailable.
     */
    public function ajax_get_unavailable_dates()
    {
        try
        {
            $provider_id = $this->input->get('provider_id');
            $service_id = $this->input->get('service_id');
            $appointment_id = $this->input->get_post('appointment_id');
            $manage_mode = $this->input->get_post('manage_mode');
            $selected_date_string = $this->input->get('selected_date');
            $selected_date = new DateTime($selected_date_string);
            $number_of_days_in_month = (int)$selected_date->format('t');
            $unavailable_dates = [];

            $provider_ids = $provider_id === ANY_PROVIDER
                ? $this->search_providers_by_service($service_id)
                : [$provider_id];

            $exclude_appointment_id = $manage_mode ? $appointment_id : NULL;

            // Get the service record.
            $service = $this->services_model->get_row($service_id);

            for ($i = 1; $i <= $number_of_days_in_month; $i++)
            {
                $current_date = new DateTime($selected_date->format('Y-m') . '-' . $i);

                if ($current_date < new DateTime(date('Y-m-d 00:00:00')))
                {
                    // Past dates become immediately unavailable.
                    $unavailable_dates[] = $current_date->format('Y-m-d');
                    continue;
                }

                // Finding at least one slot of availability.
                foreach ($provider_ids as $current_provider_id)
                {
                    $provider = $this->providers_model->get_row($current_provider_id);

                    $available_hours = $this->availability->get_available_hours(
                        $current_date->format('Y-m-d'),
                        $service,
                        $provider,
                        $exclude_appointment_id
                    );

                    if ( ! empty($available_hours))
                    {
                        break;
                    }
                }

                // No availability amongst all the provider.
                if (empty($available_hours))
                {
                    $unavailable_dates[] = $current_date->format('Y-m-d');
                }
            }

            $response = $unavailable_dates;
        }
        catch (Exception $exception)
        {
            $this->output->set_status_header(500);

            $response = [
                'message' => $exception->getMessage(),
                'trace' => config('debug') ? $exception->getTrace() : []
            ];
        }

        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($response));
    }

    /**
     * Search for any provider that can handle the requested service.
     *
     * This method will return the database ID of the providers affected to the requested service.
     *
     * @param int $service_id The requested service ID.
     *
     * @return array Returns the ID of the provider that can provide the requested service.
     */
    protected function search_providers_by_service($service_id)
    {
        $available_providers = $this->providers_model->get_available_providers();
        $provider_list = [];

        foreach ($available_providers as $provider)
        {
            foreach ($provider['services'] as $provider_service_id)
            {
                if ($provider_service_id === $service_id)
                {
                    // Check if the provider is affected to the selected service.
                    $provider_list[] = $provider['id'];
                }
            }
        }

        return $provider_list;
    }


}
