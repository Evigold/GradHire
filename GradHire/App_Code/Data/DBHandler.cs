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


    const string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Scott\\source\\repos\\GradHire\\GradHire\\App_Data\\database.mdf;Integrated Security = True";

    /**
     * Constructor, open connection to database.mdf
     */
    public DBHandler() {

    }

    /**
     * Get tuple values for comparing keywords
     */
    public List<string> getKeywords(string col, string table) {

        DataSet ds = new DataSet();
        using (var conn = new SqlConnection(connectionString)) {
            conn.Open();
            string query = "SELECT " + col + " FROM " + table;
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ds);
        }
        
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
     * Returns a datatable from Select query
     */
    public DataTable getDataTable(string query) {
        using (var conn = new SqlConnection(connectionString)) {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }

    /**
     * Run a search procedure with parameters. DEPRECATED
     */ 
    public DataTable runSearchProcedure(string procedure, List<KeyValuePair<string, string>> parameters) {
      
        using (var conn = new SqlConnection(connectionString)) {
            conn.Open();

            using (SqlCommand cmd = new SqlCommand()) {
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = procedure;

                foreach (KeyValuePair<string, string> keyValuePair in parameters) {
                    cmd.Parameters.Add(new SqlParameter(keyValuePair.Key, keyValuePair.Value));
                }

                using (SqlDataAdapter da = new SqlDataAdapter(cmd)) {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt;
                }
            }
        }
   
    }

    /**
     * Run search procedure with no parameters. DEPRECATED
     */
    public DataTable runSearchProcedure(string procedure) {

        using (var conn = new SqlConnection(connectionString)) {
            conn.Open();

            using (SqlCommand cmd = new SqlCommand(procedure, conn)) {
                cmd.CommandType = CommandType.StoredProcedure;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd)) {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt;
                }
            }
        }

    }



}