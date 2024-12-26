/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * 
 */
public class KontenModel {
    
    private int ID;
    
    private String title;
    
    private String link;
    
    private String description;
    
    private String maker;
    
    private Date date;

    public KontenModel() {
    }

    public KontenModel(int ID, String title, String link, String description, String maker, Date date) {
        this.ID = ID;
        this.title = title;
        this.link = link;
        this.description = description;
        this.maker = maker;
        this.date = date;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMaker() {
        return maker;
    }

    public void setMaker(String maker) {
        this.maker = maker;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
