<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#35A768">

    <title><?= lang('log_out') ?> | FLS Academy</title>

    <link rel="stylesheet" type="text/css" href="<?= asset_url('assets/ext/bootstrap/css/bootstrap.min.css') ?>">
    <link rel="stylesheet" type="text/css" href="<?= asset_url('assets/css/logout.css') ?>">
    <link rel="stylesheet" type="text/css" href="<?= asset_url('assets/css/general.css') ?>">

    <link rel="icon" type="image/x-icon" href="<?= asset_url('assets/img/favicon_new.ico') ?>">
    <link rel="icon" sizes="192x192" href="<?= asset_url('assets/img/logo.png') ?>">

    <script>
        var EALang = <?= json_encode($this->lang->language) ?>;
    </script>

    <script src="<?= asset_url('assets/ext/jquery/jquery.min.js') ?>"></script>
    <script src="<?= asset_url('assets/ext/bootstrap/js/bootstrap.bundle.min.js') ?>"></script>
    <script src="<?= asset_url('assets/ext/fontawesome/js/fontawesome.min.js') ?>"></script>
    <script src="<?= asset_url('assets/ext/fontawesome/js/solid.min.js') ?>"></script>
</head>
<body style='background-color:#243c7b;'>
<div id="logout-frame" class="frame-container">
    <center><h3><?= lang('log_out') ?></h3></center>
    <center><p>
        <?= lang('logout_success') ?>
    </p></center>
    <hr style='border: 1px solid red;'>

    <br>

    <a href="<?= site_url() ?>" class="btn btn-outline-primary btn-large">
        <i class="fas fa-calendar-alt mr-2"></i>
        <?= lang('book_appointment_title') ?>
    </a>

    <a href="<?= site_url('backend') ?>" class="btn btn-outline-danger btn-large">
        <i class="fas fa-wrench mr-2"></i>
        <?= lang('backend_section') ?>
    </a>

    <div class="mt-4">
        <div style='float:right;'><small>
            Powered by
            <a href="https://cybrone.com" target="_blank">CybrOne Solutions</a>
        </small></div>
       
    </div>
</div>
</body>
</html>
