/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;
import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;    

/**
 *
 * @author KAMAKSHI
 */

public class Mailer {
    public void send(String from,String password,String to,String sub,String msg2){  
          //Get properties object    
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");    
          //get Session   
          Session session = Session.getInstance(props,    
           new javax.mail.Authenticator() {    
           @Override
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject(sub);    
           message.setText(msg2);    
           //send message  
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);}    
             
        /*  Properties props = new Properties();
        props.put("mail.smtp.user", "cerberus.msubca@gmail.com");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("cerberus.msubca@gmail.com", "cerberus123");
            }
        });
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.setSubject("Password Reset for Cerberus");
            msg.setFrom(new InternetAddress("cerberus.msubca@gmail.com"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            msg.setText(msg2);
            Transport transport = session.getTransport("smtps");
            transport.connect("smtp.gmail.com", Integer.valueOf("465"), "Cerberus Support Team", "cerberus123");
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();
        } catch (AddressException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } catch (MessagingException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
      */
    
    }  
}  

