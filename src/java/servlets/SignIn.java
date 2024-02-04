/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.Connectivity;
import classes.CreateId;
import classes.Cryptography;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import static javafx.application.Platform.exit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kamakshi
 */
public class SignIn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String fullname, email, password,fname,lname;
            int ra,gu=0;
            ResultSet rs;
            Statement st;
            PreparedStatement pst;
            System.out.println("Id created");
            Connectivity c=new Connectivity();
            CreateId cid=new CreateId();
            if(request.getParameter("ea")!=null)
            {
                    String ea=request.getParameter("ea").toString();
                    Connection con = c.createConnection();
                    pst=con.prepareStatement("Select id from user_details where email=?");
                    pst.setString(1,ea);
                    rs=pst.executeQuery(); 
                    if(rs.next())
                    {
                        out.print("This email is already registered.");
                    }
            }
            else
            {
                try (Connection con = c.createConnection()) {
                    //st= con.createStatement();
                    String id=cid.createId(con);
                    if(request.getParameter("flname")==null)
                    {
                       //getting user details if the user tries to sign in through our sign in form
                       fname=request.getParameter("fname");
                       lname=request.getParameter("lname");
                       fullname=fname+" "+lname;
                       email=request.getParameter("emailaddress");
                    }
                    else
                    {
                        //getting user details if the user tries to sign in through the google link
                        out.print("google user: "+request.getParameter("flname"));
                        gu=1;//flag set to 1 to signify a google user
                        fullname=request.getParameter("flname");
                        email=request.getParameter("email");
                    }
                    pst=con.prepareStatement("Select id from user_details where email=?");
                    pst.setString(1,email);
                    rs=pst.executeQuery(); 
                    if(rs.next())
                    {
                        out.println("This email is already registered.");
                        id=rs.getString(1);
                    }
                    else
                    {
                        System.out.print("This email is already registered in user_details table.");
                        pst=con.prepareStatement("Insert into user_details values(?,?,?)");
                        pst.setString(1, id);
                        pst.setString(2,fullname);
                        pst.setString(3,email);
                        ra=pst.executeUpdate();
                        System.out.println("You are successfully registered into USER_DETAILS table.");
                    }
                     if(gu==0)
                        {
                            pst=con.prepareStatement("Select id from validate_password where id=?");
                            pst.setString(1,id);
                            rs=pst.executeQuery(); 
                            if(rs.next())
                            {
                                System.out.print("<br>"+"This email is already registered in validatepassword.");
                            }
                            else{
                                password=request.getParameter("pswd");
                                password=Cryptography.cryptograph(password);
                                pst=con.prepareStatement("Insert into validate_password values(?,?)");
                                pst.setString(1, id);
                                pst.setString(2, password);
                                ra=pst.executeUpdate();
                                System.out.println(ra+" rows affected in password table in VALIDATE_PASSWORD table.");
                            }
                            c.closeConnection(con);
                            response.sendRedirect("login_signup.jsp");
                        }
                        else
                        {
                            password=request.getParameter("idtoken");
                            pst=con.prepareStatement("Select id from validate_googleuser where id=?");
                            pst.setString(1,id);
                            rs=pst.executeQuery(); 
                            if(rs.next())
                            {
                                pst=con.prepareStatement("update validate_googleuser set id_token=? where id=?");
                                pst.setString(1, password);
                                pst.setString(2,id);
                                pst.executeUpdate();
                                System.out.print("<br>"+"Google ID token updated");
                            }
                            else
                            {
                                pst=con.prepareStatement("insert into validate_googleuser values(?,?)");
                                pst.setString(1, id);
                                pst.setString(2,password);
                                pst.executeUpdate();
                                System.out.print("<br>"+"Google ID token inserted.");
                            }
                            c.closeConnection(con);
                            HttpSession session=request.getSession();
                            session.setAttribute("uid", id);
                            System.out.println("uid="+id);
                            System.out.println("sessionid="+session.getId());
                            System.out.print("Successfully logged in through google account.");
                            response.sendRedirect("index.jsp");
                    }
                      
                }
                catch(Exception e)
                {
                    System.out.println("unable to connect. "+e);
                    exit();
                }
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
            Logger.getLogger(SignIn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignIn.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SignIn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignIn.class.getName()).log(Level.SEVERE, null, ex);
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
