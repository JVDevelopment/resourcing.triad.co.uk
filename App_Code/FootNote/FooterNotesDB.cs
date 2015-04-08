using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;


    public class FooterNotesDB
    {

        public static FooterNotes GetFooterNotesText()
        {

            FooterNotes returnObject = new FooterNotes();
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["TriadAdvertsConnectionString"].ToString());
            string SPName = "GetFooterNotes";
            SqlCommand myCommand = new SqlCommand(SPName, myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
           
            try
            {
                myConnection.Open();
                SqlDataReader myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                for (
                ; myReader.Read();
                )
                {
                    returnObject = FooterNotesDB.toObject(myReader);
                }
                myReader.Close();
            }
            catch (Exception )
            {
                throw;
            }
 
            return returnObject;

        }

        public static FooterNotes toObject(SqlDataReader Reader)
        {

            FooterNotes returnObject = new FooterNotes(DAL.To_Integer(Reader["id"]), DAL.To_String(Reader["FooterNotes"]));

            return returnObject;
        }

    }
