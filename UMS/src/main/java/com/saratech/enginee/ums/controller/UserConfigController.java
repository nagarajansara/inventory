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
    
    public String addUser(String user,String name,String password,String locationId,String userTypeId,String phone,String email,String createdBy) throws Exception {
        return configService.addUser(user,name,password,locationId,userTypeId,phone,email,createdBy);
    }
}
