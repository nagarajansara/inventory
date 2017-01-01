/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.web.authcontroller;

import com.saratech.enginee.auth.controller.SessionController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Nagaraj
 */
@Controller
public class WebSessionController {

    @Autowired
    SessionController sessionController;

    @RequestMapping(value = "/session", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String ping(HttpServletRequest request, HttpServletResponse res,
            @RequestParam(value = "username", required = false) String userName,
            @RequestParam(value = "password", required = false) String password,
            ModelMap model) throws Exception {
        return sessionController.getLogin(userName, password).toString();
    }
}
