/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author KAMAKSHI
 */
public class Cryptography {
    public static void main(String args[]) throws NoSuchAlgorithmException{
        /*System.out.println(cryptograph("jayatis"));
        System.out.println(cryptograph("iamkotwala"));
        System.out.println(cryptograph("harshsol"));
        System.out.println(cryptograph("jhaveri"));
        System.out.println(cryptogrpah("riddhisc")*/
        System.out.println(cryptograph("abcdef"));
    }
    public static String cryptograph(String orgStr) throws NoSuchAlgorithmException
    {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] encodedhash = digest.digest(orgStr.getBytes(StandardCharsets.UTF_8));
        String hashedValue=bytesToHex(encodedhash);
        //System.out.println(hashedValue);
        return hashedValue;
    }
    private static String bytesToHex(byte[] hash) 
    {
        StringBuffer hexString = new StringBuffer();
        for (int i = 0; i < hash.length; i++) 
        {
            String hex = Integer.toHexString(0xff & hash[i]);
            if(hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }
}
