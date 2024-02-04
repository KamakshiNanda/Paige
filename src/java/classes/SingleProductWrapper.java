/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author KAMAKSHI
 */
public class SingleProductWrapper {
    String ISBN;
    String sid;
    String thumbnail;
    int price;
    String title;
    String []sellers;
    
    public SingleProductWrapper(String sellers[])
    {
        this.sellers=sellers;
    }

    public SingleProductWrapper(String ISBN,String thumbnail, int price, String title,String sid) {
        this.ISBN=ISBN;
        this.thumbnail = thumbnail;
        this.price = price;
        this.title = title;
        this.sid=sid;
    }

    public SingleProductWrapper(String ISBN,String thumbnail, int price, String title,String sid, String[] sellers) {
        this.ISBN=ISBN;
        this.thumbnail = thumbnail;
        this.price = price;
        this.title = title;
        this.sellers = sellers;
        this.sid=sid;
    }

    public SingleProductWrapper() {
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String[] getSellers() {
        return sellers;
    }

    public void setSellers(String[] sellers) {
        this.sellers = sellers;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }
    
}
