/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.Connectivity;
import classes.SingleProductWrapper;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KAMAKSHI
 */
public class displayServlet extends HttpServlet {
    Connectivity c;
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            System.out.println("got the request");
            if(request.getParameter("sortBy")!=null)
            {
                String query="Select b.isbn,b.image,s.sellingPrice,b.title,s.id from seller_book_details s,book_details b where s.isbn=b.isbn order by s.uploadDate";
                System.out.println("filter none");
                if(request.getParameter("sortBy")!="price")
                {
                    defaultDisplay(out,query);
                }
                else
                {
                    sortBy(out,query);
                }
                
            }
            else if(request.getParameter("price")==null)
            { 
                String query="Select b.isbn,b.image,s.sellingPrice,b.title,s.id from seller_book_details s,book_details b where s.isbn=b.isbn order by s.sellingPrice";
                System.out.println("filter none");
                defaultDisplay(out,query);
            }
            else
            {
                System.out.println("got a filter");
                applyFilter(request,response);
            }
        }
        
    }
    public void sortBy(PrintWriter out,String query) throws SQLException, ClassNotFoundException
        {
            System.out.println("Inside Default display");
            c = new Connectivity();
            con = c.createConnection();
            System.out.println("here the query is"+query);
            pst= con.prepareStatement(query);
            rs=pst.executeQuery();
            rs.last();
            int rn=rs.getRow();
            SingleProductWrapper spw[]=new SingleProductWrapper[rn];
            rs.beforeFirst();
            int i=0;
            while(rs.next())
            {
                System.out.println("i="+i);
                System.out.println(rs.getString(1));
                System.out.println(rs.getString(2));
                System.out.println(rs.getInt(3));
                System.out.println(rs.getString(4));
                System.out.println(rs.getString(5));
                spw[i]=new SingleProductWrapper(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5));
                i++;
            }
            String isbn;
            int spwlen=spw.length;
            for(i=0;i<spwlen;i++)
            {
                isbn=spw[i].getISBN();
                String sellers[]=new String[30];
                int len=0;
                for(int j=i+1;j<spwlen;j++)
                {
                    if(spw[j].getISBN().equals(isbn))
                    {
                        //System.out.println("equal isbn "+isbn+" and"+spw[j].getISBN());
                        sellers[len]=spw[j].getSid();
                        len++;
                        for(int l=j+1;l<spw.length;l++)
                        {
                            spw[l-1]=spw[l];
                        }
                        j--;
                        spwlen--;
                    }
                    if(j==spwlen-1&&len>0)
                    {
                       String []arr=new String[len];
                       for(int l=0;l<sellers.length&&sellers[l]!=null;l++)
                       {
                           arr[l]=sellers[l];
                       }
                       spw[i].setSellers(arr);
                    }
                }
            }
            SingleProductWrapper spwarr[]=new SingleProductWrapper[spwlen];
            for(i=0;i<spwlen;i++)
            {
                spwarr[i]=spw[i];
            }
            Gson gson = new Gson();
            String json=gson.toJson(spwarr);
            System.out.println(json);
            out.print(json);
            
            c.closeConnection(con);
        }
    public void applyFilter(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException
    {
        System.out.println("inside applyFilter");
         try (PrintWriter out = response.getWriter()) {
            String where,query="Select b.isbn,b.image,s.sellingPrice,b.title,s.id from seller_book_details s,book_details b where s.isbn=b.isbn ",orderBy=" order by s.sellingPrice";
            
            int c=0;
            System.out.println("price="+request.getParameter("price"));
            where="and s.sellingPrice<"+request.getParameter("price");
            c++;
            if(request.getParameter("category")!=null)
            {
                System.out.println("category="+request.getParameter("category"));
                where+=" and s.category='"+request.getParameter("category").toLowerCase()+"'";
            }
            if(request.getParameter("condition")!=null)
            {
                System.out.println("condition="+request.getParameter("condition"));
                String[] con = request.getParameter("condition").split(",", 0);
                for(int i=0;i<con.length;i++)
                {
                    if(i==0)
                    {
                        where+=" and (s.bookCondition='"+con[i].toLowerCase()+"'";
                    }
                    else
                    {
                         where+=" or s.bookCondition='"+con[i].toLowerCase()+"'";
                    }
                   System.out.println("con="+con[i]); 
                }
                where+=")";
            }
            if(request.getParameter("binding")!=null)
            {
                System.out.println("binding="+request.getParameter("binding"));
                String[] bind = request.getParameter("binding").split(",", 0);
                for(int i=0;i<bind.length;i++)
                {
                    if(i==0)
                    {
                        where+=" and (s.binding='"+bind[i].toLowerCase()+"'";
                    }
                    else
                    {
                         where+=" or s.binding='"+bind[i].toLowerCase()+"'";
                    }
                   System.out.println("bind="+bind[i]); 
                }
                where+=")";
            }
            if(request.getParameter("language")!=null)
            {
                System.out.println("language="+request.getParameter("language"));
                String[] lang = request.getParameter("language").split(",", 0);
                for(int i=0;i<lang.length;i++)
                {
                    if(i==0)
                    {
                        where+=" and (s.language='"+lang[i].toLowerCase()+"'";
                    }
                    else
                    {
                         where+=" or s.language='"+lang[i].toLowerCase()+"'";
                    }
                   System.out.println("lang="+lang[i]); 
                }
                where+=")";
            }
             System.out.println("query="+query+where+orderBy);
             query+=where;
             query+=orderBy;
            defaultDisplay(out,query);
         }
         catch(Exception e)
         {
             System.out.println("exception"+e);
         }
    }
    public void defaultDisplay(PrintWriter out,String query) throws SQLException, ClassNotFoundException
        {
            System.out.println("Inside Default display");
            c = new Connectivity();
            con = c.createConnection();
            System.out.println("here the query is"+query);
            pst= con.prepareStatement(query);
            rs=pst.executeQuery();
            rs.last();
            int rn=rs.getRow();
            SingleProductWrapper spw[]=new SingleProductWrapper[rn];
            rs.beforeFirst();
            int i=0;
            while(rs.next())
            {
                System.out.println("i="+i);
                System.out.println(rs.getString(1));
                System.out.println(rs.getString(2));
                System.out.println(rs.getInt(3));
                System.out.println(rs.getString(4));
                System.out.println(rs.getString(5));
                spw[i]=new SingleProductWrapper(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5));
                i++;
            }
            String isbn;
            int spwlen=spw.length;
            for(i=0;i<spwlen;i++)
            {
                isbn=spw[i].getISBN();
                String sellers[]=new String[30];
                int len=0;
                for(int j=i+1;j<spwlen;j++)
                {
                    if(spw[j].getISBN().equals(isbn))
                    {
                        //System.out.println("equal isbn "+isbn+" and"+spw[j].getISBN());
                        sellers[len]=spw[j].getSid();
                        len++;
                        for(int l=j+1;l<spw.length;l++)
                        {
                            spw[l-1]=spw[l];
                        }
                        j--;
                        spwlen--;
                    }
                    if(j==spwlen-1&&len>0)
                    {
                       String []arr=new String[len];
                       for(int l=0;l<sellers.length&&sellers[l]!=null;l++)
                       {
                           arr[l]=sellers[l];
                       }
                       spw[i].setSellers(arr);
                    }
                }
            }
            SingleProductWrapper spwarr[]=new SingleProductWrapper[spwlen];
            for(i=0;i<spwlen;i++)
            {
                spwarr[i]=spw[i];
            }
            Gson gson = new Gson();
            String json=gson.toJson(spwarr);
            System.out.println(json);
            out.print(json);
            
            c.closeConnection(con);
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
            Logger.getLogger(displayServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(displayServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(displayServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(displayServlet.class.getName()).log(Level.SEVERE, null, ex);
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
