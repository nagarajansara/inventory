/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.util.exception;

/**
 *
 * @author Nagaraj
 */
public class ConstException extends Exception {

    public static String ERR_MSG_SUCCESS = "Success";
    public static String ERR_MSG_SESSION_EXP = "Session expired";
    public static int ERR_CODE_UNKNOWN = -1;
    public static int ERR_CODE_SUCCESS = 200;
    public static int ERR_CODE_INVALID_LOGIN = -1;
    public int errorCode = this.ERR_CODE_UNKNOWN;
    public static int ERR_CODE_DB_ERROR = 101;

    public ConstException() {
    }

    public ConstException(String errorMsg) {
        super(errorMsg);
    }

    public ConstException(int errorCode, String errorMsg) {
        super(errorMsg);
        this.errorCode = errorCode;
    }

    public int getCode() {
        return errorCode;
    }

    public void setCode(int errorCode) {
        this.errorCode = errorCode;
    }
}
