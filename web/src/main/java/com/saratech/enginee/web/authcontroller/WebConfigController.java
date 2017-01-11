/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.web.authcontroller;

import com.saratech.enginee.ums.controller.UserConfigController;
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
@RequestMapping("config")
@RestController
public class WebConfigController {

    @Autowired
    UserConfigController userConfigController;
    String className = WebConfigController.class.getName();

    @RequestMapping(value = "/addusertype", method = {RequestMethod.POST})
    public Response session(HttpServletRequest request, HttpServletResponse res,
            @RequestParam(value = "usertype") String userType,
            ModelMap model) throws Exception {
        Response response = new Response();
        try {
            LoggerUtil.getDebugLog().debug(className + " " + "usertype = " + userType);
            String responseMsg = userConfigController.add(userType);
            Utilities.setSuccessResponse(response, responseMsg);
        } catch (Exception ex) {
            LoggerUtil.getDebugLog().debug(className + " " + "usertype = " + ex.getMessage());
            LoggerUtil.getErrorLog().error(className + " " + "usertype = " + ex.getMessage());
            Utilities.setErrResponse(ex, response);
        }
        return response;
    }
    
    @RequestMapping(value = "/adduser", method = {RequestMethod.POST})
    public Response addUser(HttpServletRequest request, HttpServletResponse res,
            @RequestParam(value = "usertype") String user,
            @RequestParam(value = "name") String name,
            @RequestParam(value = "username") String userName,
            @RequestParam(value = "password") String password,
            @RequestParam(value = "locationid") String locationId,
            @RequestParam(value = "usertypeid") String usertypeId,
            @RequestParam(value = "phone") String phone,
            @RequestParam(value = "email") String email,
            @RequestParam(value = "createdby") String createdBy,
            ModelMap model) throws Exception {
        Response response = new Response();
        try {
            LoggerUtil.getDebugLog().debug(className + " " + "user = " + user);
            String responseMsg = userConfigController.addUser(user,name,password,locationId,usertypeId,phone,email,createdBy);
            Utilities.setSuccessResponse(response, responseMsg);
        } catch (Exception ex) {
            LoggerUtil.getDebugLog().debug(className + " " + "user = " + ex.getMessage());
            LoggerUtil.getErrorLog().error(className + " " + "user = " + ex.getMessage());
            Utilities.setErrResponse(ex, response);
        }
        return response;
    }
}
