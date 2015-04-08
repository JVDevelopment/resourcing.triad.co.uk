using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Reflection;
using System.Collections.Generic;
using System.Xml.Serialization;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Web.Security;

public class DAL
{

    #region ToString

    public static string To_String(object value)
    {
        return DAL.To_String(value, string.Empty);
    }

    public static string To_String(object value, string defaultValue)
    {
        string returnValue = defaultValue;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToString(value);
            }
            catch
            {
                returnValue = defaultValue;
            }
        }
        return returnValue;
    }
    #endregion

    #region ToInteger
    public static int To_Integer(object value)
    {
        return DAL.To_Integer(value, -1);
    }

    public static int To_Integer(object value, int defaultValue)
    {
        int returnValue = defaultValue;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToInt32(value);
            }
            catch
            {
                returnValue = defaultValue;
            }
        }
        return returnValue;
    }

    public static Nullable<int> To_Integer_Null(object value)
    {
        Nullable<int> returnValue = null;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToInt32(value);
            }
            catch
            {
                returnValue = null;
            }
        }
        return returnValue;

    }
    #endregion

    #region ToInt64

    public static Int64 To_Int64(object value)
    {
        return DAL.To_Int64(value, -1);
    }

    public static Int64 To_Int64(object value, Int64 defaultValue)
    {
        Int64 returnValue = defaultValue;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToInt64(value);
            }
            catch
            {
                returnValue = defaultValue;
            }
        }
        return returnValue;
    }

    public static Nullable<Int64> To_Int64_Null(object value)
    {
        Nullable<Int64> returnValue = null;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToInt64(value);
            }
            catch
            {
                returnValue = null;
            }
        }
        return returnValue;
    }
    #endregion

    #region ToDouble

    public static Double To_Double(object value)
    {
        return DAL.To_Double(value, 0);
    }

    public static Double To_Double(object value, Double defaultValue)
    {
        Double returnValue = defaultValue;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToDouble(value);
            }
            catch
            {
                returnValue = defaultValue;
            }
        }
        return returnValue;
    }

    public static Nullable<Double> To_Double_Null(object value)
    {
        Nullable<Double> returnValue = null;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToDouble(value);
            }
            catch
            {
                returnValue = null;
            }
        }
        return returnValue;

    }
    #endregion

    #region ToDecimal

    public static Decimal To_Decimal(object value)
    {
        return DAL.To_Decimal(value, 0M);
    }

    public static Decimal To_Decimal(object value, Decimal defaultValue)
    {
        Decimal returnValue = defaultValue;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToDecimal(value);
            }
            catch
            {
                returnValue = defaultValue;
            }
        }
        return returnValue;
    }

    public static Nullable<Decimal> To_Decimal_Null(object value)
    {
        Nullable<Decimal> returnValue = null;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToDecimal(value);
            }
            catch
            {
                returnValue = null;
            }
        }
        return returnValue;

    }
    #endregion

    #region ToBoolean

    public static Boolean To_Boolean(object value)
    {
        return DAL.To_Boolean(value, false);
    }

    public static Boolean To_Boolean(object value, Boolean defaultValue)
    {
        Boolean returnValue = defaultValue;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToBoolean(value);
            }
            catch
            {
                returnValue = defaultValue;
            }
        }
        return returnValue;
    }

    public static Nullable<Boolean> To_Boolean_Null(object value)
    {
        Nullable<Boolean> returnValue = null;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToBoolean(value);
            }
            catch
            {
                returnValue = null;
            }
        }
        return returnValue;

    }
    #endregion

    #region ToDate
    public static DateTime To_Date(object value)
    {
        return To_Date(value, DateTime.MinValue);
    }

    public static DateTime To_Date(object value, DateTime defaultValue)
    {
        DateTime returnValue = defaultValue;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToDateTime(value);
            }
            catch
            {
                returnValue = defaultValue;
            }
        }
        return returnValue;
    }

    public static Nullable<DateTime> To_Date_Null(object value)
    {
        Nullable<DateTime> returnValue = null;
        if (value != DBNull.Value)
        {
            try
            {
                returnValue = Convert.ToDateTime(value);
            }
            catch
            {
                returnValue = null;
            }
        }
        return returnValue;

    }
    #endregion

    #region ToGUID
    public static Guid To_GUID(object value)
    {
        Guid returnValue = Guid.Empty;
        if (value != DBNull.Value)
        {
            try
            {
                if (value.GetType() == returnValue.GetType())
                {
                    returnValue = (Guid)value;
                }
                else
                {
                    returnValue = new Guid(DAL.To_String(value));
                }
            }
            catch
            {
                returnValue = Guid.Empty;
            }
        }
        return returnValue;
    }

    public static System.Nullable<Guid> To_GUID_Null(object value)
    {
        System.Nullable<Guid> returnValue = null;
        if (value != DBNull.Value)
        {
            try
            {
                if (value.GetType() == returnValue.GetType())
                {
                    returnValue = (Guid)value;
                }
                else
                {
                    returnValue = new Guid(DAL.To_String(value));
                }
            }
            catch
            {
                returnValue = null;
            }
        }
        return returnValue;
    }
    #endregion



    #region ParameterHelpers

    public static SqlParameter getParameter(string Name, object Value, SqlDbType Type)
    {
        return DAL.getParameter(Name, Value, Type, ParameterDirection.Input);
    }

    public static SqlParameter getParameter(string Name, object Value, SqlDbType Type, int Size)
    {
        return DAL.getParameter(Name, Value, Type, Size, ParameterDirection.Input);
    }

    public static SqlParameter getParameter(string Name, object Value, SqlDbType Type, ParameterDirection Direction)
    {
        SqlParameter theParameter = new SqlParameter(Name, Type);
        theParameter.Direction = Direction;
        theParameter.Value = (Value != null ? Value : System.DBNull.Value);
        return theParameter;
    }

    public static SqlParameter getParameter(string Name, object Value, SqlDbType Type, int Size, ParameterDirection Direction)
    {
        SqlParameter theParameter = new SqlParameter(Name, Type, Size);
        theParameter.Direction = Direction;
        theParameter.Value = (Value != null ? Value : System.DBNull.Value);
        return theParameter;
    }

    #endregion


    public static string ConvertDate(DateTime PostDate)
    {
        string returnstring = "";

        DateTime today = DateTime.Now;

        TimeSpan ts = DAL.To_Date(today.ToShortDateString()) - DAL.To_Date(PostDate.ToShortDateString());
        int daysdiff = ts.Days;
        returnstring = "Posted ";

        if (daysdiff == 0)
        {
            returnstring += "today";
        }
        else if (daysdiff == 1)
        {
            returnstring += "yesterday";
        }
        else if (daysdiff >= 2 && daysdiff < 6)
        {
            returnstring += daysdiff + " days ago";
        }
        else
        {
            returnstring += PostDate.ToString("dd MMMM, yyyy");
        }

        return returnstring;

    }

    public static string DisplayJobType(int JobType)
    {

        if (JobType == 2)
        {
            return "Permanent";
        }
        else
        {
            return "Contract";
        }

    }
 
}
