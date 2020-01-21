//$(document).ready(function () {
//    $(".message").click(function () {
//        $('.register-form').animate({ height: "toggle", opacity: "toggle" }, "slow");
//        $('.login-form').animate({ height: "toggle", opacity: "toggle" }, "slow");
//    });
alert("asdasd");

//    //$(".validateble").change(function () {
//    //    validateField($(this));
//    //});
//});

function validateField($field) {
    var $form = $field.closest('form');
    var value = $field.val();
    form_error_clear($form, $field);

    if ($.trim(value.length) == 0) {
        showError($field, "Необходимо заполнить поле");
        toggleSubmitButton($form);
        return false;
    }
    toggleSubmitButton($form);
}

function toggleSubmitButton($form) {
    console.log("form = " + $form);
    var disabled_submit = false;
    $form.find('[class="validateble"]').each(function (i, field) {
        if ($.trim($(field).val()) == '') {
            disabled_submit = true;
        }
    })
    if (!disabled_submit) {
        form_errors_clear($form)
    }
    $form.find('.disableble').prop('disabled', disabled_submit);
}

function showError($field, text) {
    field = $field.closest('.login-field');
    field.addClass('s-with-error');
    field.append('<div class="s-error">' + text + '</div>');
}

function form_errors_clear($form) {
    $form.find('.s-with-error').removeClass('s-with-error');
    $form.find('.s-error').remove();
}

function form_error_clear($form, $field) {
    var $field = $field.closest('.s-field');
    $field.removeClass('s-with-error');
    $field.find('.s-error').remove();
}