/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.util.Logger;

import java.util.logging.Logger;

/**
 *
 * @author Nagaraj
 */
public class LoggerUtil {

    public static Logger getDebugLog() {
        return Logger.getLogger("debugLogger");
    }

    public static Logger getErrorLog() {
        return Logger.getLogger("errorLog");
    }
}
