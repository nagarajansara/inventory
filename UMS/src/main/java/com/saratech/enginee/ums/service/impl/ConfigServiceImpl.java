/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.ums.service.impl;

import com.saratech.enginee.ums.dao.ConfigDAO;
import com.saratech.enginee.ums.service.ConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nagaraj
 */
@Service
public class ConfigServiceImpl implements ConfigService{

    @Autowired
    ConfigDAO configDAO;
    
    public String add(String userType) throws Exception {
        return configDAO.add(userType);
    }
    
    public String addUser(String user,String name,String password,String locationId,String userTypeId,String phone,String email,String createdBy) throws Exception {
        return configDAO.addUser(user,name,password,locationId,userTypeId,phone,email,createdBy);
    }
    
}
