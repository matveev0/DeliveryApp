<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Application.LoginPage" %>

<!DOCTYPE html>
<html>
<head>
    <title>Delivery App</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="CSS/LoginStyle.css" rel="stylesheet" type="text/css" media="all" />
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
    <script src="/Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <div class="login-page">
        <div class="form">
            <form class="auth-form" runat="server" defaultbutton="btnLogin">
                <div class="register-form">
                    <asp:TextBox runat="server" ID="txtName" placeholder="Name"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtSurname" placeholder="Surname"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtRegUsername" placeholder="Username"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" placeholder="Email"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtRegPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtRegConfirmPassword" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                    <asp:Button runat="server" ID="btnSignUp" Text="SIGN UP" />
                    <p class="message">Already registered? <a href="#">Sign In</a></p>
                </div>

                <div class="login-form">
                    <div class="login-field">
                        <asp:TextBox runat="server" class="validateble" ID="txtLogin" placeholder="Username"></asp:TextBox>
                    </div>
                    <div class="login-field">
                        <asp:TextBox runat="server" class="validateble" ID="txtPassword" TextMode="Password" placeholder="Password" />
                    </div>
                    <asp:Button runat="server" class="disableble" ID="btnLogin" Text="LOGIN" />
                    <p class="message">Not registered? <a href="#">Create an account</a></p>
                </div>

            </form>
        </div>
    </div>

    <script type="text/javascript">
        $(".message").click(function () {
            $('.register-form').animate({ height: "toggle", opacity: "toggle" }, "slow");
            $('.login-form').animate({ height: "toggle", opacity: "toggle" }, "slow");
        });

        $(".validateble").change(function () {
            validateField($(this));
        });

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
    </script>
</body>
</html>
