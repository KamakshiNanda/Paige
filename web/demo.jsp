<%-- 
    Document   : demo
    Created on : 10 Nov, 2019, 6:34:19 PM
    Author     : KAMAKSHI
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Connectivity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            try {
            Connectivity c=new Connectivity();
            Connection con=c.createConnection();
            PreparedStatement pst=con.prepareStatement("Select frontCover from seller_book_details where id=? and isbn=? ");
            pst.setString(1,"00AAA");
            pst.setString(2,"9788179927946");
            ResultSet rs=pst.executeQuery();
            response.setContentType("text/html");
            PrintWriter pw=response.getWriter();
            
            if(rs.next())
            {
                Blob blob=rs.getBlob(1);
                //byte[] byteArray=blob.getBytes(1,(int) blob.length());
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageBytes = outputStream.toByteArray();

                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                pw.print("<h1>hey</h1>");
                pw.print("<img src='data:image/jpg;base64,"+base64Image+"' alt='image not found' height='50px' width='70px'>");
                inputStream.close();
                outputStream.close();
            }
            pw=response.getWriter();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex);
        }
        %>
    </body>
</html>
