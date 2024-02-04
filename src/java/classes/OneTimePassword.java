/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.Random;

/**
 *
 * @author KAMAKSHI
 */
public class OneTimePassword {
    public int generateOTP()
    {
        Random rand=new Random();
        int r=rand.nextInt(1000000);
        return r;
    }
}
