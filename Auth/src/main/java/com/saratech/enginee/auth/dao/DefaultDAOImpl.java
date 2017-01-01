/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Nagaraj
 */
public class DefaultDAOImpl implements RowMapper {
    public Object mapRow(ResultSet resultSet, int index) throws SQLException {
        return resultSet;
    }
    
}
