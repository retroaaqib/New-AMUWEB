  <div class="pre_footer">
            <div class="container">
                <aside id="footer_bar" class="row">
                    
                    <div class="span31" style='margin:0px;'>
                        <div class="sidepanel widget_flickr">

                        </div><!-- .sidepanel margin -->
                    </div>
                    <div class="span31">
                        <div class="sidepanel widget_flickr">
                            <a href="http://www.amu.ac.in/annreport.jsp" class="footerlink">Annual Report</a>
                            <a href="http://www.amu.ac.in/amugazette.jsp" class="footerlink">AMU Gazette</a>
                            <a href="http://www.amu.ac.in/searchamu.jsp" class="footerlink">Search Profile</a>
                            <a href="http://www.amu.ac.in/rti.jsp" class="footerlink">RTI</a>
                            <a href="http://www.amu.ac.in/directory2014.jsp" class="footerlink">Directories</a>
                            <a href="http://www.amu.ac.in/visitamu.jsp" class="footerlink">Visitors</a>
							<a href="http://www.amu.ac.in/iqac.jsp" class="footerlink">IQAC</a>
                            <a href="http://www.amu.ac.in/masjid.jsp" class="footerlink">Renovation of Jama Masjid</a>
                            <a href="http://www.amu.ac.in/ipcell.jsp" class="footerlink">Intellectual Property Cell</a>
                        </div><!-- .sidepanel -->
                    </div>
                    <div class="span31">
                        <div class="sidepanel widget_flickr">
                            <a href="http://www.amu.ac.in/weducation.jsp" class="footerlink">Women Education</a>
                            <a href="https://maps.google.co.in/maps?oe=utf-8&client=firefox-a&ie=UTF-8&q=Aligarh+Muslim+University+google+map&fb=1&gl=in&hq=Muslim+University&hnear=0x3974a48686459c8b:0x95d967276d323613,Aligarh,+Uttar+Pradesh&cid=0,0,15770041527097682328&ei=FHZ9ULTtKM_trQeHyID4AQ&ved=0CIgBEPwSMAA" class="footerlink">Maps</a>
                            <a href="http://www.amu.ac.in/iccommittee.jsp" class="footerlink">Internal Complaints Committee</a>
                            <a href="http://www.amu.ac.in/tender.jsp?did=05" class="footerlink">Purchase & Tenders</a>
                            <!-- <a href="http://www.amu.ac.in/naac.jsp?did=10069" class="footerlink">NAAC</a> -->
                            <a href="https://www.amu.ac.in/financesection.jsp?did=10113" class="footerlink">CPC</a>
							<a href="http://www.amu.ac.in/fnazar.jsp" class="footerlink">Fikr-O-Nazar</a>
			                <a href="http://www.amu.ac.in/museum.jsp" class="footerlink">Musa Dakri Museum</a>
                            <a href="http://www.amu.ac.in/crunit.jsp" class="footerlink">Chemical Research Unit</a>
                            <a href="http://www.amu.ac.in/acadprog.jsp" class="footerlink">Academic Programmes Committee</a>
                            
                        </div><!-- .sidepanel -->
                    </div>
                                        <!--<div class="span31">
                        <div class="sidepanel widget_flickr" style="text-align: center;">
                            <img src="img/logo.png" alt="">
                            
                        </div>
                    </div>-->
                    <div class="span31">
                        <div class="sidepanel widget_flickr">
                            <a href="http://www.amu.ac.in/employeedownloads.jsp?did=16" class="footerlink">Employee Services</a>
                            <a href="http://www.amu.ac.in/universitynotices.jsp?did=15" class="footerlink">Campus Notices</a>
                            <a href="http://mail.amu.ac.in/" class="footerlink">Web Mail</a>
                            <a href="http://www.amu.ac.in/amufacility.jsp" class="footerlink">Facilities</a>
                            <a href="http://www.amu.ac.in/amucentres.jsp" class="footerlink">AMU Special Centers</a>
                            <a href="http://www.amu.ac.in/universityjobs.jsp?did=13" class="footerlink">Jobs at AMU</a>
							<a href="http://www.amu.ac.in/amucentre.jsp?did=10010" class="footerlink">Computer Centre</a>
							<a href="http://www.amu.ac.in/aquatics.jsp" class="footerlink">Yusuff Ali Aquatics & Sports Complex</a>
							 
                            
                        </div><!-- .sidepanel -->
                    </div>
					
                    <div class="span31">
                        <div class="sidepanel widget_flickr">
                            <a href="http://www.amu.ac.in/taranavgal.jsp" class="footerlink">Tarana</a>
							<a href="http://www.amu.ac.in/tahzeeb.jsp?lid=Magazine" class="footerlink">Tahzeeb-ul-Akhlaq</a>
                            <a href="http://www.amu.ac.in/osoamu1.jsp" class="footerlink">OSO-AMU</a>
                            <a href="http://www.amu.ac.in/innovation.jsp" class="footerlink">Innovation Council</a>
                            <a href="http://www.amu.ac.in/ithelpdesk.jsp" class="footerlink">IT Help Desk</a>
							<a href="http://www.amu.ac.in/disclaimer.jsp" class="footerlink">Disclaimer</a>
                            <a href="http://www.amu.ac.in/heritage.jsp" class="footerlink">Heritage Cell</a>
                            <a href="http://www.amu.ac.in/greenuniv.jsp" class="footerlink">Green University Project</a>
                            

                        </div><!-- .sidepanel -->
                    </div>

                </aside>
            </div>
        </div><!-- .pre_footer -->
        

        <footer>

            <div class="footer_line container">
                <div class="copyright">&copy; 2017 Aligarh Muslim University. All Rights Reserved.</div>
                <%
    Integer hitsCount = 
      (Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 ){
      
       hitsCount = 1;
    }else{
       /* return visit */
       hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
%>
<!--<center>
<p>Total number of visits: <%= hitsCount%></p>
</center>--><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- Visitor Count : <img src="https://counter6.freecounter.ovh/private/freecounterstat.php?c=79wq4wk387j2upj2whq1tnxrezaed48b" border="0" title="free website counter" alt="free website counter"> (Since 19-07-2017)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
                    <ul class="socials_list pull-right">
                        
                        <li><a href="#" class="ico_social-facebook"></a></li>
                        <li><a href="#" class="ico_social-twitter"></a></li>
                        <li><a href="#" class="ico_social-youtube"></a></li>
                        <li><a href="#" class="ico_social-gplus"></a></li>
                        <li><a href="#" class="ico_social-dribbble"></a></li>
                        <li><a href="#" class="ico_social-delicious"></a></li>
                        <li><a href="#" class="ico_social-tumblr"></a></li>
                    </ul>
                </div><br>
                <div class="clear"></div>
                <a href="javascript:void(0)" class="btn2top"></a>
            </div>
            <div class="footer_border"></div>
        </footer>

        <script src="//code.jquery.com/ui/1.10.2/jquery-ui.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/theme.js"></script>

        <header class="fixed-menu"></header>
        <div class="layout_trigger clean_bg_cont" style="background-color:#ffffff;"></div>
        
