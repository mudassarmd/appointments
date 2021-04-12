<div id="footer">
    <div id="footer-content" class="col-12 col-sm-8">
        <img class="mr-1" src="<?= base_url('assets/img/favicon_new.ico') ?>" alt="FLS Academy Appointment System">
        <a href="#" target="_blank">FLS Academy Appointment System</a>

        v<?= config('version') ?>
        <?php if (config('release_label')): ?>
            - <?= config('release_label') ?>
        <?php endif ?>

        |

        <img class="mx-1" src="<?= base_url('assets/img/favicon_logo.png') ?>" alt="CybrOne Solutions">
        <a href="https://cybrone.com" target="_blank">CybrOne Solutions</a>
        &copy; <?= date('Y') ?> - Software Development

       

        

        |

        <a href="<?= site_url('appointments') ?>">
            <?= lang('go_to_booking_page') ?>
        </a>
    </div>

    <div id="footer-user-display-name" class="col-12 col-sm-4">
        <?= lang('hello') . ', ' . $user_display_name ?>!
    </div>
</div>

<script src="<?= asset_url('assets/js/backend.js') ?>"></script>
<script src="<?= asset_url('assets/js/polyfill.js') ?>"></script>
<script src="<?= asset_url('assets/js/general_functions.js') ?>"></script>
</body>
</html>
