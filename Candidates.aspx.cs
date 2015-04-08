using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ParseFullText;
using System.Text;
using System.Configuration;

public partial class _Candidates : System.Web.UI.Page
{

    override protected void OnInit(EventArgs e)
    {
        base.OnInit(e);
        ResultsList.PageIndexChanging += new GridViewPageEventHandler(ResultsList_PageIndexChanging);
        SubmitSearch.Command += new CommandEventHandler(this.SubmitSearch_Click);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        DoSearch();
    }

    void SubmitSearch_Click(Object sender, CommandEventArgs e)
    {
        DoSearch();
    }

    void ResultsList_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        ResultsList.PageIndex = e.NewPageIndex;
        DoSearch();
    }

    public static string cleanSearchString(string stringIn, bool inflectional = true)
    {
        if (stringIn.Length == 0)
        {
            return "";
        }

        //Determine whether to perform an inflectional search - i.e. FORMSOF(INFLECTIONAL, "search term")
        FullTextSearchOptions myFTSOptions = default(FullTextSearchOptions);
        if (inflectional)
        {
            myFTSOptions = FullTextSearchOptions.Default;
        }
        else
        {
            myFTSOptions = FullTextSearchOptions.None;
        }

        ParseFullText.FullTextSearch myFTS = new ParseFullText.FullTextSearch(stringIn, myFTSOptions);
        return myFTS.NormalForm;
    }

    public string DisplayDate(string Datetime)
    {

        return DAL.ConvertDate(DAL.To_Date(Datetime));
    }


    private void DoSearch()
    {
        if (Keywords.Text.Length > 0)
        {

            SearchResults ResultsObject = SearchResults.Search(cleanSearchString(Keywords.Text.ToString()), GetSearchType());

            if (ResultsObject.Count > 0)
            {
                NoResultsPnl.Visible = false;
                ResultsList.DataSource = ResultsObject;
                ResultsList.DataBind();
                ResultsHeading.Text = ResultsObject.Count.ToString() + " results found.";

            }
            else
            {
                ResultsList.DataSource = null;
                ResultsList.DataBind();
                ResultsHeading.Text = "";
                keywordsLbl.Text = "\"" + Keywords.Text.ToString() + "\"";
                // Keywords.Text = "";
                NoResultsPnl.Visible = true;
            }

        }
        else
        {
            NoResultsPnl.Visible = false;
            ResultsHeading.Text = "Latest opportunities";
            SearchResults ResultsObject = SearchResults.GetLatest(GetSearchType());
            ResultsList.DataSource = ResultsObject;
            ResultsList.DataBind();
        }
    }


    private int GetSearchType()
    {
        if (All.Checked)
        {
            return -1;
        }
        else if (Perm.Checked)
        {
            return 2;
        }
        else
        {
            return 1;
        }

    }

    public string formatedText(string Location, string Duration, string Salary, string UpdatedOn, string JobType)
    {

        StringBuilder ReturnString = new StringBuilder();
        if (Location.Length > 1)
        {
            ReturnString.Append("Location: " + Location);
        }
        

        if (Duration.Length > 0 && JobType != "2")
        {
            if (ReturnString.Length > 0) ReturnString.Append(" - ");
            ReturnString.Append(Duration);
        }

        if (Salary.Length > 1)
        {
            if (ReturnString.Length > 0) ReturnString.Append(" - ");
            ReturnString.Append(Salary);
        }

        if (ReturnString.Length > 0) ReturnString.Append(" - ");
        ReturnString.Append(UpdatedOn);

        return ReturnString.ToString();
    }

    public string TruncateSpec(string SpecText)
    {

        int TrimLength = DAL.To_Integer(ConfigurationManager.AppSettings["Trimlength"]);

        if (SpecText.Length >= (TrimLength - 1))
        {

            SpecText += ".&nbsp;.&nbsp;.&nbsp;.&nbsp;";
        }
        return SpecText;
    }

}