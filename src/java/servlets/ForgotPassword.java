/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.Connectivity;
import classes.Mailer;
//import classes.Mailer;
import classes.Main;
import classes.OneTimePassword;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
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
public class ForgotPassword extends HttpServlet {
    /*protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String ea=request.getParameter("ea");
            //String userotp=request.getParameter("otp");
            if(true)
            {
                Connectivity c=new Connectivity();
                Connection con=c.createConnection();
                PreparedStatement pst=con.prepareStatement("select id from user_details where email=?");
                pst.setString(1,ea);
                ResultSet rs=pst.executeQuery();
                if(rs.next())
                {
                    out.print("User found");
                    System.out.println("User found");
                    OneTimePassword otp=new OneTimePassword();
                    System.out.println("object of otp class is generated.");
                    int OTP=otp.generateOTP();
                    System.out.println("The otp is generated and it is."+OTP);
                    String msg="We heard that you lost your Paige password.\n\nYour one time password for resetting your password is "+OTP+".\n\nIf you don't use this OTP within 10 minutes, it will expire.\n\nThanks,\nTeam Paige";
                    System.out.println("Message Generated.");
                    try
                    {
                    Mailer.send("paige.ttp2019@gmail.com","kamakshi@3010",ea,"[Paige] Reset your password",msg);
                    }
                    catch(Exception e)
                    {
                        System.out.println(e);
                        /*System.out.println(e.getMessage());
                        System.out.println(e.getCause());
                        System.out.println(e.getStackTrace());
                        System.out.println(e.getLocalizedMessage());*/
                   /* }
                }
                else
                {
                    out.print("Cannot find user");
                }
                c.closeConnection(con);
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
            /*System.out.println(e.getMessage());
            System.out.println(e.getCause());
            System.out.println(e.getStackTrace());
            System.out.println(e.getLocalizedMessage());*/
       /* }
    }
*/

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
            try (PrintWriter out = response.getWriter()) {
            String ea=request.getParameter("ea");
            String userotp=request.getParameter("otp");
            if(userotp==null)
            {
                Connectivity c=new Connectivity();
                Connection con=c.createConnection();
                PreparedStatement pst=con.prepareStatement("select id from user_details where email=?");
                pst.setString(1,ea);
                ResultSet rs=pst.executeQuery();
                if(rs.next())
                {
                    out.print("User found");
                    OneTimePassword otp=new OneTimePassword();
                    int OTP=otp.generateOTP();
                    System.out.println("The otp is generated and it is."+OTP);
                    Calendar mycal = Calendar.getInstance();  
                    long millis=mycal.getTimeInMillis();
                    HttpSession session=request.getSession();
                    session.setAttribute("otp", OTP);
                    session.setAttribute("ea",ea);
                    session.setAttribute("millis",millis);
                    String msg="We heard that you lost your Paige password.\n\nYour one time password for resetting your password is "+OTP+".\n\nIf you don't use this OTP within 10 minutes, it will expire.\n\nThanks,\nTeam Paige";
                    try
                    {
                      Mailer mailer=new Mailer();
                      mailer.send("paige.ttp2019@gmail.com","kamakshi@3010",ea,"[Paige] Reset your password",msg);
                      System.out.println("Mail sent.");
                      //Main main=new Main();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                }
                else
                {
                    out.print("Cannot find user");
                }
                c.closeConnection(con);
            }
            else
            {
                try
                {
                    //String userotp=request.getParameter("otp");
                    HttpSession session=request.getSession();
                    String otp=session.getAttribute("otp").toString();
                    Calendar mycal = Calendar.getInstance();  
                    long millis=mycal.getTimeInMillis();
                    long millis2=Long.parseLong(session.getAttribute("millis").toString());
                    if((millis-millis2)/60000>=3)
                    {
                        //out.print("millis="+millis+"millis2="+millis2+"difference="+((millis-millis2)/60000));
                        out.print("OTP is expired");
                        session.invalidate();
                    }
                    else if(otp.equals(userotp))
                    {
                        out.print("Correct OTP.");
                        session.removeAttribute("otp");
                    }
                    else
                    {
                        out.print("Invalid OTP.");
                        
                    }
                }
                catch(NullPointerException e2)
                {
                    out.print("OTP Expired");
                }
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
            /*System.out.println(e.getMessage());
            System.out.println(e.getCause());
            System.out.println(e.getStackTrace());
            System.out.println(e.getLocalizedMessage());*/
        }
    }
        
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */

}
