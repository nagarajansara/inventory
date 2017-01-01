/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.controller;

import com.saratech.enginee.auth.model.Login;
import com.saratech.enginee.auth.service.SessionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nagaraj
 */
@Service
public class SessionController {

    @Autowired
    SessionService sessionService;

    public List<Login> getLogin(String userName, String password) {
        return sessionService.getLogin(userName, password);
    }
}
