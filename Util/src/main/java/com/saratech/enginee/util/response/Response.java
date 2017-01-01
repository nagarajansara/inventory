/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.util.response;

/**
 *
 * @author Nagaraj
 */
public class Response {

    int responseStatus;
    String responseMsg;
    Object responseData;

    public int getResponseStatus() {
        return responseStatus;
    }

    public void setResponseStatus(int responseStatus) {
        this.responseStatus = responseStatus;
    }

    public String getResponseMsg() {
        return responseMsg;
    }

    public void setResponseMsg(String responseMsg) {
        this.responseMsg = responseMsg;
    }

    public Object getResponseData() {
        return responseData;
    }

    public void setResponseData(Object responseData) {
        this.responseData = responseData;
    }

    public Response(int responseStatus, String responseMsg) {
        this.responseStatus = responseStatus;
        this.responseMsg = responseMsg;
    }

    public Response() {
        responseStatus = -1;
        responseMsg = "Unknown";
    }
}
