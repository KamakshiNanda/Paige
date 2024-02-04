/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author KAMAKSHI
 */
public class CreateId {
    public String createId(Connection con) throws SQLException, ClassNotFoundException
    {
        /*Connectivity c=new Connectivity();
        Connection con=c.createConnection();*/
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT id FROM user_details ORDER BY ID DESC LIMIT 1");
        rs.next();
        String pid=rs.getString(1);
        String str="19zzz";
        if("".equals(pid))
        {
            return "00AAA";
        }
        else
        {
            char[] ch=pid.toCharArray();
            String nid=ci(ch,4);
            return nid;
        }
    }
    String ci(char []str,int i)
    {
        if(str[i]!='Z'&&str[i]!='z'&&i!=1&&i!=0)
        {
              str[i]+=1;
        }
        else if(str[i]=='Z')
        {
            str[i]='a';
        }
        else if(str[i]=='z')
        {
            str[i]='A';
            i--;
            ci(str,i);
        }
        else if(i==1 && str[i]!='9')
        {
            str[i]+=1;
        }
        else if(str[i]=='9')
        {
            str[i]='0';
            i--;
            ci(str,i);
        }
        else if(i==0)
        {
            str[i]+=1;
        }
        String str2=new String(str);
        return str2;
    }
}
