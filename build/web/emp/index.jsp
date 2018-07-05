<!DOCTYPE html>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Admin Template">
        <meta name="keywords" content="admin dashboard, admin, flat, flat ui, ui kit, app, web app, responsive">
        <link rel="shortcut icon" href="../img/ico/favicon.png">

        <title>AMU Employee - Login</title>

        <!-- Base Styles -->
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.min.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
        <script>
            function trim(s)
            {
                return s.replace(/^s*/, "").replace(/s*$/, "");
            }

            function validate()
            {
                if (trim(document.form - signin.user.value) == "")
                {
                    alert("Login empty");
                    document.form - signin.sUserName.focus();
                    return false;
                } else if (trim(document.form - signin.passwd.value) == "")
                {
                    alert("password empty");
                    document.form - signin.sPwd.focus();
                    return false;
                }
            }
        </script>

    </head>

    <body class="login-body">

        <div class="login-logo">
            <img src="img/login_logo.png" alt="Aligarh Muslim University Logo"/>
            <br><h3 class="form-heading">Control Panel for Management of AMU Employee Profile</h3>
        </div>

        <h2 class="form-heading">Employee Login</h2>
        
        <%
//        String errMessage = (String)request.getAttribute("errMessage");
//        if(errMessage.equals("") || errMessage==null)
//        {
//        errMessage="";
//        }

String errMessage = request.getParameter("em");
if(errMessage==null)
{
errMessage = "";
}

        %>
        <br><br>
    <center>
        <h4>
        <label style="color: red"><%=errMessage%></label>
        </h4>
    </center>
        
        <div id="MyForm" class="container log-row">
        <br><div><h3 class="form-heading" align="center" style="color:#892611" ></h3></div>
            <br><div><h3 class="form-heading" align="center" style="color:#892611" ></h3></div>
            <form class="form-signin" method="post" action="../loginController" onSubmit="return validate();">
                <div class="login-wrap">
                    <input type="text" class="form-control" name="user" placeholder="Employee ID" autofocus required="True">
                    <input type="password" class="form-control" name="passwd" placeholder="Password" required="True">
                    <span><label>Enter the below number: </label>
                        <input type="hidden" class="form-control" value="701469" id="verifyNumHidden" name="verifyNumHidden" />
                        <input type="text" class="form-control" id="enterVerify" name="enterVerify" />
                        <div id="verifyNum" class="form-control" align="center"></div></span><br>
                    <button class="btn btn-lg btn-success btn-block" type="submit">LOGIN</button>
                    <label class="checkbox-custom check-success">
                        <input type="checkbox" value="remember-me" id="checkbox1"> <label for="checkbox1">Remember me</label>
                        <a class="pull-right"  href="sspr1.jsp"> Forgot Password?</a>
                    </label>
                </div>
            </form>
        </div>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                function randomgen()
                {
                    var rannumber = '';
                    for (ranNum = 1; ranNum <= 6; ranNum++) {
                        rannumber += Math.floor(Math.random() * 10).toString();
                    }
                    $('#verifyNum').html(rannumber);
                    $('#verifyNumHidden').val(rannumber);
                }
                randomgen();
                //Verification number generate code Ends here

                //Validation Starts Here    
                $('#MyForm').submit(function () {
                    if ($('#enterVerify').val() == $('#verifyNumHidden').val()) {
                        //                            $('form').attr('action', 'https://amu.ac.in/emp');
                        return true;
                    } else
                    {
                        alert("Please Enter Correct Verification Number");
                        randomgen();
                        $('#enterVerify').select();
                        $('#enterVerify').focus();
                        return false;
                    }
                });
            });
        </script>
        <!-- <div align='center'>
            <ul class='list-unstyled'>
                <li><b><a href="pdf/empcp.pdf"><h4 class="form-heading">Download User Manual</h4></a></b></li>
                <li><b><a href="pdf/User_Guide_ePaySlips.pdf"><h4 class="form-heading">Salary Slip's Online Display Application Manual</h4></a></b></li>
            </ul>
        </div> -->
        



        <!--jquery-1.10.2.min-->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!--Bootstrap Js-->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jrespond..min.js"></script>

    </body>
</html>
