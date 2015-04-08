<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>


<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if gte IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
 <!--<![endif]-->
<head>
    <!-- Page Needs -->
    <meta charset="utf-8">
    <title>Triad Resourcing - Contact Us</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- CSS -->
    <link rel="stylesheet" href="stylesheets/base.css">
    <link rel="stylesheet" href="stylesheets/layout.css">
    <link rel="stylesheet" href="stylesheets/skeleton.css">
    <link rel="stylesheet" href="stylesheets/fv2.css">
    <link rel="stylesheet" href="stylesheets/font-awesome.css">
    <!--[if IE]>
    <style>
        .item .tooltip .content{ display:none; opacity:1; }
        .item .tooltip:hover .content{ display:block; }
    </style>
    <![endif]-->
    <!-- JS -->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script src="scripts/css3-mediaqueries.js"></script>
    <script src="scripts/fwslider.js"></script>
    <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
    <script type="text/javascript">

    </script>
    <script type="text/javascript" src="scripts/scripts.js"></script>
    <script type="text/javascript" src="scripts/foundation.js"></script>
    <script type="text/javascript" src="scripts/foundation.forms.js"></script>
    <script type="text/javascript" src="http://200summit.com/js/19071.js" async="async"></script>

    <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- Favicons -->
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
	
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

<body  style="height:100px; font-family: Arial, Helvetica, sans-serif;">
        <div style="display:none;">
        <form runat="server">
        <INPUT id="oFile" type="file" runat="server" NAME="oFile">
            <asp:button id="btnUpload" type="submit" text="Upload" runat="server"></asp:button>
            <asp:Panel ID="frmConfirmation" Visible="False" Runat="server">
                <asp:Label id="lblUploadResult" Runat="server"></asp:Label>
            </asp:Panel>

    </form>

    </div>
 
<script runat="server" type="text/vbscript">   

       Sub Page_Load(sender As Object, e As EventArgs)

            Dim SendResultsCC As String = "support@triad.co.uk"
            Dim smtpMailServer As String = "217.36.34.178"
            Dim smtpUsername As String = ""            
            Dim smtpPassword As String = ""
            Dim MailSubject As String = "Triad enquiry"   
   
			Dim SendResultsTo As String = Page.Request.Form("appRecEmail")
			Dim Sender_name = Page.Request.Form("appName")			
			Dim Sender_phone =  Page.Request.Form("appNumber")
			Dim Sender_email = Page.Request.Form("appEmail")
			Dim Sender_message = Page.Request.Form("appMessage")
            Dim Sender_position = Page.Request.Form("appJob")
            Dim Sender_contact = Page.Request.Form("appContact")    

            Dim Sender_cv = Page.Request.Form("appCV")   

            Dim strFileName As String
            Dim strFilePath As String
            Dim strFolder As String

            strFolder = "C:\Drivers\"

            strFileName = oFile.PostedFile.FileName
            strFileName = System.IO.Path.GetFileName(strFileName)

            strFilePath = strFolder & strFileName

            If strFileName <> Nothing Then

            If System.IO.File.Exists(strFilePath) Then
                lblUploadResult.Text = strFileName & " already exists on the server!"
                    Else
                oFile.PostedFile.SaveAs(strFilePath)
                lblUploadResult.Text = strFileName & " has been successfully uploaded."
            End If   
     
  
            Dim attachment As System.Net.Mail.Attachment

            Dim FromEmail As String = SendResultsTo
            Dim msgBody As StringBuilder = New StringBuilder("")  

            Dim sendCC As Boolean = False    

            Try

            	 msgBody.Append("Name: " & Sender_name & vbCrLf )	
                 msgBody.Append("email: " & Sender_email & vbCrLf)			 		 
				 msgBody.Append("phone: " & Sender_phone & vbCrLf)				 
				 msgBody.Append("message: " & Sender_message & vbCrLf)
                 msgBody.Append("Position: " & Sender_position & vbCrLf )
               <%--  msgBody.Append("Contact: " & Sender_contact & vbCrLf )	--%>
    	
                 <%--msgBody.Append("CV: " & Sender_cv & vbCrLf )   --%>
				
				
                msgBody.AppendLine()
                
                msgBody.Append("Browser: " & Request.UserAgent & vbCrLf & vbCrLf)
                msgBody.Append("IP Address: " & Request.UserHostAddress & vbCrLf & vbCrLf)
                msgBody.Append("Server Date & Time: " & DateTime.Now & vbCrLf & vbCrLf)

                Dim myMessage As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage()
     
              <%-- myMessage.Attachments.Add(New System.Net.Mail.Attachment("c:\Drivers\example.txt"))--%>

                
                attachment = New System.Net.Mail.Attachment(strFilePath) 'file path
                myMessage.Attachments.Add(attachment) 'attachment                              

                myMessage.To.Add(SendResultsTo)
                myMessage.CC.Add(SendResultsCC)
                myMessage.From = New System.Net.Mail.MailAddress(Sender_email)
                myMessage.Subject = MailSubject
                myMessage.Body = msgBody.ToString
                myMessage.IsBodyHtml = False
                If sendCC Then myMessage.CC.Add(FromEmail)   
                
                Dim basicAuthenticationInfo As New System.Net.NetworkCredential(smtpUsername, smtpPassword)
                Dim MailObj As New System.Net.Mail.SmtpClient(smtpMailServer)
                MailObj.Credentials = basicAuthenticationInfo
                MailObj.Send(myMessage)
              
            Catch
          
            End Try

                Else
    
            Dim attachment As System.Net.Mail.Attachment

            Dim FromEmail As String = SendResultsTo
            Dim msgBody As StringBuilder = New StringBuilder("")  

            Dim sendCC As Boolean = False    

            Try

            msgBody.Append("Name: " & Sender_name & vbCrLf )	
            msgBody.Append("email: " & Sender_email & vbCrLf)			 		 
			msgBody.Append("phone: " & Sender_phone & vbCrLf)				 
			msgBody.Append("message: " & Sender_message & vbCrLf)
            msgBody.Append("Position: " & Sender_position & vbCrLf )
           <%-- msgBody.Append("Contact: " & Sender_contact & vbCrLf )	--%>
    	
            <%--msgBody.Append("CV: " & Sender_cv & vbCrLf )   --%>				
				
            msgBody.AppendLine()
                
            msgBody.Append("Browser: " & Request.UserAgent & vbCrLf & vbCrLf)
            msgBody.Append("IP Address: " & Request.UserHostAddress & vbCrLf & vbCrLf)
            msgBody.Append("Server Date & Time: " & DateTime.Now & vbCrLf & vbCrLf)

            Dim myMessage As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage()
     
              <%-- myMessage.Attachments.Add(New System.Net.Mail.Attachment("c:\Drivers\example.txt"))--%>         

            myMessage.To.Add(SendResultsTo)
            myMessage.CC.Add(SendResultsCC)
            myMessage.From = New System.Net.Mail.MailAddress(Sender_email)
            myMessage.Subject = MailSubject
            myMessage.Body = msgBody.ToString
            myMessage.IsBodyHtml = False
            If sendCC Then myMessage.CC.Add(FromEmail)   
                
            Dim basicAuthenticationInfo As New System.Net.NetworkCredential(smtpUsername, smtpPassword)
            Dim MailObj As New System.Net.Mail.SmtpClient(smtpMailServer)
            MailObj.Credentials = basicAuthenticationInfo
            MailObj.Send(myMessage)
              
            Catch
          
            End Try
     End If
        End Sub
</script>

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

            <nav id="topnav" class="hide-on-phone hide-on-tab">
                <ul>
                    <li><a href="whytriad.html">Why Triad?</a></li>
                    <li><a href="whoweare.html">Who We Are</a></li>
                    <li><a href="expertise.html">Expertise</a></li>
                    <li><a href="candidates.aspx">Candidates</a></li>
                    <li class="active"><a href="contact.html">Contact Us</a></li>
                </ul>
            </nav>
        </div>
        <div id="headerBanner">
            <div class="container">
                <h1>Contact Us</h1>
            </div>
        </div>
    </header>
<div class="contact-content">
    <div class="row">
		<div class="sixteen columns" id="homeTitle">
		<h1> Thank you for contacting us!</h1>
	<p class="lead">We will respond to your query as soon as possible.</p>
		</div>
		</div>
   
    
    </div>

    <script type="text/javascript">
        var map;


        function initialize() {

            var settings = {
                zoom: 17,
                center: new google.maps.LatLng(52.003001, -0.701476),
                panControl: false,
                draggable: false,
                zoomControl: true,
                zoomControlOptions: {
                    style: google.maps.ZoomControlStyle.SMALL
                },
                mapTypeControl: false,
                scaleControl: false,
                streetViewControl: true,
                overviewMapControl: false,
                mapTypeControlOptions: {
                    mapTypeIds: ['Elite Map']
                },
                navigationControl: false,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var div = document.getElementById('map');
            map = new google.maps.Map(div, settings);



            var contentString = '<div id="content">' +
                // '<div id="siteNotice"><img src="http://visualidentity.co.uk/wp-content/themes/vi/images/layout/vi_logo2.png" height="90" width="180" />'+
                // '</div>'+
                // '<div id="bodyContent">'+
                // '<p>19 Diamond Court<br />Opal Drive<br />Fox Milne<br />Milton Keynes<br />MK15 0DU</p>'+
                // '</div>'+
                '</div>';

            var infowindow = new google.maps.InfoWindow({
                content: contentString
            });

            var locations = [
              ['<ul class="mapList"><li><h6>Triad Milton Keynes</h6></li><li>St Andrews House</li><li>Caldecotte Lake Drive</li><li>Caldecotte Lake Business Park</li><li>Milton Keynes</li><li>MK7 8LE</li></ul>', 52.003001, -0.701476, 2],
              ['<ul class="mapList"><li><h6>Triad Godalming</h6></li><li>Huxley House</li><li>Weyside Park</li><li>Catteshall Lane</li><li>Godalming</li><li>U7 1XE</li></ul>', 51.188018, -0.597618, 1]
            ];

            var marker, i;

            for (i = 0; i < locations.length; i++) {
                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                    map: map
                });

                google.maps.event.addListener(marker, 'click', (function (marker, i) {
                    return function () {
                        infowindow.setContent(locations[i][0]);
                        infowindow.open(map, marker);
                    }
                })(marker, i));
            }


            var companyPos = new google.maps.LatLng(51.594855, -0.342808);
        }

        google.maps.event.addDomListener(window, 'load', initialize);

        function clickroutemil() {
            var latLng = new google.maps.LatLng(52.003001, -0.701476); //Makes a latlng
            map.panTo(latLng); //Make map global
        }

        function clickroutegod() {
            var latLng = new google.maps.LatLng(51.188018, -0.597618); //Makes a latlng
            map.panTo(latLng); //Make map global
        }

    </script>

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
                        <li>
                            <a href="http://www.linkedin.com/company/17741?trk=tyah" target="_blank">
                                <span class="hide-on-phone icon-stack">
                                    <i class="icon-sign-blank icon-stack-base icon-light"></i>
                                    <i class="icon-twitter icon-white"></i>
                                </span> Twitter
                            </a>
                        </li>
                        <li>
                            <a href="http://www.linkedin.com/company/17741?trk=tyah" target="_blank">
                                <span class="hide-on-phone icon-stack">
                                    <i class="icon-sign-blank icon-stack-base icon-light"></i>
                                    <i class="icon-linkedin icon-white"></i>
                                </span> LinkedIn
                            </a>
                        </li>
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
    <script src="http://dropthebit.com/demos/validator/multifield.js"></script>
    <script src="http://dropthebit.com/demos/validator/validator.js"></script>
    <script>
        // initialize the validator function
        validator.message['date'] = 'not a real date';

        // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
        $('form')
			.on('blur', 'input[required], input.optional, select.required', validator.checkField)
			.on('change', 'select.required', validator.checkField);

        $('.multi.required')
			.on('keyup', 'input', function () {
			    validator.checkField.apply($(this).siblings().last()[0]);
			}).on('blur', 'input', function () {
			    validator.checkField.apply($(this).siblings().last()[0]);
			});

        // bind the validation to the form submit event
        //$('#send').click('submit');//.prop('disabled', true);

        $('form').submit(function (e) {
            e.preventDefault();
            var submit = true;
            // evaluate the form using generic validaing
            if (!validator.checkAll($(this))) {
                submit = false;
            }

            if (submit)
                this.submit();
            return false;
        });

        /* FOR DEMO ONLY */
        $('#vfields').change(function () {
            $('form').toggleClass('mode2');
        }).prop('checked', false);

        $('#alerts').change(function () {
            validator.defaults.alerts = (this.checked) ? false : true;
            if (this.checked)
                $('form .alert').remove();
        }).prop('checked', false);
    </script>
    <script>
        if (!('placeholder' in document.createElement('input'))) {
            var inputs = $('input[placeholder]'),
                dateDefault;

            inputs.each(function () {
                $(this).val(this.getAttribute('placeholder'));
            });

            inputs.on({
                focus: function () {
                    var $this = $(this);

                    dateDefault = this.getAttribute('placeholder');
                    $this.val() === dateDefault && $this.val('');
                },

                blur: function () {
                    var $this = $(this);

                    $this.val() === '' && $this.val(dateDefault);
                }
            });
        }

    </script>




</body>
</html>
