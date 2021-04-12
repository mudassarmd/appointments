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

window.FrontendBook = window.FrontendBook || {};
var app_data = [];
/**
 * Frontend Book
 *
 * This module contains functions that implement the book appointment page functionality. Once the
 * initialize() method is called the page is fully functional and can serve the appointment booking
 * process.
 *
 * @module FrontendBook
 */
(function(exports) {

    'use strict';

    /**
     * Contains terms and conditions consent.
     *
     * @type {Object}
     */
    var termsAndConditionsConsent;

    /**
     * Contains privacy policy consent.
     *
     * @type {Object}
     */
    var privacyPolicyConsent;

    /**
     * Determines the functionality of the page.
     *
     * @type {Boolean}
     */
    exports.manageMode = false;

    /**
     * This method initializes the book appointment page.
     *
     * @param {Boolean} defaultEventHandlers (OPTIONAL) Determines whether the default
     * event handlers will be bound to the dom elements.
     * @param {Boolean} manageMode (OPTIONAL) Determines whether the customer is going
     * to make  changes to an existing appointment rather than booking a new one.
     */
    exports.initialize = function(defaultEventHandlers, manageMode) {
        defaultEventHandlers = defaultEventHandlers || true;
        manageMode = manageMode || false;

        if (GlobalVariables.displayCookieNotice) {
            cookieconsent.initialise({
                palette: {
                    popup: {
                        background: '#ffffffbd',
                        text: '#666666'
                    },
                    button: {
                        background: '#429a82',
                        text: '#ffffff'
                    }
                },
                content: {
                    message: EALang.website_using_cookies_to_ensure_best_experience,
                    dismiss: 'OK'
                },
            });

            $('.cc-link').replaceWith(
                $('<a/>', {
                    'data-toggle': 'modal',
                    'data-target': '#cookie-notice-modal',
                    'href': '#',
                    'class': 'cc-link',
                    'text': $('.cc-link').text()
                })
            );
        }

        FrontendBook.manageMode = manageMode;

        // Initialize page's components (tooltips, datepickers etc).
        tippy('[data-tippy-content]');

        var weekDayId = GeneralFunctions.getWeekDayId(GlobalVariables.firstWeekday);

        $('#select-date').datepicker({
            dateFormat: 'dd-mm-yy',
            firstDay: weekDayId,
            minDate: 0,
            defaultDate: Date.today(),
            selectMultiple:true,
				
            dayNames: [
                EALang.sunday, EALang.monday, EALang.tuesday, EALang.wednesday,
                EALang.thursday, EALang.friday, EALang.saturday
            ],
            dayNamesShort: [EALang.sunday.substr(0, 3), EALang.monday.substr(0, 3),
                EALang.tuesday.substr(0, 3), EALang.wednesday.substr(0, 3),
                EALang.thursday.substr(0, 3), EALang.friday.substr(0, 3),
                EALang.saturday.substr(0, 3)
            ],
            dayNamesMin: [EALang.sunday.substr(0, 2), EALang.monday.substr(0, 2),
                EALang.tuesday.substr(0, 2), EALang.wednesday.substr(0, 2),
                EALang.thursday.substr(0, 2), EALang.friday.substr(0, 2),
                EALang.saturday.substr(0, 2)
            ],
            monthNames: [EALang.january, EALang.february, EALang.march, EALang.april,
                EALang.may, EALang.june, EALang.july, EALang.august, EALang.september,
                EALang.october, EALang.november, EALang.december
            ],
            prevText: EALang.previous,
            nextText: EALang.next,
            currentText: EALang.now,
            closeText: EALang.close,
            selectMultiple:true,

            onSelect: function(dateText, instance) {
                FrontendBookApi.getAvailableHours($(this).datepicker('getDate').toString('yyyy-MM-dd'));
                FrontendBook.updateConfirmFrame();
            },

            onChangeMonthYear: function(year, month, instance) {
                var currentDate = new Date(year, month - 1, 1);
                FrontendBookApi.getUnavailableDates($('#select-provider').val(), $('#select-service').val(),
                    currentDate.toString('yyyy-MM-dd'));
            }
        });

        $('#select-timezone').val(Intl.DateTimeFormat().resolvedOptions().timeZone);

        // Bind the event handlers (might not be necessary every time we use this class).
        if (defaultEventHandlers) {
            bindEventHandlers();
        }

        // If the manage mode is true, the appointments data should be loaded by default.
        if (FrontendBook.manageMode) {
            applyAppointmentData(GlobalVariables.appointmentData,
                GlobalVariables.providerData, GlobalVariables.customerData);
        } else {
            var $selectProvider = $('#select-provider');
            var $selectService = $('#select-service');
            var $selectBoard = $('#select-board');
            var $selectLevel = $('#select-level');

            
            
            var selectedBoard = GeneralFunctions.getUrlParameter(location.href,'board');

            if (selectedBoard && $selectBoard.has('option:contains("'+selectedBoard+'")').length > 0) {
                $('#select-board option:contains("'+selectedBoard+'")').attr('selected',true);
            }

            $selectBoard.trigger('change');

            var selectedLevel = GeneralFunctions.getUrlParameter(location.href,'level');

            if (selectedLevel && $selectLevel.has('option:contains("'+selectedLevel+'")').length > 0) {
                $('#select-level option:contains("'+selectedLevel+'")').attr('selected',true);
            }

            $selectLevel.trigger('change');

            // Check if a specific service was selected (via URL parameter).
            var selectedServiceId = GeneralFunctions.getUrlParameter(location.href, 'service');

            if (selectedServiceId && $selectService.has('option:contains("'+selectedServiceId+'")').length > 0) {
                $('#select-service option:contains("'+selectedServiceId+'")').attr('selected',true);
            }

            $selectService.trigger('change'); // Load the available hours.

            // Check if a specific provider was selected.
            var selectedProviderId = GeneralFunctions.getUrlParameter(location.href, 'provider');

            if (selectedProviderId && $selectProvider.find('option[value="' + selectedProviderId + '"]').length === 0) {
                // Select a service of this provider in order to make the provider available in the select box.
                for (var index in GlobalVariables.availableProviders) {
                    var provider = GlobalVariables.availableProviders[index];

                    if (provider.id === selectedProviderId && provider.services.length > 0) {
                        $selectService
                            .val(provider.services[0])
                            .trigger('change');
                    }
                }
            }

            if (selectedProviderId && $selectProvider.find('option[value="' + selectedProviderId + '"]').length > 0) {
                $selectProvider
                    .val(selectedProviderId)
                    .trigger('change');
            }

        }
    };

    /**
     * This method binds the necessary event handlers for the book appointments page.
     */
    function bindEventHandlers() {
        /**
         * Event: Timezone "Changed"
         */
        $('#select-timezone').on('change', function() {
            var date = $('#select-date').datepicker('getDate');

            if (!date) {
                return;
            }

            FrontendBookApi.getAvailableHours(date.toString('yyyy-MM-dd'));

            FrontendBook.updateConfirmFrame();
        });

        /**
         * Event: Selected Provider "Changed"
         *
         * Whenever the provider changes the available appointment date - time periods must be updated.
         */
        $('#select-provider').on('change', function() {
            FrontendBookApi.getUnavailableDates($(this).val(), $('#select-service').val(),
                $('#select-date').datepicker('getDate').toString('yyyy-MM-dd'));
            FrontendBook.updateConfirmFrame();

            var serviceId = $("#select-service").val();
            var providerId = $("#select-provider").val();

            var service = GlobalVariables.availableServices.find(function(availableService) {
                return Number(availableService.id) === Number(serviceId);
            });
            var amount_span = $('#service_amount');
            get_service_amount(serviceId,providerId,amount_span,service.currency);
        });

        /**
         * Event: Selected Service "Changed"
         *
         * When the user clicks on a service, its available providers should
         * become visible.
         */
        $('#select-service').on('change', function() {
            var serviceId = $('#select-service').val();

            $('#select-provider').empty();

            // 
            $('#select-provider')
            .append(new Option('-Select Teacher-', ''));
            GlobalVariables.availableProviders.forEach(function(provider) {
                // If the current provider is able to provide the selected service, add him to the list box.
                var canServeService = provider.services.filter(function(providerServiceId) {
                    return Number(providerServiceId) === Number(serviceId);
                }).length > 0;

                if (canServeService) {
                    $('#select-provider').append(new Option(provider.first_name + ' ' + provider.last_name, provider.id));
                }
            });

            // // Add the "Any Provider" entry.
            // if ($('#select-provider option').length >= 1 && GlobalVariables.displayAnyProvider === '1') {
            //     $('#select-provider').append(new Option('- ' + EALang.any_provider + ' -', 'any-provider'));
            // }

            FrontendBookApi.getUnavailableDates($('#select-provider').val(), $(this).val(),
                $('#select-date').datepicker('getDate').toString('yyyy-MM-dd'));
            FrontendBook.updateConfirmFrame();
            updateServiceDescription(serviceId);
        });

        /**
         * Event: Selected Board "Changed"
         *
         *.
         */
        $('#select-board').on('change', function() {
            var boardId = $('#select-board').val();

            $('#select-level').empty();

            GlobalVariables.availableLevels.forEach(function(level) {

                if (level.board == boardId) {
                    $('#select-level').append(new Option(level.name, level.id));
                }

            });

            var levelId = $('#select-level').val();

            $('#select-service').empty();
            GlobalVariables.availableServices.forEach(function(service) {

                if (service.board == boardId && service.level == levelId) {
                    $('#select-service').append(new Option(service.name, service.id));
                }

            });

            $('#select-service').trigger('change');
            
        });

        /**
         * Event: Selected Level "Changed"
         *
         * 
         */
        $('#select-level').on('change', function() {

            var boardId = $('#select-board').val();

            var levelId = $('#select-level').val();

            $('#select-service').empty();
            GlobalVariables.availableServices.forEach(function(service) {

                if (service.board == boardId && service.level == levelId) {
                    $('#select-service').append(new Option(service.name, service.id));
                }

            });
            
            $('#select-service').trigger('change');
            
        });
        /**
         * Event: Next Step Button "Clicked"
         *
         * This handler is triggered every time the user pressed the "next" button on the book wizard.
         * Some special tasks might be performed, depending the current wizard step.
         */
        $('.button-next').on('click', function() {
            // If we are on the first step and there is not provider selected do not continue with the next step.
            if ($(this).attr('data-step_index') === '1' && !$('#select-provider').val()) {
                return;
            }

            // If we are on the 2nd tab then the user should have an appointment hour selected.
            if ($(this).attr('data-step_index') === '2') {
                if (!$('.selected-hour').length) {
                    if (!$('#select-hour-prompt').length) {
                        $('<div/>', {
                                'id': 'select-hour-prompt',
                                'class': 'text-danger mb-4',
                                'text': EALang.appointment_hour_missing,
                            })
                            .prependTo('#available-hours');
                    }
                    return;
                }
            }

            // If we are on the 3rd tab then we will need to validate the user's input before proceeding to the next
            // step.
            if ($(this).attr('data-step_index') === '3') {
                if (!validateCustomerForm()) {
                    return; // Validation failed, do not continue.
                } else {
                    FrontendBook.updateConfirmFrame();

                    var $acceptToTermsAndConditions = $('#accept-to-terms-and-conditions');
                    if ($acceptToTermsAndConditions.length && $acceptToTermsAndConditions.prop('checked') === true) {
                        var newTermsAndConditionsConsent = {
                            first_name: $('#first-name').val(),
                            last_name: $('#last-name').val(),
                            email: $('#email').val(),
                            type: 'terms-and-conditions'
                        };

                        if (JSON.stringify(newTermsAndConditionsConsent) !== JSON.stringify(termsAndConditionsConsent)) {
                            termsAndConditionsConsent = newTermsAndConditionsConsent;
                            FrontendBookApi.saveConsent(termsAndConditionsConsent);
                        }
                    }

                    var $acceptToPrivacyPolicy = $('#accept-to-privacy-policy');
                    if ($acceptToPrivacyPolicy.length && $acceptToPrivacyPolicy.prop('checked') === true) {
                        var newPrivacyPolicyConsent = {
                            first_name: $('#first-name').val(),
                            last_name: $('#last-name').val(),
                            email: $('#email').val(),
                            type: 'privacy-policy'
                        };

                        if (JSON.stringify(newPrivacyPolicyConsent) !== JSON.stringify(privacyPolicyConsent)) {
                            privacyPolicyConsent = newPrivacyPolicyConsent;
                            FrontendBookApi.saveConsent(privacyPolicyConsent);
                        }
                    }
                }
            }

            // Display the next step tab (uses jquery animation effect).
            var nextTabIndex = parseInt($(this).attr('data-step_index')) + 1;

            $(this).parents().eq(1).hide('fade', function() {
                $('.active-step').removeClass('active-step');
                $('#step-' + nextTabIndex).addClass('active-step');
                $('#wizard-frame-' + nextTabIndex).show('fade');
            });
        });

        /**
         * Event: Back Step Button "Clicked"
         *
         * This handler is triggered every time the user pressed the "back" button on the
         * book wizard.
         */
        $('.button-back').on('click', function() {
            var prevTabIndex = parseInt($(this).attr('data-step_index')) - 1;

            $(this).parents().eq(1).hide('fade', function() {
                $('.active-step').removeClass('active-step');
                $('#step-' + prevTabIndex).addClass('active-step');
                $('#wizard-frame-' + prevTabIndex).show('fade');
            });
        });

        $('#add-appointment').on('click', function() {
            
            $("#appointments-table").css('display','block');
            var service = $("#select-service option:selected").text(); 
            var provider = $("#select-provider option:selected").text();
            var selectedDate = $('#select-date').datepicker('getDate').toString('yyyy-MM-dd') +
            ' ' + Date.parse($('.selected-hour').data('value') || '').toString('HH:mm') + ':00';
            var price = $("#service_amount").text();
            var start_datetime = $('#select-date').datepicker('getDate').toString('yyyy-MM-dd') +
                ' ' + Date.parse($('.selected-hour').data('value') || '').toString('HH:mm') + ':00';
            var end_datetime = calculateEndDatetime();
            var uid = service + provider + price + start_datetime + end_datetime + "_delete";
            var delete_btn = '<input type="hidden" value="'+uid+'" /><button class="delete_appointment"><i class="fa fa-trash"></i></button>';
            var html = '<tr><td>'+ service + '</td><td>'+ provider + '</td><td>' + selectedDate + '</td><td>'+ price +'</td><td>' + delete_btn + '</td></tr>';
            
            var check = false;
            app_data.forEach(function(item) {
                if ( item.uid == uid ) {
                    check = true;
                    return;
                }
            });

            if ( check ) {
                return;
            }

            var pr = $("#service_amount").text();
            pr = pr.replace('$','').trim();

            var obj = {
                'is_unavailable': false,
                'id_users_provider': $('#select-provider').val(),
                'id_services': $('#select-service').val(),
                'start_datetime' : start_datetime,
                'end_datetime' : end_datetime,
                'price' : parseFloat(pr),
                'repeat' : $("#select-repeat").val(),
                'uid' : service + provider + price + start_datetime + end_datetime + "_delete"
            };

            app_data.push(obj);

            $('input[name="app_data"]').val(JSON.stringify(app_data));

            $('#table-appoint').append(html);

            $("#button-back-2").text('+Add More');

            $("#button-next-2").css("display","block");
        });

        $("#tbl-appointment").on('click','tr button', function() {
            var value = $(this).siblings('input').val();

            app_data = app_data.filter(function( obj ) {
                return obj.uid !== value;
            });

            $(this).parents('tr').remove();
        });
        /**
         * Event: Available Hour "Click"
         *
         * Triggered whenever the user clicks on an available hour
         * for his appointment.
         */
        $('#available-hours').on('click', '.available-hour', function() {
            $('.selected-hour').removeClass('selected-hour');
            $(this).addClass('selected-hour');
            FrontendBook.updateConfirmFrame();
        });

        if (FrontendBook.manageMode) {
            /**
             * Event: Cancel Appointment Button "Click"
             *
             * When the user clicks the "Cancel" button this form is going to be submitted. We need
             * the user to confirm this action because once the appointment is cancelled, it will be
             * delete from the database.
             *
             * @param {jQuery.Event} event
             */
            $('#cancel-appointment').on('click', function(event) {
                var buttons = [{
                        text: EALang.cancel,
                        click: function() {
                            $('#message-box').dialog('close');
                        }
                    },
                    {
                        text: 'OK',
                        click: function() {
                            if ($('#cancel-reason').val() === '') {
                                $('#cancel-reason').css('border', '2px solid #DC3545');
                                return;
                            }
                            $('#cancel-appointment-form textarea').val($('#cancel-reason').val());
                            $('#cancel-appointment-form').submit();
                        }
                    }
                ];

                GeneralFunctions.displayMessageBox(EALang.cancel_appointment_title,
                    EALang.write_appointment_removal_reason, buttons);

                $('<textarea/>', {
                        'class': 'form-control',
                        'id': 'cancel-reason',
                        'rows': '3',
                        'css': {
                            'width': '100%'
                        }
                    })
                    .appendTo('#message-box');

                return false;
            });

            $('#delete-personal-information').on('click', function() {
                var buttons = [{
                        text: EALang.cancel,
                        click: function() {
                            $('#message-box').dialog('close');
                        }
                    },
                    {
                        text: EALang.delete,
                        click: function() {
                            FrontendBookApi.deletePersonalInformation(GlobalVariables.customerToken);
                        }
                    }
                ];

                GeneralFunctions.displayMessageBox(EALang.delete_personal_information,
                    EALang.delete_personal_information_prompt, buttons);
            });
        }

        /**
         * Event: Book Appointment Form "Submit"
         *
         * Before the form is submitted to the server we need to make sure that
         * in the meantime the selected appointment date/time wasn't reserved by
         * another customer or event.
         *
         * @param {jQuery.Event} event
         */
        $('#book-appointment-submit').on('click', function() {
            // FrontendBookApi.registerAppointment();
            console.log("Clicked");
            var data = FrontendBookApi.registerAppointment();

            // Display the next step tab (uses jquery animation effect).
            var nextTabIndex = 5;
            $('#wizard-frame-4').hide('fade',function(){
                $('.active-step').removeClass('active-step');
                $('#step-' + nextTabIndex).addClass('active-step');
                $('#wizard-frame-' + nextTabIndex).show('fade');
                $('#payment-model').html(data);
            });

        });

        /**
         * Event: Refresh captcha image.
         *
         * @param {jQuery.Event} event
         */
        $('.captcha-title button').on('click', function(event) {
            $('.captcha-image').attr('src', GlobalVariables.baseUrl + '/index.php/captcha?' + Date.now());
        });


        $('#select-date').on('mousedown', '.ui-datepicker-calendar td', function(event) {
            setTimeout(function() {
                FrontendBookApi.applyPreviousUnavailableDates(); // New jQuery UI version will replace the td elements.
            }, 300); // There is no draw event unfortunately.
        })
    }

    /**
     * This function validates the customer's data input. The user cannot continue
     * without passing all the validation checks.
     *
     * @return {Boolean} Returns the validation result.
     */
    function validateCustomerForm() {
        $('#wizard-frame-3 .has-error').removeClass('has-error');
        $('#wizard-frame-3 label.text-danger').removeClass('text-danger');

        try {
            // Validate required fields.
            var missingRequiredField = false;
            $('.required').each(function(index, requiredField) {
                if (!$(requiredField).val()) {
                    $(requiredField).parents('.form-group').addClass('has-error');
                    missingRequiredField = true;
                }
            });
            if (missingRequiredField) {
                throw new Error(EALang.fields_are_required);
            }

            var $acceptToTermsAndConditions = $('#accept-to-terms-and-conditions');
            if ($acceptToTermsAndConditions.length && !$acceptToTermsAndConditions.prop('checked')) {
                $acceptToTermsAndConditions.parents('.form-check').addClass('text-danger');
                throw new Error(EALang.fields_are_required);
            }

            var $acceptToPrivacyPolicy = $('#accept-to-privacy-policy');
            if ($acceptToPrivacyPolicy.length && !$acceptToPrivacyPolicy.prop('checked')) {
                $acceptToPrivacyPolicy.parents('.form-check').addClass('text-danger');
                throw new Error(EALang.fields_are_required);
            }


            // Validate email address.
            if (!GeneralFunctions.validateEmail($('#email').val())) {
                $('#email').parents('.form-group').addClass('has-error');
                throw new Error(EALang.invalid_email);
            }

            return true;
        } catch (error) {
            $('#form-message').text(error.message);
            return false;
        }
    }

    /**
     * Every time this function is executed, it updates the confirmation page with the latest
     * customer settings and input for the appointment booking.
     */
    exports.updateConfirmFrame = function() {
        if ($('.selected-hour').text() === '') {
            return;
        }

        // Appointment Details
        var selectedDate = $('#select-date').datepicker('getDate');

        if (selectedDate !== null) {
            selectedDate = GeneralFunctions.formatDate(selectedDate, GlobalVariables.dateFormat);
        }

        var serviceId = $('#select-service').val();
        var servicePrice = '';
        var serviceCurrency = '';

        GlobalVariables.availableServices.forEach(function(service, index) {
            if (Number(service.id) === Number(serviceId) && Number(service.price) > 0) {
                servicePrice = service.price;
                serviceCurrency = service.currency;
                return false; // break loop
            }
        });

        $('#appointment-details').empty();

        $('<div/>', {
                'html': [
                    $('<h4/>', {
                        'text': EALang.appointment
                    }),
                    $('<p/>', {
                        'html': [
                            $('<span/>', {
                                'text': EALang.service + ': ' + $('#select-service option:selected').text(),
                                'id': 'subject-name'
                            }),
                            $('<input/>', {
                                'type': 'hidden',
                                'value': $('#select-service option:selected').val(),
                                'id': 'service-pay'
                            }),
                            $('<br/>'),
                            $('<span/>', {
                                'text': EALang.provider + ': ' + $('#select-provider option:selected').text(),
                                'id': 'teacher-name'
                            }),
                            $('<input/>', {
                                'type': 'hidden',
                                'value': $('#select-provider option:selected').val(),
                                'id': 'provider-pay'
                            }),
                            $('<br/>'),
                            $('<span/>', {
                                'text': EALang.start + ': ' + selectedDate + ' ' + $('.selected-hour').text()
                            }),
                            $('<input/>', {
                                'type': 'hidden',
                                'value': selectedDate,
                                'id': 'date-pay'
                            }),
                            $('<br/>'),
                            $('<span/>', {
                                'text': EALang.timezone + ': ' + $('#select-timezone option:selected').text(),
                                'id': 'zone-pay'
                            }),
                            $('<br/>'),
                            $('<span/>', {
                                'text': EALang.price + ': ' + servicePrice + ' ' + serviceCurrency,
                                'prop': {
                                    'hidden': !servicePrice
                                }
                            }),
                            $('<input/>', {
                                'type': 'hidden',
                                'value': servicePrice,
                                'id': 'tot-price-pay'
                            }),
                        ]
                    })
                ]
            })
            .appendTo('#appointment-details');

        // Customer Details
        var firstName = GeneralFunctions.escapeHtml($('#first-name').val());
        var lastName = GeneralFunctions.escapeHtml($('#last-name').val());
        var phoneNumber = GeneralFunctions.escapeHtml($('#phone-number').val());
        var email = GeneralFunctions.escapeHtml($('#email').val());
        var address = GeneralFunctions.escapeHtml($('#address').val());
        var city = GeneralFunctions.escapeHtml($('#city').val());
        var zipCode = GeneralFunctions.escapeHtml($('#zip-code').val());

        $('#customer-details').empty();

        $('<div/>', {
                'html': [
                    $('<h4/>)', {
                        'text': EALang.customer
                    }),
                    $('<p/>', {
                        'html': [
                            $('<span/>', {
                                'text': EALang.customer + ': ' + firstName + ' ' + lastName
                            }),
                            $('<br/>'),
                            $('<span/>', {
                                'text': EALang.phone_number + ': ' + phoneNumber
                            }),
                            $('<br/>'),
                            $('<span/>', {
                                'text': EALang.email + ': ' + email
                            }),
                            $('<br/>'),
                            $('<span/>', {
                                'text': address ? EALang.address + ': ' + address : ''
                            }),
                            $('<br/>'),
                            $('<span/>', {
                                'text': city ? EALang.city + ': ' + city : ''
                            }),
                            $('<br/>'),
                            $('<span/>', {
                                'text': zipCode ? EALang.zip_code + ': ' + zipCode : ''
                            }),
                            $('<br/>'),
                        ]
                    })
                ]
            })
            .appendTo('#customer-details');


        // Update appointment form data for submission to server when the user confirms the appointment.
        var data = {};

        data.customer = {
            last_name: $('#last-name').val(),
            first_name: $('#first-name').val(),
            email: $('#email').val(),
            phone_number: $('#phone-number').val(),
            address: $('#address').val(),
            city: $('#city').val(),
            zip_code: $('#zip-code').val(),
            timezone: $('#select-timezone').val()
        };

        data.appointment = {
            start_datetime: $('#select-date').datepicker('getDate').toString('yyyy-MM-dd') +
                ' ' + Date.parse($('.selected-hour').data('value') || '').toString('HH:mm') + ':00',
            end_datetime: calculateEndDatetime(),
            notes: $('#notes').val(),
            is_unavailable: false,
            id_users_provider: $('#select-provider').val(),
            id_services: $('#select-service').val()
        };

        data.manage_mode = FrontendBook.manageMode;

        if (FrontendBook.manageMode) {
            data.appointment.id = GlobalVariables.appointmentData.id;
            data.customer.id = GlobalVariables.customerData.id;
        }
        $('input[name="csrfToken"]').val(GlobalVariables.csrfToken);
        $('input[name="post_data"]').val(JSON.stringify(data));
    };

    /**
     * This method calculates the end datetime of the current appointment.
     * End datetime is depending on the service and start datetime fields.
     *
     * @return {String} Returns the end datetime in string format.
     */
    function calculateEndDatetime() {
        // Find selected service duration.
        var serviceId = $('#select-service').val();

        var service = GlobalVariables.availableServices.find(function(availableService) {
            return Number(availableService.id) === Number(serviceId);
        });

        // Add the duration to the start datetime.
        var startDatetime = $('#select-date').datepicker('getDate').toString('dd-MM-yyyy') +
            ' ' + Date.parse($('.selected-hour').data('value') || '').toString('HH:mm');
        startDatetime = Date.parseExact(startDatetime, 'dd-MM-yyyy HH:mm');
        var endDatetime;

        if (service.duration && startDatetime) {
            endDatetime = startDatetime.add({ 'minutes': parseInt(service.duration) });
        } else {
            endDatetime = new Date();
        }

        return endDatetime.toString('yyyy-MM-dd HH:mm:ss');
    }

    /**
     * This method applies the appointment's data to the wizard so
     * that the user can start making changes on an existing record.
     *
     * @param {Object} appointment Selected appointment's data.
     * @param {Object} provider Selected provider's data.
     * @param {Object} customer Selected customer's data.
     *
     * @return {Boolean} Returns the operation result.
     */
    function applyAppointmentData(appointment, provider, customer) {
        try {
            // Select Service & Provider
            $('#select-service').val(appointment.id_services).trigger('change');
            $('#select-provider').val(appointment.id_users_provider);

            // Set Appointment Date
            $('#select-date').datepicker('setDate',
                Date.parseExact(appointment.start_datetime, 'yyyy-MM-dd HH:mm:ss'));
            FrontendBookApi.getAvailableHours(moment(appointment.start_datetime).format('YYYY-MM-DD'));

            // Apply Customer's Data
            $('#last-name').val(customer.last_name);
            $('#first-name').val(customer.first_name);
            $('#email').val(customer.email);
            $('#phone-number').val(customer.phone_number);
            $('#address').val(customer.address);
            $('#city').val(customer.city);
            $('#zip-code').val(customer.zip_code);
            if (customer.timezone) {
                $('#select-timezone').val(customer.timezone)
            }
            var appointmentNotes = (appointment.notes !== null) ?
                appointment.notes : '';
            $('#notes').val(appointmentNotes);

            FrontendBook.updateConfirmFrame();

            return true;
        } catch (exc) {
            return false;
        }
    }

    /**
     * This method updates a div's html content with a brief description of the
     * user selected service (only if available in db). This is useful for the
     * customers upon selecting the correct service.
     *
     * @param {Number} serviceId The selected service record id.
     */
    function updateServiceDescription(serviceId) {
        var $serviceDescription = $('#service-description');

        $serviceDescription.empty();

        var service = GlobalVariables.availableServices.find(function(availableService) {
            return Number(availableService.id) === Number(serviceId);
        });

        if (!service) {
            return;
        }

        if (service.duration || Number(service.price) > 0 || service.location) {
            $('<br/>')
                .appendTo($serviceDescription);
        }

        if (service.duration || Number(service.price) > 0 || service.location) {
            $('<br/>')
                .appendTo($serviceDescription);
        }

        $('<strong/>', {
                'text': service.name
            })
            .appendTo($serviceDescription);

        if (service.description) {
            $('<br/>')
                .appendTo($serviceDescription);

            $('<span/>', {
                    'text': service.description
                })
                .appendTo($serviceDescription);
        }
        if (service.duration || Number(service.price) > 0 || service.location) {
            $('<br/>')
                .appendTo($serviceDescription);
        }

        if (service.duration || Number(service.price) > 0 || service.location) {
            $('<br/>')
                .appendTo($serviceDescription);
        }

        if (service.duration) {
            $('<i/>', {
                'class': "fa fa-clock",
                'style': "font-size:20px;color:red;"
            }).appendTo($serviceDescription);

            $('<span/>', {
                    'style': 'font-weight: 600;',
                    // 'text': EALang.duration + ' ' + service.duration + ' ' + EALang.minutes
                    'text': ' ' + service.duration + ' ' + EALang.minutes

                })
                .appendTo($serviceDescription);

        }
        var providerId = $('#select-provider').val();
        // fa fa-dollar
            $('<span/>', {
                    'style': "float:right;font-weight: 600;",
                    'id':'service_amount',
                    'text': ''
                })
                .appendTo($serviceDescription);
        
        var amount_span = $('#service_amount');
        get_service_amount(serviceId,providerId,amount_span,service.currency);
        

        if (service.location) {
            $('<span/>', {
                    'text': '[' + EALang.location + ' ' + service.location + ']'
                })
                .appendTo($serviceDescription);
        }
    };

    /*
    * This method retrieves amount per service and provider
    *
    * @param {Number} serviceId, providerId
    */
    function get_service_amount(serviceId, providerId, amount_span, currency) {
         // Make ajax post request and get amount.
         var url = GlobalVariables.baseUrl + '/index.php/appointments/ajax_get_service_amount';

         var data = {
             csrfToken: GlobalVariables.csrfToken,
             serviceId: serviceId,
             providerId: providerId
         };
 
         $.post(url, data)
             .done(function(response) {
                 if(response[0]) if(response[0].amount)
                amount_span.text(currency + ' ' +response[0].amount)});
    };

})(window.FrontendBook);