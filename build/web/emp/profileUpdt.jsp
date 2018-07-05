<%-- 
    Document   : empCV
    Created on : 13 Jun, 2018, 2:33:27 AM
    Author     : Aaqib Khan
--%>


<%@page import="java.io.File"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" session="True"%>
<%@page import="javax.servlet.http.*"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>Control Panel - "AMU Employee"</title>
        <link rel="shortcut icon" href="assets/images/favicon.ico" />


        <meta name="description" content="overview &amp; stats" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <!-- bootstrap & fontawesome -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

        <!-- page specific plugin styles -->

        <!-- text fonts -->
        <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <!-- ace styles -->
        <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
        <!--[if lte IE 9]>
                <link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
        <![endif]-->
        <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

        <!--[if lte IE 9]>
          <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
        <![endif]-->

        <!-- inline styles related to this page -->

        <!-- ace settings handler -->
        <script src="assets/js/ace-extra.min.js"></script>

        <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

        <!--[if lte IE 8]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript">
            if (jQuery) {
                jQuery(function ($) {

                    $('#form_file_type_image input[type="submit"]').click(function (e) {
                        e.preventDefault();
                        var form = $('#form_file_type_image');
                        var file = $('input[type="file"]', form).val();
                        var exts = ['jpg', 'jpeg', 'gif', 'png'];
                        var msg = $('.msg', form);
                        msg.hide();

                        // first check if file field has any value
                        if (file) {
                            // split file name at dot
                            var get_ext = file.split('.');
                            // reverse name to check extension
                            get_ext = get_ext.reverse();

                            // check file type is valid as given in 'exts' array
                            if ($.inArray(get_ext[0].toLowerCase(), exts) > -1) {
                                msg.show().html('<strong style="color:#090">Allowed extension!</strong>');
                            } else {
                                msg.show().html('<strong style="color:#f00">Invalid file!</strong>');
                            }
                        } else {
                            msg.show().html('<strong style="color:#f00">Select file!</strong>');
                        }
                    });

                });
            }
        </script>
    </head>

    <body class="no-skin">
        <%@include file="header.jsp"%>

        <script type="text/javascript">
            try {
                ace.settings.loadState('main-container')
            } catch (e) {
            }
        </script>

        <div id="sidebar" class="sidebar responsive ace-save-state" >
            <script type="text/javascript">
                try {
                    ace.settings.loadState('sidebar')
                } catch (e) {
                }
            </script>

            <%@include file="emplinks.jsp"%>

        </div>

        <div class="main-content">



            <div class="page-content">


                <div class="page-header">
                    <h1>
                        Employee Profile
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            Management
                        </small>
                    </h1>
                </div>
                <br><br>

                <%  String msg = request.getParameter("msg");
                    if (msg == null || msg.equals("")) {
                        msg = "";
                    }
                    else{
                %>
                <script type="text/javascript">
                    
                       var var1 = "<%=msg%>";
                        alert(var1);
                    
                </script>
                            <%
                                }
                                String name = "";
                                String desig = "";
                                String father = "";
                                String mother = "";
                                String birthPlace = "";
                                String marital = "";
                                String nationality = "";
                                String dob = "";
                                String address = "";
                                String emailPri = "";
                                String emailSec = "";
                                String mobilePri = "";
                                String mobileSec = "";
                                String telephone = "";
                                String thrust = "";
                                String profile = "";
                                String emContact = "";
                                String emContactName = "";
                                String emContactMob = "";
                                String emContactAddress = "";
                                String empcat = "";
                                String gScholarID = "";
                                sql = "select empprofile1.pref, empprofile1.name, empprofile1.desig, empprofile1.fathername, empprofile1.mothername, empprofile1.birthPlace, empprofile1.maritalsts, empprofile1.nationality, "
                                        + "empprofile1.dob, empprofile1.address, empprofile1.emailPri, empprofile1.emailSec, empprofile1.mobilePri, empprofile1.mobileSec, empprofile1.telephone, "
                                        + "empprofile1.thrust, empprofile1.profile, empprofile1.emContact, empprofile1.emContactName, empprofile1.emContactMob, empprofile1.emContactAddress, empprofile1.empcat, "
                                        + "empprofile1.googlScholarID from empprofile1 where empprofile1.pid=?";
                                ps = con.prepareStatement(sql);
                                ps.setString(1, pid);
                                rs = ps.executeQuery();
                                while (rs.next()) {
                                    name = rs.getString(1) + " " + rs.getString(2);
                                    desig = rs.getString(3);
                                    father = rs.getString(4);
                                    mother = rs.getString(5);
                                    birthPlace = rs.getString(6);
                                    marital = rs.getString(7);
                                    nationality = rs.getString(8);
                                    dob = rs.getString(9);
                                    address = rs.getString(10);
                                    emailPri = rs.getString(11);
                                    emailSec = rs.getString(12);
                                    mobilePri = rs.getString(13);
                                    mobileSec = rs.getString(14);
                                    telephone = rs.getString(15);
                                    thrust = rs.getString(16);
                                    profile = rs.getString(17);
                                    emContact = rs.getString(18);
                                    emContactName = rs.getString(19);
                                    emContactMob = rs.getString(20);
                                    emContactAddress = rs.getString(21);
                                    empcat = rs.getString(22);
                                    gScholarID = rs.getString(23);
                                }
                                ps.close();

                                sql = "select designation from empdesig where desig_id=?";
                                ps = con.prepareStatement(sql);
                                ps.setString(1, desig);
                                rs = ps.executeQuery();
                                while (rs.next()) {
                                    desig = rs.getString(1);
                                }
                            %>

                <div class="container">
                    <div class="view-account">
                        <section class="module">
                            <div class="module-inner">
                                <!--                <div class="side-bar">
                                                    <div class="user-info">
                                                        <img class="img-profile img-circle img-responsive center-block" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                                        <ul class="meta list list-unstyled">
                                                            <li class="name">Rebecca Sanders
                                                                <label class="label label-info">UX Designer</label>
                                                            </li>
                                                            <li class="email"><a href="#">Rebecca.S@website.com</a></li>
                                                            <li class="activity">Last logged in: Today at 2:18pm</li>
                                                        </ul>
                                                    </div>
                                                        
                                                </div>-->
                                <div class="content-panel">
                                    <!--                                    <h2 class="title">Profile<span class="pro-label label label-warning">PRO</span></h2>-->
                                    <div class="form-horizontal">
                                        <div class="form-group avatar">
                                            <figure class="figure col-md-2 col-sm-3 col-xs-12">
                                                <!--<img class="img-rounded img-responsive" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">-->
                                                <%
                                                    ServletContext cntct = request.getServletContext();
                                                    String path = cntct.getRealPath("/empphoto/");
                                                    File f = new File(path + pid + ".jpg");
                                                    if (f.exists()) {
                                                %>
                                                <img class="img-rounded img-responsive" src="../empphoto/<%=pid%>.jpg" alt="employee-image" style="align-content: center">
                                                <%
                                                } else {
                                                %>
                                                <div><i class="fa fa-user fa-5x" aria-hidden="true"></i></div>
                                                    <%
                                                        }
                                                    %>
                                            </figure>
                                            <div class="form-inline col-md-10 col-sm-9 col-xs-12">
                                                <!--                                                <input type="file" class="file-uploader pull-left">-->
                                                <button type="submit" data-toggle="modal" data-target="#uploadModal" class="btn btn-sm btn-default-alt pull-left">Update Image</button>
                                            </div>
                                            <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header text-center">
                                                            <h4 class="modal-title w-100 font-weight-bold">Upload Image</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body mx-3">
                                                            <form action="../imgUpload" enctype="multipart/form-data" method="post">                                                                                                                           
                                                                <div class="md-form mb-4">
                                                                    <label data-error="wrong" data-success="right" for="orangeForm-pass">Select Image</label>
                                                                    <input type='file' name='image' id='file' onchange="loadFile(event)"><br>                                                            
                                                                </div>
                                                                <img id="output" width="500px" height="300px"/>
                                                                <script type="text/javascript">
                                                                    var loadFile = function (event) {
                                                                        var output = document.getElementById('output');
                                                                        output.src = URL.createObjectURL(event.target.files[0]);
                                                                    };
                                                                </script>
                                                                <div class="modal-footer">
                                                                    <center><button class="btn btn-default-alt">Submit</button></center>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <form action="../profileUpdate" method="post" class="form-horizontal">
                                        <input type="hidden" name="pid" value="<%=pid%>">
                                        <fieldset class="fieldset">
                                            <h3 class="fieldset-title">Personal Info</h3>

                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Name</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <input type="text" class="form-control" value="<%=name%>" readonly="true">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Designation</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <input type="text" class="form-control" value="<%=desig%>" readonly="True">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Father's Name</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <%
                                                        if (father.length() <= 0 && father != null) {
                                                    %>
                                                    <input type="text" name="father" class="form-control" value="<%=father%>" required="" pattern="^[^\s].+[^\s]$">
                                                    <%
                                                    } else {
                                                    %>
                                                    <input type="text" name="father" class="form-control" value="<%=father%>" readonly="True">
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Mother's Name</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <%
                                                        if (mother.length() <= 0 && mother != null) {
                                                    %>
                                                    <input type="text" name="mother" class="form-control" value="<%=mother%>" required="" pattern="^[^\s].+[^\s]$">
                                                    <%
                                                    } else {
                                                    %>
                                                    <input type="text" name="mother" class="form-control" value="<%=mother%>" readonly="True" >
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Place of Birth</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <%
                                                        if (birthPlace.length() <= 0 && birthPlace != null) {
                                                    %>
                                                    <input type="text" name="birthPlace" class="form-control" value="<%=birthPlace%>" required="" pattern="^[^\s].+[^\s]$">
                                                    <%
                                                    } else {
                                                    %>
                                                    <input type="text" name="birthPlace" class="form-control" value="<%=birthPlace%>" readonly="True">
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Marital Status</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <%
                                                        if (marital.length() <= 0 && marital != null) {
                                                    %>
                                                    <input type="text" name="marital" class="form-control" value="<%=marital%>" pattern="^[^\s].+[^\s]$">
                                                    <%
                                                    } else {
                                                    %>
                                                    <input type="text" name="marital" class="form-control" value="<%=marital%>" readonly="True">
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Nationality</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <%
                                                        if (nationality.length() <= 0 && nationality != null) {
                                                    %>
                                                    <input type="text" name="nationality" class="form-control" value="<%=nationality%>" required="" pattern="^[^\s].+[^\s]$">
                                                    <%
                                                    } else {
                                                    %>
                                                    <input type="text" name="nationality" class="form-control" value="<%=nationality%>" readonly="True">
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Date of Birth</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <%
                                                        if (dob.length() <= 0 && dob != null) {
                                                    %>
                                                    <input type="text" name="dob" class="form-control" value="<%=dob%>" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
                                                    <small class="text-muted">Input Date in YYYY-MM-DD format. e.g 1978-02-13 in case of 13th Feb 1978</small>
                                                    <%
                                                    } else {
                                                    %>
                                                    <input type="text" name="dob" class="form-control" value="<%=dob%>" readonly="True" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
                                                    <small class="text-muted">Input Date in YYYY-MM-DD format. e.g 1978-02-13 in case of 13th Feb 1978</small>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset class="fieldset">
                                            <h3 class="fieldset-title">Contact Info</h3>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Permanent Address</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">

                                                    <input type="text" name="address" class="form-control" value="<%=address%>" pattern="^[^\s].+[^\s]$">

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Primary Email</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">

                                                    <input type="text" name="emailPri" class="form-control" value="<%=emailPri%>" required="" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="Please enter a valid Email">
                                                    <small class="text-muted">Primary Email will not be displayed in Public Domain</small>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Secondary Email</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">

                                                    <input type="text" name="emailSec" class="form-control" value="<%=emailSec%>" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="Please enter a valid Email">
                                                    <small class="text-muted">Secondary Email will be displayed in Public Domain</small>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Primary Mobile</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">

                                                    <input type="text" name="mobilePri" class="form-control" value="<%=mobilePri%>" required="" pattern="[6-9]{1}[0-9]{9}" title="Please enter a valid mobile number">
                                                    <small class="text-muted">Primary Mobile will not be displayed in Public Domain</small>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Secondary Mobile</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">

                                                    <input type="text" name="mobileSec" class="form-control" value="<%=mobileSec%>" pattern="[6-9]{1}[0-9]{9}" title="Please enter a valid mobile number">
                                                    <small class="text-muted">Secondary Mobile will be displayed in Public Domain</small>
                                                </div>
                                            </div>

                                        </fieldset>
                                        <fieldset class="fieldset">
                                            <h3 class="fieldset-title">Emergency Contact Info</h3>
                                            <div class="form-group">
                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">Emergency Contact Person</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <select name="emContact" required="">
                                                        <option value="">Select Contact</option>
                                                        <option value="Father">Father</option>
                                                        <option value="Mother">Mother</option>
                                                        <option value="Wife">Wife</option>
                                                        <option value="Sister">Sister</option>
                                                        <option value="Brother">Brother</option>
                                                        <option value="Son">Son</option>
                                                        <option value="Daughter">Daughter</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">Emergency Contact Name</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <input type="text" name="emContactName" class="form-control" value="<%=emContactName%>" required="" pattern="^[^\s].+[^\s]$">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">Emergency Contact Mobile</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <input type="" name="emContactMob" class="form-control" value="<%=emContactMob%>" required="" pattern="[6-9]{1}[0-9]{9}" title="Please enter a valid mobile number">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">Emergency Contact Address</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <input type="text" name="emContactAddress" class="form-control" value="<%=emContactAddress%>" required="" pattern="^[^\s].+[^\s]$">
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset class="fieldset">
                                            <h3 class="fieldset-title">Professional Info</h3>
                                            <div class="form-group">
                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">Thrust Area</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <input type="text" name="thrust" class="form-control" value="<%=thrust%>" required="" pattern="^[^\s].+[^\s]$">
                                                </div>
                                            </div>
                                            <%
                                                if (empcat.equals("1")) {
                                            %>
                                            <div class="form-group">
                                                <!--                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">Thrust Area</label>-->                                                
                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label"><img src="img/gs.png" alt="googleScholar-Icon" width="50px" height="50px"/></label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <input type="text" name="gScholarID" class="form-control" value="<%=gScholarID%>" pattern="^[^\s].+[^\s]$">
                                                    <p class="help-block">Provide your google Scholar ID URLeg. https://scholar.google.co.in/citations?user=userid</p>
                                                </div>
                                            </div>
                                            <%
                                                }
                                            %>
                                            <div class="form-group">
                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">Profile</label>
                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                    <textarea class="form-control" name="profile" spellcheck="true" rows="5" pattern="^[^\s].+[^\s]$"><%=profile%></textarea>
                                                </div>
                                            </div>
                                                <input type="checkbox" id="chkbox" name="checkbox">I hereby confirm that, the particulars mentioned above are correct and I agree to save the details of mine to display it in public domain.<br><br>
                                            <hr>
                                            <div class="form-group">
                                                <div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
                                                    <input class="btn btn-primary" type="submit" id="testcheck" value="Update Profile">
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                    <hr>
                                    <fieldset class="fieldset">
                                        <h3 class="fieldset-title">Work Experience & Educational Qualifications</h3>
                                        <div class="form-group">
                                            <label class="col-md-2  col-sm-3 col-xs-12 control-label">Work Experience</label>
                                            <div class="col-md-10 col-sm-9 col-xs-12 table-responsive ">
                                                <table class=" col-md-10 col-sm-9 col-xs-12 table-striped table-responsive">
                                                    <tr>
                                                        <th>Organization</th>
                                                        <th>Designation</th>
                                                        <th>From</th>
                                                        <th>To</th>
                                                        <th>Work Description</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    <%
                                                        sql = "select * from empexp1 where pid=? order by desigFrm desc";
                                                        ps = con.prepareStatement(sql);
                                                        ps.setString(1, pid);
                                                        rs = ps.executeQuery();
                                                        if (!rs.next()) {
                                                    %>
                                                    <tr>
                                                        <td colspan="5" align="center"><strong>Awaiting to Update Professional Experience.</strong></td>                                                            

                                                    </tr>

                                                    <%
                                                    } else {
                                                        rs.beforeFirst();
                                                        ResultSet rs1 = ps.executeQuery();
                                                        while (rs1.next()) {
                                                    %>
                                                    <tr>
                                                        <td><%=rs1.getString(3)%></td>
                                                        <td><%=rs1.getString(4)%></td>
                                                        <td><%=rs1.getString(5)%></td>
                                                        <td><%=rs1.getString(6)%></td>
                                                        <td><%=rs1.getString(7)%></td>
                                                        <td><span><a href="expUpdat.jsp?id=<%=rs1.getString(1)%>"><input type="button" class="btn btn-sm btn-default-alt" value="Update"></a>&nbsp; <a href="../expDlt?id=<%=rs1.getString(1)%>"><input type="button" onclick = "if (!confirm('Are you sure to Delete this Experience')) {
                                                                    return false;
                                                                }" class="btn btn-sm btn-default-alt" value="Delete" ></a></span></td>
                                                    </tr>
                                                    <%
                                                            }
                                                            rs1.close();
                                                        }
                                                        rs.close();
                                                        ps.close();
                                                    %>



                                                </table>

                                            </div>
                                        </div>
                                        <a href="#" class="pull-right" data-toggle="modal" data-target="#myModal"><img src="img/add.png" width="30px" height="30px" alt="Add Button Image"/></a>
                                        <div class="modal fade" id="myModal" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Add Professional Experience</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="../empExp" method="post">
                                                            <input type="hidden" name="pid" value="<%=pid%>">
                                                            <div class="form-group">
                                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">Organization</label>
                                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                                    <input type="text" name ="org" required="" pattern="^[^\s].+[^\s]$">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">Designation</label>
                                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                                    <input type="text" name ="desig" required="" pattern="^[^\s].+[^\s]$">
                                                                </div>
                                                            </div><br>
                                                            <div class="form-group">
                                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">From</label>
                                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                                    <input type="text" name ="from" required="" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
                                                                    <br><small class="text-muted">Input Date in YYYY-MM-DD format.</small>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">To</label>
                                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                                    <input type="text" name ="to" required="" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
                                                                    <br><small class="text-muted">Input Date in YYYY-MM-DD format.</small>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">Work Description</label>
                                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                                    <textarea name="wrkDesc" rows="4" pattern="^[^\s].+[^\s]$">                                                                          
                                                                    </textarea>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-2  col-sm-3 col-xs-12 control-label">Current</label>
                                                                <div class="col-md-10 col-sm-9 col-xs-12">
                                                                    <input type="checkbox" id="myCheck" name="current" value="1"> 
                                                                </div>
                                                            </div>
                                                            <div class="form-group"></div>
                                                            <input type=Submit>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2  col-sm-3 col-xs-12 control-label">Educational Qualifications</label>
                                            <div class="col-md-10 col-sm-9 col-xs-12 table-responsive ">
                                                <table class=" col-md-10 col-sm-9 col-xs-12 table-striped table-responsive">
                                                    <tr>
                                                        <th>Course</th>
                                                        <th>Subjects</th>
                                                        <th>Division</th>
                                                        <th>%age of Marks</th>
                                                        <th>Name of the University/Board</th>
                                                        <th>Year of Passing</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    <%
                                                        sql = "select * from empqualif where pid=? and eduLevel in (?,?,?,?)";
                                                        ps = con.prepareStatement(sql);
                                                        ps.setString(1, pid);
                                                        ps.setString(2, "High School");
                                                        ps.setString(3, "Intermediate");
                                                        ps.setString(4, "UG");
                                                        ps.setString(5, "PG");
                                                        rs = ps.executeQuery();
                                                        if (!rs.next()) {
                                                    %>
                                                    <tr>
                                                        <td colspan="7" align="center"><strong>Awaiting to Update Educational Qualifications</strong></td>                                                            
                                                    </tr>

                                                    <%
                                                    } else {
                                                        rs.beforeFirst();
                                                        ResultSet rs1 = ps.executeQuery();
                                                        while (rs1.next()) {
                                                    %>
                                                    <tr>
                                                        <td><%=rs1.getString(4)%></td>
                                                        <td><%=rs1.getString(5)%></td>
                                                        <td><%=rs1.getString(6)%></td>
                                                        <td><%=rs1.getString(7)%></td>
                                                        <td><%=rs1.getString(8)%></td>
                                                        <td><%=rs1.getString(9)%></td>
                                                        <td class="col-md-3"><span><a href="qualifUpdate.jsp?id=<%=rs1.getString(1)%>"><input type="button" class="btn btn-sm btn-default-alt" value="Update"></a>&nbsp; <a href="../qualifDlt?id=<%=rs1.getString(1)%>"><input type="button" onclick = "if (!confirm('Are you sure to Delete this Education Detail')) {
                                                                    return false;
                                                                }" class="btn btn-sm btn-default-alt" value="Delete" ></a></span></td>

                                                    </tr>

                                                    <%
                                                            }
                                                            rs1.close();
                                                        }
                                                        rs.close();
                                                        ps.close();
                                                    %>
                                                </table>
                                            </div>
                                        </div>
                                        <a href="#" class="pull-right" data-toggle="modal" data-target="#myModal2"><img src="img/add.png" width="30px" height="30px" alt="Add Button Image"/></a>
                                        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header text-center">
                                                        <h4 class="modal-title w-100 font-weight-bold">Educational Qualifications</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body mx-3">
                                                        <form action="../qualifAdd" method="post">
                                                            <div class="md-form mb-5">                                                               
                                                                <label data-error="wrong" data-success="right" for="orangeForm-name">Education Level</label>
                                                                <select class="form-control validate" name="lvl" required="">
                                                                    <option value="">Select Course</option>
                                                                    <option value="High School">High School</option>
                                                                    <option value="Intermediate">Intermediate</option>
                                                                    <option value="UG">Under Graduation</option>
                                                                    <option value="PG">Post Graduation</option>
                                                                </select>
                                                            </div>
                                                            <div class="md-form mb-5">
                                                                <label data-error="wrong" data-success="right" for="orangeForm-email">Course</label>                                                                
                                                                <input type="text" id="orangeForm-email" class="form-control validate" name ="course" required="" pattern="^[^\s].+[^\s]$">
                                                            </div>
                                                            <div class="md-form mb-4">
                                                                <label data-error="wrong" data-success="right" for="orangeForm-pass">Subjects</label>
                                                                <input type="text" id="orangeForm-pass" class="form-control validate" name ="subj" required="" pattern="^[^\s].+[^\s]$">                                                                
                                                            </div>
                                                            <div class="md-form mb-4">
                                                                <label data-error="wrong" data-success="right" for="orangeForm-pass">Division</label>
                                                                <input type="text" id="orangeForm-pass" class="form-control validate" name ="division" required="" pattern="^[^\s].+[^\s]$">                                                                
                                                            </div>
                                                            <div class="md-form mb-4">
                                                                <label data-error="wrong" data-success="right" for="orangeForm-pass">Percentage</label>
                                                                <input type="text" id="orangeForm-pass" class="form-control" name ="percent" required="" pattern="^\d+\.\d{0,2}$">                                                                
                                                            </div>
                                                            <div class="md-form mb-4">
                                                                <label data-error="wrong" data-success="right" for="orangeForm-pass">Board / University</label>
                                                                <input type="text" id="orangeForm-pass" class="form-control validate" name ="univ" required="" pattern="^[^\s].+[^\s]$">                                                                
                                                            </div>

                                                            <div class="md-form mb-4">
                                                                <label data-error="wrong" data-success="right" for="orangeForm-pass">Year of Passout</label>
                                                                <input type="text" id="orangeForm-pass" class="form-control validate" name ="passout" required="" pattern="[1-9][0-9]{3}">                                                                
                                                            </div>


                                                            <div class="modal-footer">
                                                                <center><button class="btn btn-default-alt">Submit</button></center>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="form-group"><br></div>

                                    </fieldset>
                                    <fieldset class="fieldset">
                                        <div class="form-group">
                                            <label class="col-md-2  col-sm-3 col-xs-12 control-label">Research Qualifications</label>
                                            <div class="col-md-10 col-sm-9 col-xs-12 table-responsive ">
                                                <table class=" col-md-10 col-sm-9 col-xs-12 table-striped table-responsive">

                                                    <tr>
                                                        <th>Course</th>
                                                        <th colspan="2">Title of Research</th>
                                                        <th colspan="2">University</th>
                                                        <th>Year of Completion</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    <%
                                                        sql = "select * from empqualif where pid=? and eduLevel in (?,?)";
                                                        ps = con.prepareStatement(sql);
                                                        ps.setString(1, pid);
                                                        ps.setString(2, "PHD");
                                                        ps.setString(3, "PDF");
                                                        rs = ps.executeQuery();
                                                        if (!rs.next()) {
                                                    %>
                                                    <tr>
                                                        <td colspan="7" align="center"><strong>Awaiting to Update Research Qualifications</strong></td>                                                            
                                                    </tr>

                                                    <%
                                                    } else {
                                                        rs.beforeFirst();
                                                        ResultSet rs1 = ps.executeQuery();
                                                        while (rs1.next()) {
                                                    %>
                                                    <tr>
                                                        <td><%=rs1.getString(4)%></td>
                                                        <td colspan="2"><%=rs1.getString(5)%></td>
                                                        <td colspan="2"><%=rs1.getString(8)%></td>
                                                        <td><%=rs1.getString(9)%></td>
                                                        <td class="col-md-3"><span><a href="resUpdate.jsp?id=<%=rs1.getString(1)%>"><input type="button" class="btn btn-sm btn-default-alt reponsive" value="Update"></a><a href="../qualifDlt?id=<%=rs1.getString(1)%>"><input type="button" onclick = "if (!confirm('Are you sure to Delete this Education Detail')) {
                                                                    return false;
                                                                }" class="btn btn-sm btn-default-alt reponsive" value="Delete" ></a></span></td>
                                                    </tr>
                                                    <%
                                                            }
                                                            rs1.close();
                                                        }

                                                        rs.close();
                                                        ps.close();
                                                    %>
                                                </table>
                                            </div>

                                        </div>
                                        <a href="#" class="pull-right" data-toggle="modal" data-target="#myModal3"><img src="img/add.png" width="30px" height="30px" alt="Add Button Image"/></a>
                                        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header text-center">
                                                        <h4 class="modal-title w-100 font-weight-bold">Educational Qualifications</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body mx-3">
                                                        <form action="../researchAdd" method="post">
                                                            <div class="md-form mb-5">                                                               
                                                                <label data-error="wrong" data-success="right" for="orangeForm-name">Education Level</label>
                                                                <select class="form-control validate" name="lvl" required="">
                                                                    <option value="">Select</option>
                                                                    <option value="PHD">Ph.D</option>
                                                                    <option value="PDF">P.D.F.</option>
                                                                </select>
                                                            </div>
                                                            <div class="md-form mb-5">
                                                                <label data-error="wrong" data-success="right" for="orangeForm-email">Course</label>                                                                
                                                                <input type="text" id="orangeForm-email" class="form-control validate" name ="course" required="" pattern="^[^\s].+[^\s]$">
                                                            </div>
                                                            <div class="md-form mb-4">
                                                                <label data-error="wrong" data-success="right" for="orangeForm-pass">Title</label>
                                                                <input type="text" id="orangeForm-pass" class="form-control validate" name ="subj" required="" pattern="^[^\s].+[^\s]$">                                                                
                                                            </div>
                                                            <div class="md-form mb-4">
                                                                <label data-error="wrong" data-success="right" for="orangeForm-pass">University</label>
                                                                <input type="text" id="orangeForm-pass" class="form-control validate" name ="univ" required="" pattern="^[^\s].+[^\s]$">                                                                
                                                            </div>
                                                            <div class="md-form mb-4">
                                                                <label data-error="wrong" data-success="right" for="orangeForm-pass">Year of Completion</label>
                                                                <input type="number" id="orangeForm-pass" class="form-control" name ="passout" required="" pattern="^\d+\.\d{0,2}$">                                                                
                                                            </div>

                                                            <div class="modal-footer">
                                                                <center><button class="btn btn-default-alt">Submit</button></center>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

                                </div>
                            </div>
                        </section>
                    </div>
                </div>
                <%
                    con.close();
                %>

                <!--                        <div class="page-header">
                                            <h1>
                                                Dashboard
                                                <small>
                                                    <i class="ace-icon fa fa-angle-double-right"></i>
                                                    overview &amp; stats
                                                </small>
                                            </h1>
                                        </div> /.page-header -->


                <!-- basic scripts -->

                <!--[if !IE]> -->
                <script src="assets/js/jquery-2.1.4.min.js"></script>

                <!-- <![endif]-->

                <!--[if IE]>
        <script src="assets/js/jquery-1.11.3.min.js"></script>
        <![endif]-->
                <script type="text/javascript">
                                                            if ('ontouchstart' in document.documentElement)
                                                                document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
                </script>
                <script src="assets/js/bootstrap.min.js"></script>

                <!-- page specific plugin scripts -->

                <!--[if lte IE 8]>
                  <script src="assets/js/excanvas.min.js"></script>
                <![endif]-->
                <script src="assets/js/jquery-ui.custom.min.js"></script>
                <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
                <script src="assets/js/jquery.easypiechart.min.js"></script>
                <script src="assets/js/jquery.sparkline.index.min.js"></script>
                <script src="assets/js/jquery.flot.min.js"></script>
                <script src="assets/js/jquery.flot.pie.min.js"></script>
                <script src="assets/js/jquery.flot.resize.min.js"></script>

                <!-- ace scripts -->
                <script src="assets/js/ace-elements.min.js"></script>
                <script src="assets/js/ace.min.js"></script>
                <script type="text/javascript">
                $("#testcheck").on('click', function () {
                    if (jQuery("#chkbox").is(":checked")) {
                        return True;
                    } else {
                        alert("Please click the check box to confirm your understanding, that this data/Update is going to be published live on the University Website!");
                        return false;
                    }
                });
                </script>
                <!-- inline scripts related to this page -->
                <script type="text/javascript">
                                                            jQuery(function ($) {
                                                                $('.easy-pie-chart.percentage').each(function () {
                                                                    var $box = $(this).closest('.infobox');
                                                                    var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
                                                                    var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
                                                                    var size = parseInt($(this).data('size')) || 50;
                                                                    $(this).easyPieChart({
                                                                        barColor: barColor,
                                                                        trackColor: trackColor,
                                                                        scaleColor: false,
                                                                        lineCap: 'butt',
                                                                        lineWidth: parseInt(size / 10),
                                                                        animate: ace.vars['old_ie'] ? false : 1000,
                                                                        size: size
                                                                    });
                                                                })

                                                                $('.sparkline').each(function () {
                                                                    var $box = $(this).closest('.infobox');
                                                                    var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
                                                                    $(this).sparkline('html',
                                                                            {
                                                                                tagValuesAttribute: 'data-values',
                                                                                type: 'bar',
                                                                                barColor: barColor,
                                                                                chartRangeMin: $(this).data('min') || 0
                                                                            });
                                                                });


                                                                //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
                                                                //but sometimes it brings up errors with normal resize event handlers
                                                                $.resize.throttleWindow = false;

                                                                var placeholder = $('#piechart-placeholder').css({'width': '90%', 'min-height': '150px'});
                                                                var data = [
                                                                    {label: "social networks", data: 38.7, color: "#68BC31"},
                                                                    {label: "search engines", data: 24.5, color: "#2091CF"},
                                                                    {label: "ad campaigns", data: 8.2, color: "#AF4E96"},
                                                                    {label: "direct traffic", data: 18.6, color: "#DA5430"},
                                                                    {label: "other", data: 10, color: "#FEE074"}
                                                                ]
                                                                function drawPieChart(placeholder, data, position) {
                                                                    $.plot(placeholder, data, {
                                                                        series: {
                                                                            pie: {
                                                                                show: true,
                                                                                tilt: 0.8,
                                                                                highlight: {
                                                                                    opacity: 0.25
                                                                                },
                                                                                stroke: {
                                                                                    color: '#fff',
                                                                                    width: 2
                                                                                },
                                                                                startAngle: 2
                                                                            }
                                                                        },
                                                                        legend: {
                                                                            show: true,
                                                                            position: position || "ne",
                                                                            labelBoxBorderColor: null,
                                                                            margin: [-30, 15]
                                                                        }
                                                                        ,
                                                                        grid: {
                                                                            hoverable: true,
                                                                            clickable: true
                                                                        }
                                                                    })
                                                                }
                                                                drawPieChart(placeholder, data);

                                                                /**
                                                                 we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
                                                                 so that's not needed actually.
                                                                 */
                                                                placeholder.data('chart', data);
                                                                placeholder.data('draw', drawPieChart);


                                                                //pie chart tooltip example
                                                                var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
                                                                var previousPoint = null;

                                                                placeholder.on('plothover', function (event, pos, item) {
                                                                    if (item) {
                                                                        if (previousPoint != item.seriesIndex) {
                                                                            previousPoint = item.seriesIndex;
                                                                            var tip = item.series['label'] + " : " + item.series['percent'] + '%';
                                                                            $tooltip.show().children(0).text(tip);
                                                                        }
                                                                        $tooltip.css({top: pos.pageY + 10, left: pos.pageX + 10});
                                                                    } else {
                                                                        $tooltip.hide();
                                                                        previousPoint = null;
                                                                    }

                                                                });

                                                                /////////////////////////////////////
                                                                $(document).one('ajaxloadstart.page', function (e) {
                                                                    $tooltip.remove();
                                                                });




                                                                var d1 = [];
                                                                for (var i = 0; i < Math.PI * 2; i += 0.5) {
                                                                    d1.push([i, Math.sin(i)]);
                                                                }

                                                                var d2 = [];
                                                                for (var i = 0; i < Math.PI * 2; i += 0.5) {
                                                                    d2.push([i, Math.cos(i)]);
                                                                }

                                                                var d3 = [];
                                                                for (var i = 0; i < Math.PI * 2; i += 0.2) {
                                                                    d3.push([i, Math.tan(i)]);
                                                                }


                                                                var sales_charts = $('#sales-charts').css({'width': '100%', 'height': '220px'});
                                                                $.plot("#sales-charts", [
                                                                    {label: "Domains", data: d1},
                                                                    {label: "Hosting", data: d2},
                                                                    {label: "Services", data: d3}
                                                                ], {
                                                                    hoverable: true,
                                                                    shadowSize: 0,
                                                                    series: {
                                                                        lines: {show: true},
                                                                        points: {show: true}
                                                                    },
                                                                    xaxis: {
                                                                        tickLength: 0
                                                                    },
                                                                    yaxis: {
                                                                        ticks: 10,
                                                                        min: -2,
                                                                        max: 2,
                                                                        tickDecimals: 3
                                                                    },
                                                                    grid: {
                                                                        backgroundColor: {colors: ["#fff", "#fff"]},
                                                                        borderWidth: 1,
                                                                        borderColor: '#555'
                                                                    }
                                                                });


                                                                $('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
                                                                function tooltip_placement(context, source) {
                                                                    var $source = $(source);
                                                                    var $parent = $source.closest('.tab-content')
                                                                    var off1 = $parent.offset();
                                                                    var w1 = $parent.width();

                                                                    var off2 = $source.offset();
                                                                    //var w2 = $source.width();

                                                                    if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2))
                                                                        return 'right';
                                                                    return 'left';
                                                                }


                                                                $('.dialogs,.comments').ace_scroll({
                                                                    size: 300
                                                                });


                                                                //Android's default browser somehow is confused when tapping on label which will lead to dragging the task
                                                                //so disable dragging when clicking on label
                                                                var agent = navigator.userAgent.toLowerCase();
                                                                if (ace.vars['touch'] && ace.vars['android']) {
                                                                    $('#tasks').on('touchstart', function (e) {
                                                                        var li = $(e.target).closest('#tasks li');
                                                                        if (li.length == 0)
                                                                            return;
                                                                        var label = li.find('label.inline').get(0);
                                                                        if (label == e.target || $.contains(label, e.target))
                                                                            e.stopImmediatePropagation();
                                                                    });
                                                                }

                                                                $('#tasks').sortable({
                                                                    opacity: 0.8,
                                                                    revert: true,
                                                                    forceHelperSize: true,
                                                                    placeholder: 'draggable-placeholder',
                                                                    forcePlaceholderSize: true,
                                                                    tolerance: 'pointer',
                                                                    stop: function (event, ui) {
                                                                        //just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
                                                                        $(ui.item).css('z-index', 'auto');
                                                                    }
                                                                }
                                                                );
                                                                $('#tasks').disableSelection();
                                                                $('#tasks input:checkbox').removeAttr('checked').on('click', function () {
                                                                    if (this.checked)
                                                                        $(this).closest('li').addClass('selected');
                                                                    else
                                                                        $(this).closest('li').removeClass('selected');
                                                                });


                                                                //show the dropdowns on top or bottom depending on window height and menu position
                                                                $('#task-tab .dropdown-hover').on('mouseenter', function (e) {
                                                                    var offset = $(this).offset();

                                                                    var $w = $(window)
                                                                    if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                                                                        $(this).addClass('dropup');
                                                                    else
                                                                        $(this).removeClass('dropup');
                                                                });

                                                            })
                </script>
                </body>
                </html>

