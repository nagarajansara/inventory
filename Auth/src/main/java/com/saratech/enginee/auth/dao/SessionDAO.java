/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.dao;

import com.saratech.enginee.auth.model.Login;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Nagaraj
 */
@Repository
public interface SessionDAO {

    List<Login> getLogin(String userName, String password);
    
}
