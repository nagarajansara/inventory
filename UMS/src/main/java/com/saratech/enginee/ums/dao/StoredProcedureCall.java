/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.ums.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.object.StoredProcedure;

/**
 *
 * @author Nagaraj
 */
public class StoredProcedureCall extends StoredProcedure {

    public StoredProcedureCall(JdbcTemplate jdbcTemplate, String storedProcedureName) {
        super(jdbcTemplate, storedProcedureName);
        setFunction(false);
    }
}
