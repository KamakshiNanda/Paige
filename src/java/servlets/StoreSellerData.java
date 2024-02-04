/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.Connectivity;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class StoreSellerData extends HttpServlet {

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
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String mn,state,city,pc;
            int de=0,dm=0;
            System.out.println("here");
            mn=request.getParameter("mobileNumber");
            state=request.getParameter("state");
            city=request.getParameter("city");
            pc=request.getParameter("pincode");
            String select[]=request.getParameterValues("checkboxes");
            if (select != null && select.length != 0) 
            {
                if(select.length==1){
                    if(select[0].equals("de"))
                        de=1;
                    else
                        dm=1;
                }
                if(select.length==2){
                    de=1;
                    dm=1;
                }
            }
            System.out.println("initialized");
            HttpSession session=request.getSession();
            String id;
            if(session.getAttribute("uid")==null)
            {
                response.sendRedirect("login_signup.jsp");
            }
            else
            {
                id=session.getAttribute("uid").toString();
                Connectivity c=new Connectivity();
                Connection con;
                con = c.createConnection();
                System.out.println("connected");
                PreparedStatement pst=con.prepareStatement("insert into seller_details values(?,?,?,?,?,?,?)");
                pst.setString(1,id);
                pst.setString(2,mn);
                pst.setString(3,state);
                pst.setString(4,city);
                pst.setString(5,pc);
                pst.setInt(6,dm);
                pst.setInt(7,de);
                System.out.println("inserted");
                int i=pst.executeUpdate();
                out.print("Data stored in database.<br>"+i+" row affected.");
                c.closeConnection(con);
                response.sendRedirect("BookInformation.jsp");
            }
            
        }
        catch (SQLException ex) {
                response.getWriter().print("cannot store");
                Logger.getLogger(StoreSellerData.class.getName()).log(Level.SEVERE, null, ex);
            } 
        catch (ClassNotFoundException ex) {
                response.getWriter().print("cannot store");
                Logger.getLogger(StoreSellerData.class.getName()).log(Level.SEVERE, null, ex);
            }
        catch(Exception e)
        {
            System.out.println("error"+e);
            //response.sendRedirect("login_signup.html");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
