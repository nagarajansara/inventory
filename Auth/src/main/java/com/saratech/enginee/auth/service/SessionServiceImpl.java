/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.service;

import com.saratech.enginee.auth.dao.SessionDAO;
import com.saratech.enginee.auth.model.Login;
import java.sql.SQLException;
import java.util.List;
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

    public List<Login> getLogin(String userName, String password) throws SQLException {
        return loginDAO.getLogin(userName, password);
    }
}
