<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobDetails.aspx.cs" Inherits="Details" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
 
<head runat="server">
<meta charset="utf-8">
    <title></title>
	<meta name="description" content="Triad follows strict guidelines when searching for the right candidates. Contact our recruitment team for more details.">
	<meta name="keywords" content="Resourcing, recruitment, contract recruitment, permanent recruitment, Milton Keynes">
	<meta name="author" content="Triad Resourcing">
	
	<!-- Mobile Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS -->
	
	<link rel="stylesheet" href="stylesheets/base.css">
	<link rel="stylesheet" href="stylesheets/layout.css">
	<link rel="stylesheet" href="stylesheets/skeleton.css">
	<link rel="stylesheet" href="stylesheets/font-awesome.css">
	<link rel="stylesheet" href="css/main.css" type="text/css" />
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>	
   

	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="images/favicon2.ico">
	<link rel="apple-touch-icon" href="images/apple-touch-icon2.png">
	<link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x722.png">
	<link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x1142.png">

	<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-48430077-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-59398372-1', 'auto');
  ga('send', 'pageview');

</script>
</head>
<body>
<header>
		<div id="headerWrap" class="container">
			<div id="logo">
				<a href="/"><img src="images/triad_logo.png" alt="Triad Solutions" /></a>
			</div>


			<div id="menuicons">
			<div class="menu-icon show-on-tab show-on-phone"></div>
			
			<a class="hide-on-phone icon-stack" href="http://www.linkedin.com/company/17741?trk=tyah" target="_blank">
			  <i class="icon-sign-blank icon-stack-base icon-light"></i>
			  <i class="icon-linkedin icon-white"></i>
			</a>

			<a class="hide-on-phone icon-stack" href="http://www.twitter.com/#!/TriadResourcing" target="_blank">
			  <i class="icon-sign-blank icon-stack-base icon-light"></i>
			  <i class="icon-twitter icon-white"></i>
			</a>
			</div>
 
			<nav id="topnav" class="hide-on-phone hide-on-tab"><ul>
				<li><a href="whytriad.html">Why Triad?</a></li>
				<li><a href="whoweare.html">Who We Are</a></li>
				<li><a href="expertise.html">Expertise</a></li>
				<li><a href="gis.html">GIS</a></li>
                <li class="active"><a href="candidates.aspx">Candidates</a></li>
				<li><a href="contact.html">Contact Us</a></li>
			</ul></nav>
		</div>

		<div id="headerBanner">
			<div class="container">
				<h1>Candidates</h1>
			</div>
			
		</div>

</header>
<section id="content">
	<div class="container">
    <form id="Form1" method="post" runat="server" EncType="multipart/form-data" action="applicationForm.aspx">
    <div>
        <div class="DetailsTitle">
            <asp:Label ID="lbltitle" CssClass="lbltitle" runat="server" ></asp:Label><br />
            <asp:Label ID="lblLocationRate" CssClass="lblLocationRate" runat="server"></asp:Label>
        </div>
        <div id="DetailsSpec" runat="server">
        </div>
        <table class="DetailsTable">
            <tr>
                <td style="width: 100px;" class="heading">
                    Location
                </td>
                <td style="width: 400px;">
                    <asp:Label ID="lblLocation" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="heading">
                    Start Date
                </td>
                <td>
                    <asp:Label ID="lblStartDate" runat="server"></asp:Label>
                </td>
            </tr>
         <!--   <tr>
                <td class="heading">
                    Duration
                </td>
                <td>
                    <asp:Label ID="lblDuration" runat="server"></asp:Label>
                </td>
            </tr>-->
            <tr>
                <td class="heading">
                    Reference
                </td>
                <td>
                    <asp:Label ID="lblreference" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="heading">
                    Contact
                </td>
                <td>
                    <asp:HyperLink runat="server" ID="lnkName" Text=""></asp:HyperLink>
                    on 01908 278450 or via
                    <asp:HyperLink runat="server" ID="lnkEmail" Text="Email"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="heading">
                    Posted
                </td>
                <td>
                    <asp:Label ID="lblPosted" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <div id="FooterTextPnl" class="footnotes" runat="server">
        </div>
        <div class="buttons">
        <button onclick="javascript:history.go(-1); return false;">Back</button>

         <button class="appFormOpen" onclick="applicationForm(); return false;">Apply</button>     
			

            			<div id="applicationForm" class="sixteen columns contentbox lb">
               <div class="contentpadding">
                   <h2>Application Form</h2>
             <ul>                            
                             <li>
                                <label for="appName" id="appName">Name</label>
                                <input type="text" name="appName" placeholder="Name" />
                            </li>
                             <li>
                                <label for="appEmail" id="appEmail">Email</label>
                                <input type="text" name="appEmail" placeholder="Email" />
                            </li>
                            <li>
                                <label for="appNumber" id="appNumber">Phone</label>
                                <input type="text" name="appNumber" placeholder="Phone" />
                            </li>
                             <li>
                                <label for="appMessage" id="appMessage">Message</label>
                                <textarea name="appMessage" placeholder="Message" rows="6"></textarea>
                            </li>
                              <li>
                                <label class="custom-file-upload" for="appCV" id="appCV">Upload CV</label>
                                <span class="btn btn-default btn-file btn-primary">Browse... <INPUT id="oFile" type="file" runat="server" NAME="oFile" accept=".docx,.doc,.pdf"></span>
                                  <span class="inputval"></span>
                                
                            </li>

                 
                            <li class="appFormHidden">
                                <label for="appJob" id="appJob">Position</label>
                                <input class="appJob" type="text" name="appJob"  readonly/>
                            </li>
                             <li class="appFormHidden">
                                <label for="appContact" id="appContact">Contact</label>
                                <input class="appContact" type="text" name="appContact" readonly/>
                            </li>
                            <li class="appFormHidden">
                                <label for="appRecEmail" id="appRecEmail">Contact Email</label>
                                <input class="appRecEmail" type="text" name="appRecEmail"/>
                            </li>
                
                              <li>
                                <button class="submitAppForm" onClick="_gaq.push(['_trackEvent', 'Job Application Form', 'Click']);">Submit</button>
                                  
                            </li>
                        </ul>
                   </div>
                </div>
       
</div>
    </div>
    </form>
        <br /> <br /> <br />

        
           <%--<div id="applicationForm" class="sixteen columns contentbox lb">
               <div class="contentpadding">
                   <h2>Application Form</h2>
                    <form name="applicationForm" method="post" action="applicationForm.aspx">
                        <ul>                            
                             <li>
                                <label for="appName" id="appName">Name</label>
                                <input type="text" name="appName" placeholder="Name" />
                            </li>
                             <li>
                                <label for="appEmail" id="appEmail">Email</label>
                                <input type="text" name="appEmail" placeholder="Email" />
                            </li>
                            <li>
                                <label for="appNumber" id="appNumber">Phone</label>
                                <input type="text" name="appNumber" placeholder="Phone" />
                            </li>
                             <li>
                                <label for="appMessage" id="appMessage">Message</label>
                                <textarea name="appMessage" placeholder="Message" rows="6"></textarea>
                            </li>
                              <li>
                                <label class="custom-file-upload" for="appCV" id="appCV">Upload CV</label>
                                <span class="btn btn-default btn-file btn-primary">Browse... <input type="file" name="appCV" id="appCV2" runat="server"></span>
                                
                            </li>
                            <li>
                                <label for="appJob" id="appJob">Position</label>
                                <input class="appJob" type="text" name="appJob" />
                            </li>
                             <li>
                                <label for="appContact" id="appContact">Contact</label>
                                <input class="appContact" type="text" name="appContact"/>
                            </li>
                              <li>
                                <button>Submit</button>
                                  
                            </li>
                        </ul>

                    </form>
                </div>
            </div>--%>

	</div>
	</section>
	<section id="clients">
        <div class="container">
            <div class="row">
                <div class="sixteen columns carousel">
                    <ul id="ClientCarousel">
                        <li>
                            <a href="expertise.html#knowing">
                                <div class="sliderbox">
                                    <div class="align">
                                        <h6>Knowing our Clients</h6>
                                    </div>
                                    <i class="icon-expertise icon-coffee icon-light"></i>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="expertise.html#knowing">
                                <div class="sliderbox">
                                    <div class="align">
                                        <h6>Flexible Resource model</h6>
                                    </div>
                                    <i class="icon-expertise icon-refresh icon-light"></i>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="expertise.html#knowing">
                                <div class="sliderbox">
                                    <div class="align">
                                        <h6>Trusted Business Partner</h6>
                                    </div>
                                    <i class="icon-expertise icon-heart icon-light"></i>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="expertise.html#knowing">
                                <div class="sliderbox">
                                    <div class="align">
                                        <h6>Emerging Skills</h6>
                                    </div>
                                    <i class="icon-expertise icon-search icon-light"></i>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="expertise.html#knowing">
                                <div class="sliderbox">
                                    <div class="align">
                                        <h6>Rapid Development of Teams</h6>
                                    </div>
                                    <i class="icon-expertise icon-group icon-light"></i>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="expertise.html#knowing">
                                <div class="sliderbox">
                                    <div class="align">
                                        <h6>Rare Skills</h6>
                                    </div>
                                    <i class="icon-expertise icon-puzzle-piece icon-light"></i>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="expertise.html#knowing">
                                <div class="sliderbox">
                                    <div class="align">
                                        <h6>GIS</h6>
                                    </div>
                                    <i class="icon-expertise icon-globe icon-light"></i>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="expertise.html#knowing">
                                <div class="sliderbox">
                                    <div class="align">
                                        <h6>Government Pathfinder Projects</h6>
                                    </div>
                                    <i class="icon-expertise icon-random icon-light"></i>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="expertise.html#knowing">
                                <div class="sliderbox">
                                    <div class="align">
                                        <h6>Technology Experts</h6>
                                    </div>
                                    <i class="icon-expertise icon-laptop icon-light"></i>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>


		<footer>
			<div class="container">
			<div class="row">
			<nav class="four columns alpha">
			<h5>Why Triad?</h5>
				<ul>
                    <li><a href="whytriad.html#understanding">Understanding Our Clients</a></li>
                    <li><a href="whytriad.html#identifying">Identifying Candidates</a></li>
                    <li><a href="whytriad.html#providing">Providing Solutions</a></li>
				</ul>
			</nav>

			<nav class="four columns">
			<h5>Who we are</h5>
				<ul>
                    <li><a href="whoweare.html#OurPeople">Our People</a></li>
                    <li><a href="whoweare.html#OurCredentials">Our Credentials</a></li>
                    <li><a href="whoweare.html#OurHeritage">Our Heritage</a></li>
                    <li><a href="whoweare.html#Fusion">Fusion</a></li>
				</ul>
			</nav>
			<nav class="four columns">
			<h5>Expertise</h5>
				<ul>
                    <li><a href="expertise.html#knowing">Knowing Our Clients</a></li>
                    <li><a href="expertise.html#flexible">Flexible Resource Model</a></li>
                    <li><a href="expertise.html#trusted">Trusted Business Partner</a></li>
                    <li><a href="expertise.html#emerging">Emerging Skills</a></li>
                    <li><a href="expertise.html#rapid">Rapid Development of Teams</a></li>
                    <li><a href="expertise.html#rare">Rare Skills</a></li>
                    <li><a href="expertise.html#gis">Geographic Information Systems</a></li>
                    <li><a href="expertise.html#gov">Government Pathfinder Projects</a></li>
                    <li><a href="expertise.html#tech">Technology Experts</a></li>
				</ul>
			</nav>
			<nav class="four columns omega">
			<h5>Triad Group Plc</h5>
				<ul>
                    <li><a href="http://consulting.triad.co.uk/">Triad Consulting &amp; Solutions</a></li>
                    <li><a href="#">Investor Relations</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
					</ul>
					<hr>
			<h5>Be Social</h5>
				<ul>
					<li><a href="http://www.linkedin.com/company/17741?trk=tyah" target="_blank"><span class="hide-on-phone icon-stack">
			  				<i class="icon-sign-blank icon-stack-base icon-light"></i>
			  				<i class="icon-twitter icon-white"></i>
							</span> Twitter</a></li>
					<li><a href="http://www.linkedin.com/company/17741?trk=tyah" target="_blank"><span class="hide-on-phone icon-stack">
			  				<i class="icon-sign-blank icon-stack-base icon-light"></i>
			  				<i class="icon-linkedin icon-white"></i>
							</span> LinkedIn</a></li>
				</ul>
			</nav>
			</div>
			</div>

			<div class="container">
				<div class="row">
					<div class="sixteen columns alpha omega">
						<p class="copyright">Copyright &copy;2013 Triad Group Plc</p>
					</div>
				</div>
			</div>
		</footer>

    <!-- JS -->

    
    
    <script src="scripts/css3-mediaqueries.js"></script>
    <script src="scripts/fwslider.js"></script>

    <script type="text/javascript" src="scripts/scripts.js"></script>
        <script type="text/javascript" src="scripts/appForm.js"></script>
    <script type="text/javascript" src="scripts/foundation.js"></script>
    <script type="text/javascript" src="scripts/foundation.forms.js"></script>
    <script type="text/javascript" src="http://200summit.com/js/19071.js" async="async"></script>
</body>
</html>
