<%-- 
    Document   : empCV
    Created on : 13 Jun, 2018, 2:33:27 AM
    Author     : Aaqib Khan
--%>


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

        <div id="sidebar" class="sidebar responsive ace-save-state">
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
                        Upload Complete CV
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            Employee CV
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
                %>
                <center>
                    <%                        String status = "";
                        String email = "";
                        String email2 = "";
                        String eml = "";
                        String did = "";
                        String name = "";
                        String desig = "";
                        sql = "select emailPri,emailSec,did,pref,name,desig from empprofile1 where pid=?";
                        ps = con.prepareStatement(sql);
                        ps.setString(1, pid);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            email = rs.getString(1);
                            email2 = rs.getString(2);
                            did = rs.getString(3);
                            name = rs.getString(4) + " " + rs.getString(5);
                            desig = rs.getString(6);
                        }
                        if (email.equals("") && email2.equals("")) {
                    %>
                    <div class="alert alert-warning" role="alert">
                        <strong>Please Update your email Id to apply for Institutional Email Id.</strong>
                    </div>
                    <%
                        } else {
                            if (email.length() > 0 || email2.length() > 0) {
                                eml = email;
                            } else if (email.length() > 0 || email2.length() <= 0) {
                                eml = email;
                            } else {
                                eml = email2;
                            }
                        }
                        rs.close();
                        ps.close();
                        String time = "";
                        
                        sql = "select status, updated_at from empictrequest where pid = ? and reqCat=?";
                        ps = con.prepareStatement(sql);
                        ps.setString(1, pid);
                        ps.setString(2, "Email");
                        rs = ps.executeQuery();
                        if (!rs.next()) {
                    %>
                    <div class="alert alert-warning" role="alert">
                        <strong>Online Request for Institutional Email ID (@amu.ac.in) for Employees</strong><br><br>
                        <strong>Declaration :</strong><br>
                        <p>I have read through and understood all the policies and guidelines regarding the use of Internet, Email and Wi-Fi facilities at Aligarh Muslim University. I agree to abide by the policies,guidelines,rules and regulations of the University related to the internet, email and Wi-Fi usage</p><br><br>

                        <a href="https://www.amu.ac.in/pdf/cc/ISP.pdf">Information Security Policy of the University</a><br><br>

                        <input type="checkbox" id="chkbox" name="checkbox">Please check to confirm<br><br>
                        <form action="../emailApply" method="post">
                            <input type="hidden" name="pid" value="<%=pid%>">
                            <input type="hidden" name="email" value="<%=eml%>">
                            <input type="hidden" name="did" value="<%=did%>">
                            <input type="hidden" name="name" value="<%=name%>">
                            <input type="hidden" name="desig" value="<%=desig%>">
                            <input type="submit" class="btn btn-default-alt" value="Apply" id="testcheck">

                        </form>
                    </div>
                    <%
                        } else {
                            status = rs.getString(1);
                            time = rs.getString(2);
                        }
                        rs.close();
                        ps.close();
                        if (status.equals("Applied")) {
                    %>
                    <div class="alert alert-warning" role="alert">
                        <strong>Your request is pending for Verification at the end of your Head of Department.</strong>
                    </div>
                    <%
                    } else if (status.equals("Verified")) {
                    %>
                    <div class="alert alert-warning" role="alert">
                        <strong>Your request has been verified and forwarded to Computer Centre, Your request shall be fulfilled shortly.</strong>
                    </div>
                    <%
                    } else if (status.equals("Declined")) {
                    %>
                    <div class="alert alert-warning" role="alert">
                        <strong>Your request can not be fulfilled at this point in time due to license constraints. Kindly bear with us till we upgrade our user licenses.</strong>
                    </div>
                    <%
                    } else {
                    %>
<!--                    <div class="alert alert-warning" role="alert">
                        <strong>Your email is already issued and communicated at <%=time%>. For further queries Please write to us at emailadmin@amu.ac.in</strong>
                    </div>-->
                    <%
                        }
                        con.close();
                    %>
                </center>

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
                        alert("Please click the check box to confirm the declaration!");
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