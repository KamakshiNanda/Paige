/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;
import java.sql.*;
import java.sql.Connection;

/**
 *
 * @author KAMAKSHI
 */
public class Connectivity {
    public Connection createConnection() throws SQLException, ClassNotFoundException
    {
        try{
            //Connection con=DriverManager.getConnection("");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("driver loaded");    
        }
        catch(ClassNotFoundException e)
        {
            System.out.println("Cannot load driver."+e);
        }
        try{
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/paige?zeroDateTimeBehavior=convertToNull","root","");
            System.out.println("Connected!!");
            //String sql="create table trial(ID varchar(5),name varchar(10), age int,primary key(ID))";
            //Statement stmt=con.createStatement(); 
            return con;
        }
        catch(SQLException e)
        {
            System.out.println("Unable to connect."+e);
            return null;
        }
        //stmt.execute(sql);
    }
    public boolean closeConnection(Connection con)
    {
        try{
            con.close();
            return true;
        }
        catch(SQLException e)
        {
            System.out.println("Error :"+e);
            return false;
        }
    }
}

