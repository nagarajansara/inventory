/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.ums.controller;

import com.saratech.enginee.ums.service.ConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nagaraj
 */
@Service
public class UserConfigController {

    @Autowired
    ConfigService configService;

    public String add(String userType) throws Exception {
        return configService.add(userType);
    }
}
