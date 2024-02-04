    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.Connectivity;
import classes.Cryptography;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KAMAKSHI
 */
public class ChangePassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.security.NoSuchAlgorithmException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
                HttpSession session=request.getSession();
                String id,ea=session.getAttribute("ea").toString();
                String pswd=request.getParameter("pswd");
                out.print("pswd="+pswd+"<br>");
                pswd=Cryptography.cryptograph(pswd);
                Connectivity c=new Connectivity();
                Connection con=c.createConnection();
                out.print("ea="+ea+"<br>");
                PreparedStatement pst=con.prepareStatement("Select id from user_details where email=?");
                pst.setString(1,ea);
                ResultSet rs=pst.executeQuery();
                if(rs.next())
                {
                    id=rs.getString(1);
                    out.print("id="+id+"<br>");
                    pst=con.prepareStatement("update validate_password set password=? where id=?");
                    pst.setString(1, pswd);
                    pst.setString(2,id);
                    pst.execute();
                    out.print("password updated successfully.");
                }
                session.invalidate();
                response.sendRedirect("login_signup.jsp");
                c.closeConnection(con);
            }
            catch(NullPointerException e)
            {
                HttpSession session=request.getSession();
                out.print(session.getId());
                System.out.print(session.getId());
                response.sendRedirect("login_signup.jsp");
            } 
            catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
                response.getWriter().print(ex);
                response.sendRedirect("index.jsp");
            }
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
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
