/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.web.authcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Nagaraj
 */
@Controller
@RequestMapping("/login")
public class TestController {

    @RequestMapping(value = "/ping", method = {RequestMethod.GET})
    @ResponseBody
    public String ping(HttpServletRequest request, HttpServletResponse res,
            ModelMap model) throws Exception {
        return "pinged";
    }
}
