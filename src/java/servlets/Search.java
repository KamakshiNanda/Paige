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
public class Search extends HttpServlet {

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
            System.out.println("inside search.java");
            if (request.getParameter("searchValue") != null) {
                System.out.println(request.getParameter("searchValue"));
                returnSearchResults(request,response);
            }
            else
            {
                System.out.println("search="+request.getParameter("search"));
                String search=request.getParameter("search");
                String query="Select b.isbn,b.image,s.sellingPrice,b.title,s.id from seller_book_details s,book_details b where s.isbn=b.isbn and (b.title like '%"+search+"%' or b.author like '%"+search+"%') order by s.sellingPrice";
                System.out.println("filter none");
                searchElements(out,query);
            }
        }
    }
    public void searchElements(PrintWriter out,String query) throws SQLException, ClassNotFoundException
        {
            System.out.println("Inside Default display");
            Connectivity c = new Connectivity();
            Connection con = c.createConnection();
            System.out.println("here the query is"+query);
            PreparedStatement pst= con.prepareStatement(query);
            ResultSet rs=pst.executeQuery();
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
    void returnSearchResults(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException 
    {
        PrintWriter out = response.getWriter();
        String search = request.getParameter("searchValue");
        search = search.replace("%", "!%");
        String query = "select title from book_details where title like ? ESCAPE '!'";
        Connectivity c = new Connectivity();
        Connection con = c.createConnection();
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1, "%" +search + "%");
        ResultSet rs = pst.executeQuery();
        rs.last();
        int sz = rs.getRow();
        System.out.println("size=" + sz);
        String title[] = new String[sz];
        rs.beforeFirst();
        int i = 0;
        while (rs.next()) {
            System.out.println(rs.getString(1));
            title[i] = rs.getString(1);
            i++;
        }
        System.out.println("title=" + title);
        Gson gson = new Gson();
        String json = gson.toJson(title);
        System.out.println(json);
        out.print(json);
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
            Logger.getLogger(Search.class
.getName()).log(Level.SEVERE, null, ex);
        

} catch (ClassNotFoundException ex) {
            Logger.getLogger(Search.class
.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Search.class
.getName()).log(Level.SEVERE, null, ex);
        

} catch (ClassNotFoundException ex) {
            Logger.getLogger(Search.class
.getName()).log(Level.SEVERE, null, ex);
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
