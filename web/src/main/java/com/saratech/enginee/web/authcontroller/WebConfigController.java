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
}
