/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.CompressImage;
import classes.Connectivity;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig(maxFileSize = 169999999)
/**
 *
 * @author KAMAKSHI
 */
public class StoreBookDetails extends HttpServlet {

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
            HttpSession session=request.getSession();
            if(session.getAttribute("uid")!=null)
            {
                String id=session.getAttribute("uid").toString();
                if(!"Not Found".equals(request.getParameter("sr")))
                {
                    String isbn,thumbnail,author,title,cat,desc,pub,pd,ar,pc,rc,mr;
                    isbn=request.getParameter("isbn");
                    System.out.println("isbn:"+isbn);
                    thumbnail=request.getParameter("tn2");
                    System.out.println("thumbnail="+thumbnail);
                    author=request.getParameter("authors2");
                    title=request.getParameter("title2");
                    cat=request.getParameter("cat2");
                    desc=request.getParameter("desc2");
                    pub=request.getParameter("pd2");
                    pd=request.getParameter("pd2");
                    ar=request.getParameter("ar2");
                    pc=request.getParameter("pc2");
                    rc=request.getParameter("rc2");
                    mr=request.getParameter("mr2");
                    out.print("isbn:"+request.getParameter("isbn")+"<br>");
                    out.print("thumbnail:"+request.getParameter("tn2")+"<br>");
                    out.print("author:"+request.getParameter("authors2")+"<br>");
                    out.print("title:"+request.getParameter("title2")+"<br>");
                    out.print("category:"+request.getParameter("cat2")+"<br>");
                    out.print("description:"+request.getParameter("desc2")+"<br>");
                    out.print("publiser: "+request.getParameter("pub2")+"<br>");
                    out.print("published date:"+request.getParameter("pd2")+"<br>");
                    out.print("average rating:"+request.getParameter("ar2")+"<br>");
                    out.print("page count:"+request.getParameter("pc2")+"<br>");
                    out.print("ratings count:"+request.getParameter("rc2")+"<br>");
                    out.print("maturity rating:"+request.getParameter("mr2")+"<br>");   
                    Connectivity c=new Connectivity();
                    Connection con;
                    con = c.createConnection();
                    System.out.println("connected");
                    PreparedStatement pst=con.prepareStatement("select title from book_details where isbn=?");
                    pst.setString(1,isbn);
                    ResultSet rs=pst.executeQuery();
                    if(rs.next())
                    {
                        System.out.println("Details for the given isbn are already stored.");
                    }
                    else
                    {
                        System.out.println("Storing details for this isbn");
                        pst=con.prepareStatement("insert into book_details values(?,?,?,?,?,?,?,?,?,?,?,?)");
                        pst.setString(1,isbn);
                        pst.setString(2,title);
                        pst.setString(3,thumbnail);
                        pst.setString(4,author);
                        pst.setString(5,pub);
                        pst.setString(6,pd);
                        pst.setString(7,cat);
                        pst.setString(8,desc);
                        pst.setString(9,pc);
                        pst.setString(10,ar);
                        pst.setString(11,rc);
                        pst.setString(12,mr);
                        System.out.println("inserted");
                        int i=pst.executeUpdate();
                        out.print("Data stored in database.<br>"+i+" row affected.");
                        c.closeConnection(con);
                    }
                }
                else{
                    System.out.println("No book was found for the given isbn.");
                }
                
                
                //creating variables to store values
                String isbn,binding,condition,category,language,oprice,sprice,rprice,description;
                //stroing values in variables
                isbn=request.getParameter("isbn");
                
                Connectivity c=new Connectivity();
                Connection con;
                con = c.createConnection();
                System.out.println("connected");
                //check if the same seller has already uploaded the same book
                PreparedStatement pst=con.prepareStatement("select category from seller_book_details where isbn=? and id=?");
                pst.setString(1,isbn);
                pst.setString(2,id);
                ResultSet rs=pst.executeQuery();
                if(rs.next())
                {
                        System.out.println("Book Details for the given isbn and id are already stored.");
                }
                else
                {
                    //storing values in variables
                    binding=request.getParameter("binding");
                    condition=request.getParameter("condition");
                    language=request.getParameter("language");
                    oprice=request.getParameter("oprice");
                    sprice=request.getParameter("sprice");
                    rprice=request.getParameter("rprice");
                    description=request.getParameter("comment");
                    category=request.getParameter("category");
                    //printing the variables
                    out.print("<h1>"+"Info by the seller"+"</h1><br>");
                    out.print("isbn:"+isbn+"<br>");
                    out.print("binding:"+binding+"<br>");
                    out.print("category:"+category+"<br>");
                    out.print("condition:"+condition+"<br>");
                    out.print("oprice:"+oprice+"<br>");
                    out.print("language:"+language+"<br>");
                    out.print("sprice: "+sprice+"<br>");
                    out.print("rprice:"+rprice+"<br>");
                    out.print("description:"+description+"<br>");

                    //storing first image in filePart
                    Part filePart1=request.getPart("fp1");
                    out.print("<br>filePart="+filePart1);
                    System.out.println("\nfilePart="+filePart1);
                    InputStream is1=null;
                    if(filePart1!=null)
                    {
                        long size=filePart1.getSize();
                        String content=filePart1.getContentType();
                        ByteArrayOutputStream baos=CompressImage.compress(filePart1);
                        is1 = new ByteArrayInputStream(baos.toByteArray());
                        //is1=filePart1.getInputStream();
                        System.out.println("size of is1"+is1.available());
                        out.print("<br>size="+size+"<br>content="+content);
                        
                    }
                    
                    //storing first image in filePart2
                    Part filePart2=request.getPart("fp2");
                    out.print("<br>filePart="+filePart2);
                    System.out.println("\nfilePart="+filePart2);
                    InputStream is2=null;
                    if(filePart2!=null)
                    {
                        long size=filePart2.getSize();
                        String content=filePart2.getContentType();
                        ByteArrayOutputStream baos=CompressImage.compress(filePart2);
                        is2 = new ByteArrayInputStream(baos.toByteArray());
                        System.out.println("size of is2"+is2.available());
                        out.print("<br>size="+size+"<br>content="+content);
                        System.out.print("<br>size="+size+"<br>content="+content);
                    }

                    //storing first image in filePart3
                    Part filePart3=request.getPart("fp3");
                    out.print("<br>filePart="+filePart3);
                    System.out.println("\nfilePart="+filePart3);
                    InputStream is3=null;
                    if(filePart3!=null)
                    {
                        long size=filePart3.getSize();
                        String content=filePart3.getContentType();
                        ByteArrayOutputStream baos=CompressImage.compress(filePart3);
                        is3 = new ByteArrayInputStream(baos.toByteArray());
                        out.print("<br>size="+size+"<br>content="+content);
                        System.out.print("<br>size="+size+"<br>content="+content);
                    }

                    //storing first image in filePart4
                    Part filePart4=request.getPart("fp4");
                    out.print("<br>filePart="+filePart4);
                    System.out.println("\nfilePart="+filePart4);
                    InputStream is4=null;
                    if(filePart4!=null)
                    {
                        long size=filePart4.getSize();
                        String content=filePart4.getContentType();
                        ByteArrayOutputStream baos=CompressImage.compress(filePart4);
                        is4 = new ByteArrayInputStream(baos.toByteArray());
                        out.print("<br>size="+size+"<br>content="+content);
                        System.out.print("<br>size="+size+"<br>content="+content);
                    }
                    //storing first image in filePart5
                    Part filePart5=request.getPart("fp5");
                    out.print("<br>filePart="+filePart5);
                    System.out.println("\nfilePart="+filePart5);
                    InputStream is5=null;
                    if(filePart5!=null)
                    {
                        long size=filePart5.getSize();
                        String content=filePart5.getContentType();
                        ByteArrayOutputStream baos=CompressImage.compress(filePart5);
                        is5 = new ByteArrayInputStream(baos.toByteArray());
                        out.print("<br>size="+size+"<br>content="+content);
                        System.out.print("<br>size="+size+"<br>content="+content);
                    }
                    System.out.println("Storing details for this isbn");
                    pst=con.prepareStatement("insert into seller_book_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    pst.setString(1,id);
                    pst.setString(2,isbn);
                    pst.setTimestamp(3, new java.sql.Timestamp(System.currentTimeMillis()));
                    pst.setString(4,category);
                    pst.setString(5,condition);
                    pst.setString(6,language);
                    pst.setString(7,binding);
                    pst.setBlob(8,is1);
                    System.out.println("size of is1"+is1.available());
                    pst.setBlob(9,is2);
                    System.out.println("size of is2"+is2.available());
                    pst.setBlob(10,is3);
                    System.out.println("size of is3"+is3.available());
                    pst.setBlob(11,is4);
                    System.out.println("size of is4"+is4.available());
                    pst.setBlob(12,is5);
                    System.out.println("size of is5"+is5.available());
                    pst.setString(13,description);
                    pst.setString(14,oprice);
                    pst.setString(15,sprice);
                    pst.setString(16,rprice);
                    System.out.println("inserted");
                    int i=pst.executeUpdate();
                    out.print("Data stored in database.<br>"+i+" row affected.");
                    c.closeConnection(con);
                }
                response.sendRedirect("MyBooks.jsp");
            }
            else
            {
                response.sendRedirect("login_signup.jsp");
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
            Logger.getLogger(StoreBookDetails.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StoreBookDetails.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(StoreBookDetails.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StoreBookDetails.class.getName()).log(Level.SEVERE, null, ex);
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
