//Get Recruiter's email address and remove unneccessary characters
var recEmail = $("#lnkEmail").attr("href").slice(7).split('?')[0];
$(".appRecEmail").val(recEmail);

//Get Job Title from Advert
var job = $("#lbltitle").html();
$(".appJob").val(job);

//Get Recruiter's name
var contact = $("#lnkName").html();
$(".appContact").val(contact);

//Add file name next to the Browse button
$('#oFile').live('change', function () {
    for (var i = 0; i < this.files.length; i++) {  
        $(".inputval").html(this.files[i].name);
    }
});

//Slide Down Application Form
$(".appFormOpen").click( function (e) {
    e.preventDefault();
    $("#applicationForm").slideDown();
    $("html, body").animate({ scrollTop: $('#applicationForm').offset().top }, 1000);
});

$(document).prop('title', job);
