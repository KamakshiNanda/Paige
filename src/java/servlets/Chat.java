/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.Connectivity;
import classes.Message;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Chat extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connectivity c = new Connectivity();
            Connection con = c.createConnection();
            HttpSession session = request.getSession();
            String buyer, seller="00AAH";
            if (session.getAttribute("seller") == null) {
                response.sendRedirect("shop.jsp");
            } else {
                seller = session.getAttribute("seller").toString();
            }
            if (session.getAttribute("uid") == null) {
                out.print("You have to login first.");
            } else {
                buyer = session.getAttribute("uid").toString();
                PreparedStatement pst = con.prepareStatement("Select senderID,message from chatbox where (senderID=? and recieverID=?) or (senderID=? and recieverID=?) order by time;");
                System.out.println("buyer:"+buyer);
                System.out.println("seller:"+seller);
                pst.setString(1, buyer);
                pst.setString(2, seller);
                pst.setString(3, seller);
                pst.setString(4, buyer);
                ResultSet rs = pst.executeQuery();
                rs.last();
                int rn = rs.getRow();
                rs.beforeFirst();
                System.out.println("rn=" + rn);
                Message messages[] = new Message[rn];
                int i = 0;
                while (rs.next()) {
                    System.out.println(rs.getString(1));
                    messages[i] = new Message();
                    messages[i].setSender(rs.getString(1));
                    messages[i].setMessage(rs.getString(2));
                    i++;
                }
                System.out.println("in here");
                Gson gson = new Gson();
                String json = gson.toJson(messages);
                System.out.println(json);
                if(buyer == null ? seller == null : buyer.equals(seller))
                {
                    out.print("same seller");
                }
                else
                {
                    out.print(json);
                }
                

                c.closeConnection(con);
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
        } catch (SQLException ex) {
            Logger.getLogger(Chat.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Chat.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(Chat.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Chat.class.getName()).log(Level.SEVERE, null, ex);
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
