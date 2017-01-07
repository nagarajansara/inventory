/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.model;

/**
 *
 * @author Nagaraj
 */
public class Login {

    private int id;
    private String userName;
    private String password;
    private String status;
    private String createdat;
    private String lastlogin;
    private String lastlogout;
    private String apiKey;

    public String getApiKey() {
        return apiKey;
    }

    public void setApiKey(String apiKey) {
        this.apiKey = apiKey;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Login() {
    }

    public String getCreatedat() {
        return createdat;
    }

    public void setCreatedat(String createdat) {
        this.createdat = createdat;
    }

    public String getLastlogin() {
        return lastlogin;
    }

    public void setLastlogin(String lastlogin) {
        this.lastlogin = lastlogin;
    }

    public String getLastlogout() {
        return lastlogout;
    }

    public void setLastlogout(String lastlogout) {
        this.lastlogout = lastlogout;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Login(int id, String userName, String password, String status, String createdat, String lastlogin, String lastlogout, String apiKey) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.status = status;
        this.createdat = createdat;
        this.lastlogin = lastlogin;
        this.lastlogout = lastlogout;
        this.apiKey = apiKey;
    }

    public Login(String apiKey, int userId) {
        this.apiKey = apiKey;
        this.id = userId;
    }
}
