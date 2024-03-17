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
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Acer
 */
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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
        boolean flag = false;
        HttpSession session = request.getSession();

        if (path.endsWith("/LoginController")) {

            Cookie[] cookies = request.getCookies();

            if (session.getAttribute("acc") == null || cookies == null) {

                System.out.println("cookiees null" + flag);
                System.out.println("session.getAttribute" + " " + session.getAttribute("acc"));
                // response.sendRedirect("/LoginController");

                request.getRequestDispatcher("/Login.jsp").forward(request, response);

            } else {
                if (cookies != null) {

                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("user") && !cookie.getValue().equals("") || cookie.getName().equals("staff") && !cookie.getValue().equals("")) {
                            request.setAttribute("id", cookie.getValue());
                            flag = true;
                            break;
                        }
                    }
                }

                if (flag) {
                    System.out.println("flag" + flag);
                    response.sendRedirect("/");
                }
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
        if (request.getParameter("btnLogin") != null) {
            String username = request.getParameter("email1");
            String password = request.getParameter("password1");
            boolean rememberMe = "on".equals(request.getParameter("remember"));

            AccountDAO aD = new AccountDAO();
            accounts acc = aD.checkLogin(username, getMd5(password));
            if (acc != null) {
                request.getSession().setAttribute("", username);
                //
//                request.getRequestDispatcher("newjsp.jsp").forward(request, response);
                if (rememberMe) {
                    Cookie cookie = new Cookie("loginCookie", username);
                    cookie.setMaxAge(20 * 24 * 60 * 60);
                    response.addCookie(cookie);
                } else {

                    Cookie[] cookies = request.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("loginCookie")) {
                                cookie.setMaxAge(0);
                                response.addCookie(cookie);
                                break;
                            }
                        }
                    }
                }
                HttpSession session = request.getSession();
                if (acc.getRoleID() == 1) {
                    Cookie cAdmin = new Cookie("admin", String.valueOf(acc.getAccountID()));
                    session.setAttribute("acc", acc);
                    request.setAttribute("id", String.valueOf(acc.getAccountID()));

                    Cookie cAdmin2 = new Cookie("admiName", URLEncoder.encode(acc.getAccountName(), "UTF-8"));
                    cAdmin.setMaxAge(60 * 60);
                    cAdmin2.setMaxAge(60 * 60);
                    response.addCookie(cAdmin);
                    response.addCookie(cAdmin2);
                    response.sendRedirect("/RoleController/Admin");
                } else if (acc.getRoleID() == 3) {
                    Cookie cStaff = new Cookie("staff", String.valueOf(acc.getAccountID()));
                    session.setAttribute("acc", acc);
                    request.setAttribute("id", String.valueOf(acc.getAccountID()));

                    Cookie cStaff2 = new Cookie("staffName", URLEncoder.encode(acc.getAccountName(), "UTF-8"));
                    cStaff.setMaxAge(60 * 60);
                    cStaff2.setMaxAge(60 * 60);
                    response.addCookie(cStaff);
                    response.addCookie(cStaff2);
                    response.sendRedirect("/RoleController/Staff");
                } else {
                    Cookie c = new Cookie("user", String.valueOf(acc.getAccountID()));
                    session.setAttribute("acc", acc);
              //      session.setAttribute("id", String.valueOf(acc.getAccountID()));
                    Cookie cfull = new Cookie("userName", URLEncoder.encode(acc.getAccountName(), "UTF-8"));
                    c.setMaxAge(60 * 60);
                    cfull.setMaxAge(60 * 60);
                    response.addCookie(c);
                    response.addCookie(cfull);
                    response.sendRedirect("/RoleController/Customer");
                }
            } else {
                //
                request.setAttribute("error", "Username or password is wrong");
                request.getRequestDispatcher("/Login.jsp").forward(request, response);
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
