/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.service;

import com.saratech.enginee.auth.dao.SessionDAO;
import java.sql.SQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nagaraj
 */
@Service
public class SessionServiceImpl implements SessionService {

    @Autowired
    SessionDAO loginDAO;

    public String getLogin(String userName, String password) throws SQLException {
        return loginDAO.getLogin(userName, password);
    }
}
