<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2021-01-05 15:49:12 --> Email could not been sent. Mailer Error (Line 166): Could not instantiate mail function.
ERROR - 2021-01-05 15:49:12 --> #0 C:\xampp\htdocs\FLS\application\libraries\Notifications.php(94): EA\Engine\Notifications\Email->send_appointment_details(Array, Array, Array, Array, Array, Object(EA\Engine\Types\Text), Object(EA\Engine\Types\Text), Object(EA\Engine\Types\Url), Object(EA\Engine\Types\Email), Object(EA\Engine\Types\Text), 'Asia/Karachi')
#1 C:\xampp\htdocs\FLS\application\controllers\Appointments.php(489): Notifications->notify_appointment_saved(Array, Array, Array, Array, Array, false)
#2 C:\xampp\htdocs\FLS\vendor\codeigniter\framework\system\core\CodeIgniter.php(532): Appointments->ajax_register_appointment()
#3 C:\xampp\htdocs\FLS\index.php(341): require_once('C:\\xampp\\htdocs...')
#4 {main}
