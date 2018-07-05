<%-- 
    Document   : index.jsp
    Created on : Jul 4, 2017, 1:47:11 PM
    Author     : sdc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" session="True"%>

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
<!--                <div class="ace-settings-container" id="ace-settings-container">
                    <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                        <i class="ace-icon fa fa-cog bigger-130"></i>
                    </div>

                    <div class="ace-settings-box clearfix" id="ace-settings-box">
                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <div class="pull-left">
                                    <select id="skin-colorpicker" class="hide">
                                        <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                        <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                        <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                        <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                    </select>
                                </div>
                                <span>&nbsp; Choose Skin</span>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
                                <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
                                <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
                                <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
                                <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
                                <label class="lbl" for="ace-settings-add-container">
                                    Inside
                                    <b>.container</b>
                                </label>
                            </div>
                        </div> /.pull-left 

                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
                                <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
                                <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
                                <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                            </div>
                        </div> /.pull-left 
                    </div> /.ace-settings-box 
                </div> /.ace-settings-container -->
                <p>
                    Lorem ipsum dolor sit amet, eum at blandit referrentur. Mei at putant assueverit instructior, duo ea propriae laboramus, ne dolor ponderum vel. Ius et appareat posidonium. Est cu exerci quidam graeco, ad rebum doctus aeterno sea.

                    Dicunt commodo ea has. Ceteros consectetuer pri eu. Utinam aliquando appellantur ne nec, nam persecuti intellegam dissentiet in. Denique consetetur complectitur eum ea. Quo alii disputationi at, vidisse civibus ea eos, ex mundi percipit adipiscing mel. Has te erat epicuri, mutat dolorum albucius sit ad.

                    Et his falli quaestio dissentias, meis dicta per id. Nec ut errem labore, sed hinc iusto exerci ut. Eu ius eirmod diceret deleniti. Ex labore hendrerit nec, eam cu nullam dissentias, suas assueverit eu mea. Ut facilisi honestatis vim, ea nam quod mediocrem. No est quas definiebas quaerendum, mea hinc elit harum ne.

                    Legimus maluisset quo an. Nibh erroribus rationibus id vel. Cum diam inciderint et. At utroque vulputate eam. Dictas audiam eleifend ei usu.

                    Vidit apeirian adipiscing duo at. Ex sea eius brute facilisis, liber adolescens mel et. Cum fugit pertinacia referrentur ad. Vix bonorum patrioque expetendis et, mea vidit nullam an. Alia dictas eam at. His at euismod deseruisse, quidam option et nam, mel ei tantas posidonium. Pro eu partiendo dissentiunt, no sanctus persecuti quaerendum nam, noster gubergren mea no.

                    Sit eius lorem ea, cum alia postea reprimique eu. At cum illum torquatos repudiandae. At putant iuvaret nam, ex vix rebum periculis pertinacia. Sit an choro detracto. Pro ancillae convenire abhorreant ea.

                    Novum latine meliore te per, has percipit delicatissimi ea, ut vis libris diceret sanctus. Vide justo repudiare mea no. Tota minimum eos in, et vix paulo dolorem constituam, ut nec clita laudem gubergren. Vix at dicta fuisset dissentias. Vivendo erroribus concludaturque est ei.

                    An eam semper explicari assentior, oratio efficiantur his te. Ex saperet dignissim consequuntur pro. Vel ea commodo equidem. At malis graece efficiendi mel, in sed dico adhuc tibique. No usu diam possim cetero. Usu utinam verear cu, ius ex facete viderer facilisis.

                    Everti fabellas definitiones no usu, ne vim explicari salutatus. Sed nonumy ornatus no, vim at case cibo. At possit legendos platonem per. Vel ferri prima maiestatis ex, ex sit elit paulo tincidunt, usu id dicat audire.

                    Tation lucilius moderatius ei nam. Mel ne nusquam alienum salutatus, admodum offendit et eum, numquam conclusionemque ut has. Tamquam percipitur quaerendum vim cu, no suavitate gloriatur vituperata eam. Ut feugiat docendi pertinax eos, hinc nullam est ei, cu vim mutat feugait consequat.
                <%
                con.close();
                %>
                </p>
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
