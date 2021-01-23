/* ----------------------------------------------------------------------------
 * Easy!Appointments - Open Source Web Scheduler
 *
 * @package     EasyAppointments
 * @author      A.Tselegidis <alextselegidis@gmail.com>
 * @copyright   Copyright (c) 2013 - 2020, Alex Tselegidis
 * @license     http://opensource.org/licenses/GPL-3.0 - GPLv3
 * @link        http://easyappointments.org
 * @since       v1.0.0
 * ---------------------------------------------------------------------------- */

window.BackendUsers = window.BackendUsers || {};

/**
 * Backend Users
 *
 * This module handles the js functionality of the users backend page. It uses three other
 * classes (defined below) in order to handle the admin, provider and secretary record types.
 *
 * @module BackendUsers
 */
(function (exports) {

    'use strict';

    /**
     * Minimum Password Length
     *
     * @type {Number}
     */
    exports.MIN_PASSWORD_LENGTH = 7;

    /**
     * Contains the current tab record methods for the page.
     *
     * @type {AdminsHelper|ProvidersHelper|SecretariesHelper}
     */
    var helper = {};

    /**
     * Use this class instance for performing actions on the working plan.
     *
     * @type {WorkingPlan}
     */
    exports.wp = {};

    /**
     * Initialize the backend users page.
     *
     * @param {Boolean} defaultEventHandlers (OPTIONAL) Whether to bind the default event handlers.
     */
    exports.initialize = function (defaultEventHandlers) {
        defaultEventHandlers = defaultEventHandlers || true;

        exports.wp = new WorkingPlan();
        exports.wp.bindEventHandlers();

        // Instantiate default helper object (admin).
        helper = new ProvidersHelper();
        helper.resetForm();
        helper.filter('');
        helper.bindEventHandlers();

        // Fill the services and providers list boxes.

        var services_html = '<table class="table table-bordered">'; 
        services_html += '<thead><tr><th scope="col">Select Subject</th><th scope="col">Subject</th><th scope="col">Price</th></tr></thead><tbody>';
        var id = 0;
        GlobalVariables.services.forEach(function (service) {
            // $('<div/>', {
            //     'class': 'checkbox',
            //     'html': [
            //         $('<div/>', {
            //             'class': 'checkbox form-check',
            //             'html': [
            //                 $('<input/>', {
            //                     'class': 'form-check-input',
            //                     'type': 'checkbox',
            //                     'data-id': service.id,
            //                     'prop': {
            //                         'disabled': true
            //                     }
            //                 }),
            //                 $('<label/>', {
            //                     'class': 'form-check-label',
            //                     'text': service.name,
            //                     'for': service.id
            //                 })
            //             ]
            //         })
            //     ]
            // })
            //     .appendTo('#provider-services');
            id++;
            services_html +='<tr>';
            services_html +='<td><div class="custom-control custom-checkbox"><input type="checkbox" class="custom-control-input" data-id="'+service.id+'" disabled="disabled" id="customCheck'+service.id+'" checked>';
            services_html +='<label class="custom-control-label" for="customCheck'+service.id+'">'+id+'</label></div></td><td>'+service.name+'</td><td><input type="text" style="width:110px;" class="form-control" id="amount_'+service.id+'" value="" /> </td></tr>';
        });
        services_html +='</tbody></table>'
        if(id != 0)
        $('#provider-services').html(services_html);

        GlobalVariables.providers.forEach(function (provider) {
            $('<div/>', {
                'class': 'checkbox',
                'html': [
                    $('<div/>', {
                        'class': 'checkbox form-check',
                        'html': [
                            $('<input/>', {
                                'class': 'form-check-input',
                                'type': 'checkbox',
                                'data-id': provider.id
                            }),
                            $('<label/>', {
                                'class': 'form-check-label',
                                'text': provider.first_name + ' ' + provider.last_name,
                                'for': provider.id
                            })
                        ]
                    })
                ]
            })
                .appendTo('#secretary-providers');
        });

        // Bind event handlers.
        if (defaultEventHandlers) {
            bindEventHandlers();
        }
    };

    /**
     * Binds the default backend users event handlers. Do not use this method on a different
     * page because it needs the backend users page DOM.
     */
    function bindEventHandlers() {
        /**
         * Event: Page Tab Button "Click"
         *
         * Changes the displayed tab.
         */
        $('#users-page > .nav-pills a[data-toggle="tab"]').on('shown.bs.tab', function () {
            if ($(this).parents('.switch-view').length) {
                return; // Do not proceed if this was the sub navigation.
            }

            if (helper) {
                helper.unbindEventHandlers();
            }

            if ($(this).attr('href') === '#admins') {
                helper = new AdminsHelper();
            } else if ($(this).attr('href') === '#providers') {
                helper = new ProvidersHelper();
            } else if ($(this).attr('href') === '#secretaries') {
                helper = new SecretariesHelper();

                // Update the list with the all the available providers.
                var url = GlobalVariables.baseUrl + '/index.php/backend_api/ajax_filter_providers';

                var data = {
                    csrfToken: GlobalVariables.csrfToken,
                    key: ''
                };

                $.post(url, data)
                    .done(function (response) {
                        GlobalVariables.providers = response;

                        $('#secretary-providers').empty();

                        GlobalVariables.providers.forEach(function (provider) {
                            $('<div/>', {
                                'class': 'checkbox',
                                'html': [
                                    $('<div/>', {
                                        'class': 'checkbox form-check',
                                        'html': [
                                            $('<input/>', {
                                                'class': 'form-check-input',
                                                'type': 'checkbox',
                                                'data-id': provider.id,
                                                'prop': {
                                                    'disabled': true
                                                }
                                            }),
                                            $('<label/>', {
                                                'class': 'form-check-label',
                                                'text': provider.first_name + ' ' + provider.last_name,
                                                'for': provider.id
                                            }),
                                        ]
                                    })
                                ]
                            })
                                .appendTo('#secretary-providers');
                        });
                    });
            }

            helper.resetForm();
            helper.filter('');
            helper.bindEventHandlers();
            $('.filter-key').val('');
            Backend.placeFooterToBottom();
        });

        /**
         * Event: Admin, Provider, Secretary Username "Focusout"
         *
         * When the user leaves the username input field we will need to check if the username
         * is not taken by another record in the system. Usernames must be unique.
         */
        $('#admin-username, #provider-username, #secretary-username').focusout(function () {
            var $input = $(this);

            if ($input.prop('readonly') === true || $input.val() === '') {
                return;
            }

            var userId = $input.parents().eq(2).find('.record-id').val();

            if (!userId) {
                return;
            }

            var url = GlobalVariables.baseUrl + '/index.php/backend_api/ajax_validate_username';

            var data = {
                csrfToken: GlobalVariables.csrfToken,
                username: $input.val(),
                user_id: userId
            };

            $.post(url, data)
                .done(function (response) {
                    if (response === 'false') {
                        $input.closest('.form-group').addClass('has-error');
                        $input.attr('already-exists', 'true');
                        $input.parents().eq(3).find('.form-message').text(EALang.username_already_exists);
                        $input.parents().eq(3).find('.form-message').show();
                    } else {
                        $input.closest('.form-group').removeClass('has-error');
                        $input.attr('already-exists', 'false');
                        if ($input.parents().eq(3).find('.form-message').text() === EALang.username_already_exists) {
                            $input.parents().eq(3).find('.form-message').hide();
                        }
                    }
                });
        });
    }

})(window.BackendUsers);
