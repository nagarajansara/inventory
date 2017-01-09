/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.web.authcontroller;

import com.saratech.enginee.auth.controller.SessionController;
import com.saratech.enginee.util.Logger.LoggerUtil;
import com.saratech.enginee.util.Utilities.Utilities;
import com.saratech.enginee.util.response.Response;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Nagaraj
 */
@Controller
@RequestMapping("web")
@RestController
public class WebSessionController {

    @Autowired
    SessionController sessionController;
    String className = WebSessionController.class.getName();

    @RequestMapping(value = "/session", method = {RequestMethod.POST})
    public Response session(HttpServletRequest request, HttpServletResponse res,
            @RequestParam(value = "username", required = false) String userName,
            @RequestParam(value = "password", required = false) String password,
            ModelMap model) throws Exception {
        Response response = new Response();
        try {
            LoggerUtil.getDebugLog().debug(className + " " + "username = " + userName);
            LoggerUtil.getDebugLog().debug(className + " " + "password = " + password);
            String responseData = sessionController.getLogin(request, userName, password);
            LoggerUtil.getDebugLog().debug(className + " " + "responseData = " + responseData);
            Utilities.setSuccessResponse(response, responseData);
        } catch (Exception ex) {
            LoggerUtil.getErrorLog().error(className + " " + ex.getMessage());
            LoggerUtil.getDebugLog().debug(className + " " + ex.getMessage());
            Utilities.setErrResponse(ex, response);
        }
        return response;

    }
}
