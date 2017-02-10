/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.service;

import com.saratech.enginee.auth.model.Login;
import java.sql.SQLException;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nagaraj
 */
@Service
public interface SessionService {

    List<Login> getLogin(String userName, String password) throws SQLException;
}
