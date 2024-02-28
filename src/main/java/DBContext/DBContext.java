package DBContext;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    // Remove the static keyword to ensure each instance of DBContext has its own connection
    private Connection conn;

    public static Connection getConnection() {
        try {
            // Load the SQL Server JDBC driver
              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
           Connection conn = DriverManager.getConnection("jdbc:sqlserver://LAPTOP-2AEHU3O1\\SQLEXPRESS:1433;databaseName=Spring-Store;user=sa;password=123456;encrypt=true;trustServerCertificate=true");
            return conn; 
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        // If connection fails, return null
        return null;
    }

    public static void main(String[] args) {
        DBContext context = new DBContext();
        Connection conn = context.getConnection();
        if (conn != null) {
            System.out.println("Connected to the database successfully.");
            // Close the connection to avoid resource leaks
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        } else {
            System.out.println("Failed to connect to the database.");
        }
    }
}
