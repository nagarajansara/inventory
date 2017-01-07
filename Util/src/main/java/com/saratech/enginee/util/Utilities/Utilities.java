/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.util.Utilities;

import com.saratech.enginee.util.exception.ConstException;
import com.saratech.enginee.util.response.Response;
import java.util.UUID;

/**
 *
 * @author Nagaraj
 */
public class Utilities {

    public static String UUID() {
        return UUID.randomUUID().toString();
    }

    public static void setSuccessResponse(Response response) {
        setSuccessResponse(response, null);
    }

    public static void setSuccessResponse(Response response, Object data) {
        response.setResponseStatus(ConstException.ERR_CODE_SUCCESS);
        response.setResponseMsg(ConstException.ERR_MSG_SUCCESS);
        response.setResponseData(data);
    }

    public static void setErrResponse(Exception ex, Response response) {
        if (ex instanceof java.sql.SQLException) {
            response.setResponseMsg(ex.getMessage());
            response.setResponseStatus(ConstException.ERR_CODE_DB_ERROR);
        } else if (ex instanceof java.lang.NullPointerException) {
            response.setResponseMsg(ex.getMessage());
            response.setResponseStatus(ConstException.ERR_CODE_UNKNOWN);
        } else if (ex instanceof ConstException) {
            ConstException constException = (ConstException) ex;
            response.setResponseMsg(constException.getMessage());
            response.setResponseStatus(constException.getCode());
        } else {
            setErrResponse(ex, response, ConstException.ERR_CODE_UNKNOWN);
        }

    }

    public static void setErrResponse(Exception ex, Response response, int errCode) {
        ConstException constException = (ConstException) ex;
        response.setResponseMsg(constException.getMessage());
        response.setResponseStatus(constException.getCode());
    }
}
