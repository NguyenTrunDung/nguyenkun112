/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import Modals.accounts;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;

/**
 *
 * @author Dell
 */
public class CustomerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();

        //
        if (path.startsWith("/CustomerController")) {
                  

            String[] s = path.split("/");
            String id = s[s.length - 1];
            AccountDAO dao = new AccountDAO();
            accounts acc = dao.getAccounts(id);
             if (acc == null) {
                response.sendRedirect("/");
            // request.getRequestDispatcher("/Register.jsp").forward(request, response);

            } else {
                HttpSession session = request.getSession();
                session.setAttribute("thongtinnguoidung", acc);
                request.getRequestDispatcher("/CustomerInformation.jsp").forward(request, response);
            }
            
         
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("editbtnName") != null && request.getParameter("editbtnName").equals("editValue")) {
          //  String ID = (String) request.getParameter("id");
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("usernameEdit");
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            accounts acc = new accounts(id, name, birthday, phone, address);
            AccountDAO dao = new AccountDAO();
            int result = dao.Update(acc);
            accounts getacc = dao.getAccounts(String.valueOf(id));
            if (result != 0) {
                HttpSession session = request.getSession();
                session.setAttribute("thongtinnguoidung", getacc);
                request.setAttribute("thongBaoCapNhat", "Chỉnh sửa thành công.");
                request.getRequestDispatcher("/CustomerInformation.jsp").forward(request, response);
            } else {
                request.setAttribute("thongBaoCapNhat", "Chỉnh sửa không thành công, vui lòng thử lại.");
                request.getRequestDispatcher("/CustomerInformation.jsp").forward(request, response);
            }
        }

      
        
          if (request.getParameter("changepassbtn") != null) {
            AccountDAO dao = new AccountDAO();

            int id = Integer.parseInt(request.getParameter("id"));
            String oldpass = request.getParameter("oldpass");
            String newpass = request.getParameter("newpass");
            String hassnewpass = hashPassword(oldpass, "MD5");
            String alertMess = "";
            accounts u1 = dao.getAccounts(String.valueOf(id));
            if (!hassnewpass.equalsIgnoreCase(u1.getAccountPassword())) {
                alertMess = "Thay đổi thất bại, hãy sai mật khẩu hiện tại";
                request.setAttribute("alertChangePassError", alertMess);
                request.setAttribute("display", "block");
                request.getRequestDispatcher("/CustomerInformation.jsp").forward(request, response);
            } else {
                accounts ac = new accounts(id, newpass);
                int result = dao.UpdatePassword(ac);
                if (result != 0) {
                    alertMess = "Thay đổi thành công, mời bạn đăng nhập lại.";
                    request.setAttribute("alertChangePassSuccess", alertMess);
                   //response.sendRedirect("/LoginController");
                    request.getRequestDispatcher("/Login.jsp").forward(request, response);

                } else {
                    alertMess = "Thay đổi thất bại, mời bạn thử lại!";
                    request.setAttribute("alertChangePass", alertMess);
                    request.getRequestDispatcher("/CustomerInformation.jsp").forward(request, response);
                }
            }

        }
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
    
    
     public String hashPassword(String password, String algorithm) {
        try {
            MessageDigest digest = MessageDigest.getInstance(algorithm);
            byte[] hashedBytes = digest.digest(password.getBytes());

            StringBuilder stringBuilder = new StringBuilder();
            for (byte b : hashedBytes) {
                stringBuilder.append(String.format("%02x", b));
            }

            return stringBuilder.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
