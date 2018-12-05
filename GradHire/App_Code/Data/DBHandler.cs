using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBHandler
/// </summary>
public class DBHandler {

    SqlConnection connection;
    SqlDataAdapter adapter;

    /**
     * Constructor, open connection to database.mdf
     */
    public DBHandler() {
        connection = new SqlConnection(("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Scott\\source\\repos\\GradHire\\GradHire\\App_Data\\database.mdf;Integrated Security=True"));
        connection.Open();
    }

    /**
     * Get tuple values for comparing keywords
     */
    public List<string> getKeywords(string col, string table) {

        string query = "SELECT " + col + " FROM " + table;
        SqlDataAdapter da = new SqlDataAdapter(query, connection);
        DataSet ds = new DataSet();
        da.Fill(ds);

        List<string> keywords = new List<string>();
        foreach (DataRow row in ds.Tables[0].Rows) {
            string str = row[col].ToString().ToLower();
            string[] words = str.Split(' ');
            foreach (string word in words) {
                keywords.Add(word);
            }
        }

        return keywords;
    }

    /**
     * Returns a dataset from Select query
     */
    public DataSet getDataSet(string query) {
        SqlDataAdapter da = new SqlDataAdapter(query, connection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
}