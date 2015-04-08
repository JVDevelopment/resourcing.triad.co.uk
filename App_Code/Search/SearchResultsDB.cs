using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

 
    public class SearchResultsDB
    {
        public static SearchResults GetLatest(int SearchType)
        {
            
            // Get the length of the Advert Spec to be displayed on results view
            int TrimLength = DAL.To_Integer(ConfigurationManager.AppSettings["Trimlength"]);


            // Read a row from Tab based on key value
            SearchResults returnObject = new SearchResults();
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["TriadAdvertsConnectionString"].ToString());
            string SPName = "SearchResults_GetLatest";
            SqlCommand myCommand = new SqlCommand(SPName, myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.Add(DAL.getParameter("@JobType", SearchType, SqlDbType.Int));
            myCommand.Parameters.Add(DAL.getParameter("@TrimLength", TrimLength, SqlDbType.Int));
            try
            {
                myConnection.Open();
                SqlDataReader myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                for (
                ; myReader.Read();
                )
                {
                    returnObject.Add(AdvertDB.toObject(myReader));
                }
                myReader.Close();
            }
            catch (Exception )
            {
                throw;
            }
            return returnObject;
        }

        public static SearchResults Search(String keywords, int SearchType)
        {

            // Get the length of the Advert Spec to be displayed on results view
            int TrimLength = DAL.To_Integer(ConfigurationManager.AppSettings["Trimlength"]);
            
            // Read a row from Tab based on key value
            SearchResults returnObject = new SearchResults();
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["TriadAdvertsConnectionString"].ToString());
            string SPName = "SearchResults_Search";
            SqlCommand myCommand = new SqlCommand(SPName, myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.Add(DAL.getParameter("@keywords", keywords, SqlDbType.VarChar ));
            myCommand.Parameters.Add(DAL.getParameter("@JobType", SearchType, SqlDbType.Int));
            myCommand.Parameters.Add(DAL.getParameter("@TrimLength", TrimLength, SqlDbType.Int));
            try
            {
                myConnection.Open();
                SqlDataReader myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                for (
                ; myReader.Read();
                )
                {
                    returnObject.Add(AdvertDB.toObject(myReader));
                }
                myReader.Close();
            }
            catch (Exception)
            {
                throw;
            }
            return returnObject;
        }

        public static SearchResults GetAll(int filter)
        {
            // Read a row from Tab based on key value
            SearchResults returnObject = new SearchResults();
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["TriadAdvertsConnectionString"].ToString());
            string SPName = "SearchResults_GetAll";
            SqlCommand myCommand = new SqlCommand(SPName, myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.Add(DAL.getParameter("@filter", filter, SqlDbType.Int));
            try
            {
                myConnection.Open();
                SqlDataReader myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                for (
                ; myReader.Read();
                )
                {
                    returnObject.Add(AdvertDB.toObject(myReader));
                }
                myReader.Close();
            }
            catch (Exception)
            {
                throw;
            }
            return returnObject;
        }

    }