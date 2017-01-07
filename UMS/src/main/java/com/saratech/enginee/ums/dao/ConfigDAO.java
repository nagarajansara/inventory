/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.ums.dao;

import org.springframework.stereotype.Repository;

/**
 *
 * @author Nagaraj
 */
@Repository
public interface ConfigDAO {
    String add(String userType) throws Exception;
}
