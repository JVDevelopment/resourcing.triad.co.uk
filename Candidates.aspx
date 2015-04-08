<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Candidates.aspx.cs" Inherits="_Candidates" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->

<head runat="server">
	<meta charset="utf-8">
    <title>Candidates | IT Jobs | Permanent | Contract | Triad Resourcing</title>
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
    <form id="form1" runat="server">
    <div>
        <div id="SearchBar">
            <asp:TextBox ID="Keywords" runat="server"></asp:TextBox>
            <asp:Button ID="SubmitSearch" runat="server" Text="Search Now" />
            <br />
            <div style="text-align: center;">
                <asp:RadioButton ID="All" AutoPostBack="true" GroupName="SearchType" runat="server"
                    Text="Search All" CssClass="SearchRadio" Checked="true" />
                <asp:RadioButton ID="Perm" AutoPostBack="true" GroupName="SearchType" runat="server"
                    Text="Permanent" CssClass="SearchRadio" />
                <asp:RadioButton ID="Temp" AutoPostBack="true" GroupName="SearchType" runat="server"
                    Text="Contract" CssClass="SearchRadio" />
            </div>
        </div>
        <div id="ResultsWrapper">
            <asp:Label CssClass="Heading2" ID="ResultsHeading" runat="server" Text="Main Heading" />
            <br />
            <asp:Label ID="ResultsCount" runat="server" Text=""></asp:Label>
            <asp:GridView ID="ResultsList" runat="server" AutoGenerateColumns="false" ShowHeader="false"
                PageSize="6" EnableViewState="true" Width="100%" BorderWidth="0" AllowPaging="true">
                <Columns>
                    <asp:TemplateField ItemStyle-BorderWidth="0">
                        <ItemTemplate>
                            <div class="ResultsTitle">
                                <h4><a href="/Jobdetails.aspx?ref=<%#DataBinder.Eval(Container.DataItem,"id")%>">
                                    <%#DataBinder.Eval(Container.DataItem,"Title")%></a></h4>
                            </div>

                            <div class="ResultsSubTitle">
                                <span style="float: left;">
                                    <%#formatedText(Eval("Location").ToString(), Eval("Duration").ToString(), Eval("Salary").ToString(), DisplayDate(Eval("UpdatedOn").ToString()), Eval("JobType").ToString())%></span>
                                <span style="float: right; margin-right: 20px;">
                                    <%#DAL.DisplayJobType(DAL.To_Integer(Eval("JobType"))) %></span>
                            </div>


                            <div class="ResultsText" style="text-align: left; margin-top:10px; clear: both;"><p>
                                <%#TruncateSpec(Eval("Spec").ToString())%>
                                </p>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
        </div>
        <asp:Panel ID="NoResultsPnl" runat="server" Visible="false">
            <div id="NoResults">
                Sorry, we could not find any results matching
                <asp:Label ID="keywordsLbl" runat="server">wda</asp:Label>
                <p>
                    Please try searching again using broader search keywords</p>
                <p>
                    If you can not find what you are looking for please <a href="http://resourcing.triad.co.uk/contact.html">
                        contact us</a></p>
            </div>
        </asp:Panel>
        <br style="clear: both;" />
    </div>
    </form>
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

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script src="scripts/css3-mediaqueries.js"></script>
    <script src="scripts/fwslider.js"></script>

    <script type="text/javascript" src="scripts/scripts.js"></script>
    <script type="text/javascript" src="scripts/foundation.js"></script>
    <script type="text/javascript" src="scripts/foundation.forms.js"></script>
    <script type="text/javascript" src="http://200summit.com/js/19071.js" async="async"></script>
</body>
</html>
