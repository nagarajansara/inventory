/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.web.authcontroller;

import com.saratech.enginee.auth.controller.SessionController;
import com.saratech.enginee.auth.model.Login;
import com.saratech.enginee.util.Logger.LoggerUtil;
import com.saratech.enginee.util.Utilities.Utilities;
import com.saratech.enginee.util.response.Response;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Nagaraj
 */
@RestController
@RequestMapping("web")
public class WebSessionController {

    @Autowired
    SessionController sessionController;
    String className = WebSessionController.class.getName();

    @RequestMapping(value = "/session", method = {RequestMethod.POST})
    public String session(HttpServletRequest request, HttpServletResponse res,
            @RequestBody String body,
            ModelMap model) throws Exception {
        Response response = new Response();
        List<Login> responseData = new ArrayList<>();
        try {
            Map<String, Object> map = Utilities.getConvertJSON_Pojo(body);
            String userName = (String) map.get("username");
            String password = (String) map.get("password");
            LoggerUtil.getDebugLog().debug(className + " " + "username = " + userName);
            LoggerUtil.getDebugLog().debug(className + " " + "password = " + password);
            responseData = sessionController.getLogin(request, userName, password);
            LoggerUtil.getDebugLog().debug(className + " " + "responseData = " + responseData);
            Utilities.setSuccessResponse(response, responseData);
        } catch (Exception ex) {
            LoggerUtil.getErrorLog().error(className + " " + ex.getMessage());
            LoggerUtil.getDebugLog().debug(className + " " + ex.getMessage());
            Utilities.setErrResponse(ex, response);
        }
        model.addAttribute("model", response);
        return "jsonTemplate";

    }
}
