using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;


public class AdvertDB
{

    public static Advert GetByid(int id)
    {
        // Read a row from Tab based on key value
        Advert returnObject = new Advert();
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["TriadAdvertsConnectionString"].ToString());
        string SPName = "SearchResults_GetByid";
        SqlCommand myCommand = new SqlCommand(SPName, myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;
        myCommand.Parameters.Add(DAL.getParameter("@id", id, SqlDbType.Int));

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
            for (
            ; myReader.Read();
            )
            {
                returnObject = AdvertDB.toObject(myReader);
            }
            myReader.Close();
        }
        catch (Exception)
        {
            throw;
        }
        return returnObject;
    }


    public static bool Delete(int id)
    {
        bool returnValue = false;
        Advert returnObject = new Advert();
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["TriadAdvertsConnectionString"].ToString());
        string SPName = "SearchResults_Delete";
        SqlCommand myCommand = new SqlCommand(SPName, myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;
        myCommand.Parameters.Add(DAL.getParameter("@ReturnValue", 0, SqlDbType.Int, ParameterDirection.ReturnValue));
        myCommand.Parameters.Add(DAL.getParameter("@id", id, SqlDbType.Int));
        myConnection.Open();
        try
        {
            myCommand.ExecuteNonQuery();
            if ((DAL.To_Integer(myCommand.Parameters["@ReturnValue"].Value) >= 0))
            {
                returnValue = true;
            }
            else
            {
                returnValue = false;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return returnValue;
    }

    public static bool Create(Advert NewItem)
    {
        bool returnValue = false;
        Advert returnObject = new Advert();
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["TriadAdvertsConnectionString"].ToString());
        string SPName = "SearchResults_Create";
        SqlCommand myCommand = new SqlCommand(SPName, myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;
        myCommand.Parameters.Add(DAL.getParameter("@ReturnValue", 0, SqlDbType.Int, ParameterDirection.ReturnValue));
        myCommand.Parameters.Add(DAL.getParameter("@Reference", NewItem.Reference, SqlDbType.VarChar, 50));
        myCommand.Parameters.Add(DAL.getParameter("@Title", NewItem.Title, SqlDbType.VarChar, 255));
        myCommand.Parameters.Add(DAL.getParameter("@Spec", NewItem.Spec, SqlDbType.Text));
        myCommand.Parameters.Add(DAL.getParameter("@Salary", NewItem.Salary, SqlDbType.VarChar, 200));
        myCommand.Parameters.Add(DAL.getParameter("@Duration", NewItem.Duration, SqlDbType.VarChar, 100));
        myCommand.Parameters.Add(DAL.getParameter("@StartDate", NewItem.Startdate, SqlDbType.DateTime));
        myCommand.Parameters.Add(DAL.getParameter("@Location", NewItem.Location, SqlDbType.VarChar, 100));
        myCommand.Parameters.Add(DAL.getParameter("@ContactName", NewItem.ContactName, SqlDbType.VarChar, 255));
        myCommand.Parameters.Add(DAL.getParameter("@ContactEmail", NewItem.ContactEmail, SqlDbType.VarChar, 255));
        myCommand.Parameters.Add(DAL.getParameter("@JobType", NewItem.JobType, SqlDbType.Int));
        myCommand.Parameters.Add(DAL.getParameter("@Live", NewItem.Live, SqlDbType.Int));
        myConnection.Open();
        try
        {
            myCommand.ExecuteNonQuery();
            if ((DAL.To_Integer(myCommand.Parameters["@ReturnValue"].Value) >= 0))
            {
                returnValue = true;
            }
            else
            {
                returnValue = false;
            }
        }

        catch (Exception ex)
        {
            throw ex;
        }
        return returnValue;
    }


    public static bool Update(Advert NewItem)
    {
        bool returnValue = false;
        Advert returnObject = new Advert();
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["TriadAdvertsConnectionString"].ToString());
        string SPName = "SearchResults_Update";
        SqlCommand myCommand = new SqlCommand(SPName, myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;

        myCommand.Parameters.Add(DAL.getParameter("@ReturnValue", 0, SqlDbType.Int, ParameterDirection.ReturnValue));
        myCommand.Parameters.Add(DAL.getParameter("@id", NewItem.id, SqlDbType.Int));
        myCommand.Parameters.Add(DAL.getParameter("@Reference", NewItem.Reference, SqlDbType.VarChar, 50));
        myCommand.Parameters.Add(DAL.getParameter("@Title", NewItem.Title, SqlDbType.VarChar, 255));
        myCommand.Parameters.Add(DAL.getParameter("@Spec", NewItem.Spec, SqlDbType.Text));
        myCommand.Parameters.Add(DAL.getParameter("@Salary", NewItem.Salary, SqlDbType.VarChar, 200));
        myCommand.Parameters.Add(DAL.getParameter("@Duration", NewItem.Duration, SqlDbType.VarChar, 100));
        myCommand.Parameters.Add(DAL.getParameter("@StartDate", NewItem.Startdate, SqlDbType.DateTime));
        myCommand.Parameters.Add(DAL.getParameter("@Location", NewItem.Location, SqlDbType.VarChar, 100));
        myCommand.Parameters.Add(DAL.getParameter("@ContactName", NewItem.ContactName, SqlDbType.VarChar, 255));
        myCommand.Parameters.Add(DAL.getParameter("@ContactEmail", NewItem.ContactEmail, SqlDbType.VarChar, 255));
        myCommand.Parameters.Add(DAL.getParameter("@JobType", NewItem.JobType, SqlDbType.Int));
        myCommand.Parameters.Add(DAL.getParameter("@Live", NewItem.Live, SqlDbType.Int));
        myConnection.Open();
        try
        {
            myCommand.ExecuteNonQuery();
            if ((DAL.To_Integer(myCommand.Parameters["@ReturnValue"].Value) >= 0))
            {
                returnValue = true;
            }
            else
            {
                returnValue = false;
            }
        }

        catch (Exception ex)
        {
            throw ex;
        }
        return returnValue;
    }

    public static Advert toObject(SqlDataReader Reader)
    {

        Advert returnObject = new Advert(DAL.To_Integer(Reader["id"]), DAL.To_String(Reader["Reference"]), DAL.To_String(Reader["Title"]), DAL.To_String(Reader["Spec"]), DAL.To_String(Reader["Salary"]), DAL.To_String(Reader["Duration"]), DAL.To_Date(Reader["StartDate"]), DAL.To_Date(Reader["UpdatedOn"]), DAL.To_String(Reader["Location"]), DAL.To_String(Reader["contactname"]), DAL.To_String(Reader["contactemail"]), DAL.To_Integer(Reader["JobType"]), DAL.To_Integer(Reader["Live"]));

        return returnObject;
    }



}
