<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2021-01-10 10:53:39 --> Severity: error --> Exception: syntax error, unexpected '$lang' (T_VARIABLE) C:\xampp\htdocs\FLS\application\language\english\translations_lang.php 5
ERROR - 2021-01-10 10:53:42 --> Severity: error --> Exception: syntax error, unexpected '$lang' (T_VARIABLE) C:\xampp\htdocs\FLS\application\language\english\translations_lang.php 5
ERROR - 2021-01-10 10:54:13 --> Severity: error --> Exception: syntax error, unexpected '$lang' (T_VARIABLE) C:\xampp\htdocs\FLS\application\language\english\translations_lang.php 5
ERROR - 2021-01-10 12:33:22 --> Severity: error --> Exception: Too few arguments to function Appointments::processPayment(), 0 passed in C:\xampp\htdocs\FLS\vendor\codeigniter\framework\system\core\CodeIgniter.php on line 532 and exactly 1 expected C:\xampp\htdocs\FLS\application\controllers\Appointments.php 257
ERROR - 2021-01-10 12:33:55 --> Severity: error --> Exception: Too few arguments to function Appointments::processPayment(), 0 passed in C:\xampp\htdocs\FLS\vendor\codeigniter\framework\system\core\CodeIgniter.php on line 532 and exactly 1 expected C:\xampp\htdocs\FLS\application\controllers\Appointments.php 257
ERROR - 2021-01-10 13:40:14 --> Severity: error --> Exception: syntax error, unexpected ';', expecting ']' C:\xampp\htdocs\FLS\application\controllers\Appointments.php 281
ERROR - 2021-01-10 13:43:13 --> Severity: error --> Exception: syntax error, unexpected ';', expecting ']' C:\xampp\htdocs\FLS\application\controllers\Appointments.php 281
ERROR - 2021-01-10 13:44:26 --> Severity: error --> Exception: syntax error, unexpected ';', expecting ']' C:\xampp\htdocs\FLS\application\controllers\Appointments.php 279
ERROR - 2021-01-10 14:30:39 --> Unable to load the requested class: Paypal_lib
ERROR - 2021-01-10 14:30:42 --> Unable to load the requested class: Paypal_lib
ERROR - 2021-01-10 14:32:03 --> Unable to load the requested class: Paypal_lib
ERROR - 2021-01-10 14:35:02 --> Unable to load the requested class: Paypal_lib
ERROR - 2021-01-10 14:51:55 --> Unable to load the requested class: Paypal_lib
ERROR - 2021-01-10 14:52:12 --> Unable to load the requested class: Paypal_lib
ERROR - 2021-01-10 14:53:39 --> Unable to load the requested class: Paypal_lib
ERROR - 2021-01-10 17:19:19 --> Query error: Column 'provider_id' cannot be null - Invalid query: INSERT INTO `ea_payments` (`provider_id`, `time_slot`, `currency_code`, `payment_status`, `total_amount`, `transaction_id`, `customer_id`, `service_id`) VALUES (NULL, NULL, 'USD', 'Completed', '20.00', '2G0082594F7086224', NULL, '1')
ERROR - 2021-01-10 18:04:15 --> Query error: Column 'provider_id' cannot be null - Invalid query: INSERT INTO `ea_payments` (`provider_id`, `time_slot`, `currency_code`, `payment_status`, `total_amount`, `transaction_id`, `customer_id`, `service_id`) VALUES (NULL, NULL, 'USD', 'Completed', '20.00', '8L0912387K161232U', NULL, NULL)
ERROR - 2021-01-10 18:09:02 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:09:02 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(387): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:09:02 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 388
ERROR - 2021-01-10 18:09:09 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:09:09 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(387): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:09:09 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 388
ERROR - 2021-01-10 18:09:11 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:09:11 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(387): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:09:11 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 388
ERROR - 2021-01-10 18:09:12 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:09:12 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(387): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:09:12 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 388
ERROR - 2021-01-10 18:09:14 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:09:14 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(387): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:09:14 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 388
ERROR - 2021-01-10 18:10:11 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:10:11 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(387): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:10:11 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 388
ERROR - 2021-01-10 18:11:51 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:11:51 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(387): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:11:51 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 388
ERROR - 2021-01-10 18:17:46 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:17:46 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(388): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:17:46 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 389
ERROR - 2021-01-10 18:17:54 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:17:54 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(388): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:17:54 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 389
ERROR - 2021-01-10 18:17:59 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:17:59 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(388): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:17:59 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 389
ERROR - 2021-01-10 18:18:02 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:18:02 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(388): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:18:02 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 389
ERROR - 2021-01-10 18:18:04 --> DateTimeZone::__construct(): Unknown or bad timezone ()
ERROR - 2021-01-10 18:18:04 --> #0 /home/jageerx/public_html/fla/application/libraries/Ics_file.php(49): DateTimeZone->__construct('')
#1 /home/jageerx/public_html/fla/application/libraries/Notifications.php(84): Ics_file->get_stream(NULL, NULL, NULL, NULL)
#2 /home/jageerx/public_html/fla/application/controllers/Appointments.php(388): Notifications->notify_appointment_saved(NULL, NULL, NULL, NULL, NULL, NULL)
#3 /home/jageerx/public_html/fla/vendor/codeigniter/framework/system/core/CodeIgniter.php(532): Appointments->success()
#4 /home/jageerx/public_html/fla/index.php(341): require_once('/home/jageerx/p...')
#5 {main}
ERROR - 2021-01-10 18:18:04 --> Severity: error --> Exception: Call to undefined function book_success() /home/jageerx/public_html/fla/application/controllers/Appointments.php 389
