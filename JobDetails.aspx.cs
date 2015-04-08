using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int Reference = DAL.To_Integer(Request.QueryString["ref"], -1);

        if (Reference > 1)
        {
            // Get the job details
            Advert JobDetails = Advert.GetByid(Reference);
            FooterNotes NewFooterText = FooterNotes.GetFooterNotesText();

            if (JobDetails.id > 0)
            {
                StringBuilder EmailURL = new StringBuilder();

                lbltitle.Text = JobDetails.Title;
                DetailsSpec.InnerHtml = JobDetails.Spec.Replace(char.ConvertFromUtf32(13), "<br/ >");


                lblLocationRate.Text = JobDetails.Location ;
                if (JobDetails.Salary.Length > 1) lblLocationRate.Text = lblLocationRate.Text + " , " + JobDetails.Salary;
                
                lblLocation.Text = JobDetails.Location;
                lblreference.Text = JobDetails.Reference.ToString();
                lblDuration.Text = JobDetails.Duration.ToString();
                lblStartDate.Text = String.Format("{0:d/M/yyyy}", JobDetails.Startdate);
                lblPosted.Text = String.Format("{0:d/M/yyyy}", JobDetails.UpdatedOn);
                EmailURL.Append("mailto:");
                EmailURL.Append(JobDetails.ContactEmail.ToString());
                EmailURL.Append("?subject=Job Ref: ");
                EmailURL.Append(JobDetails.Reference.ToString());

                lnkName.Text = JobDetails.ContactName.ToString();
                lnkName.NavigateUrl = EmailURL.ToString();

                lnkEmail.NavigateUrl = EmailURL.ToString();



                if (NewFooterText.Id > 0)
                {
                    FooterTextPnl.InnerHtml = NewFooterText.FooterNotesText.ToString();
                }
            }
        }
    }
}
