package DAOs;

import DBContext.DBContext;
import Modals.accounts;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AccountDAO {

    private Connection conn = null;

    public AccountDAO() {
    }

    public accounts checkLogin(String username, String password) {
        accounts acc = null;
        DBContext cont = new DBContext();
        conn = cont.getConnection();
        String query = "SELECT * FROM [Spring-Store].[dbo].[Accounts] WHERE accountEmail=? AND accountPassword=?";
        try {
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                acc = new accounts(rs.getInt("accountID"), rs.getString("accountEmail"), rs.getString("accountPassword"),
                        rs.getString("accountName"), rs.getDate("accountDateOfBirth"), rs.getString("Phone"), rs.getString("Address"), rs.getInt("roleID"));
            }
        } catch (Exception e) {
            // Handle any exceptions here
            e.printStackTrace();
        }
        return acc;
    }

    public accounts getAccount(String account_id) {
        accounts acc = null;
        String query = "SELECT * FROM [Spring-Store].[dbo].[Accounts] WHERE accountID=?";
        try {
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, account_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                acc = new accounts(rs.getInt("accountID"), rs.getString("accountEmail"), rs.getString("accountPassword"),
                        rs.getString("accountName"), rs.getDate("accountDateOfBirth"), rs.getString("Phone"), rs.getString("Address"), rs.getInt("roleID"));
            }
        } catch (Exception e) {
        }
        return acc;
    }

  public int insertAccount(accounts acc) {
    String query = "INSERT INTO [Spring-Store].[dbo].[Accounts] "
            + "( [accountEmail], [accountPassword], [accountName], [accountDateOfBirth], [Phone], [Address], [roleID]) "
            + "VALUES (?, ?, ?, ?, ?, ?, 3)";
    int rowsAffected = 0;

    try (Connection conn = DBContext.getConnection(); // Khởi tạo kết nối
         PreparedStatement st = conn.prepareStatement(query)) {

        st.setString(1, acc.getAccountEmail());
        st.setString(2, acc.getAccountPassword());
        st.setString(3, acc.getAccountName());
        st.setDate(4, acc.getAccountDateOfBirth()); // Có thể thay đổi giá trị mặc định tùy theo yêu cầu
        st.setString(5, acc.getPhone());
        st.setString(6, acc.getAddress());

        rowsAffected = st.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace(); 
    }

    return rowsAffected;
}
   public ResultSet getAllAccounts() {
            ResultSet rs = null;
            String query = "SELECT* FROM [Spring-Store].[dbo].[Accounts]";
            try {
                  Statement st = conn.createStatement();
                  rs = st.executeQuery(query);
            } catch (Exception e) {
            }
            return rs;
      }

    public String getMd5(String input) {
        try {

            // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

}
