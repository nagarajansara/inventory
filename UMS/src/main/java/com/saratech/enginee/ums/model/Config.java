/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.ums.model;

/**
 *
 * @author Nagaraj
 */
public class Config {

    private String user_type;
    private String created_date;
    private String modified_date;
    private String editBtn;
    private int startindx;
    private int maxindx;
    private int totalRecords;
    private int userId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public String getEditBtn() {
        return editBtn;
    }

    public Config(String user_type) {
        this.user_type = user_type;
    }

    public void setEditBtn(String editBtn) {
        this.editBtn = editBtn;
    }

    public int getStartindx() {
        return startindx;
    }

    public void setStartindx(int startindx) {
        this.startindx = startindx;
    }

    public int getMaxindx() {
        return maxindx;
    }

    public void setMaxindx(int maxindx) {
        this.maxindx = maxindx;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public String getModified_date() {
        return modified_date;
    }

    public void setModified_date(String modified_date) {
        this.modified_date = modified_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    private int id;

    public Config() {
    }

    
    public Config(String user_type, String editBtn) {
        this.user_type = user_type;
        this.editBtn = editBtn;
    }

    public Config(String user_type, int id, int userId) {
        this.user_type = user_type;
        this.id = id;
        this.userId = userId;
    }
    
    public Config(String user_type, int id) {
        this.user_type = user_type;
        this.id = id;
    }

    public Config(String user_type, String editBtn, int totalRecords, int id) {
        this.user_type = user_type;
        this.editBtn = editBtn;
        this.totalRecords = totalRecords;
        this.id = id;
    }

    public Config(String user_type, String editBtn, int totalRecords) {
        this.user_type = user_type;
        this.editBtn = editBtn;
        this.totalRecords = totalRecords;
    }
}
