/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.dao;

import com.saratech.enginee.auth.model.Login;
import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Nagaraj
 */
@Repository
public class SessionDAOImpl implements SessionDAO, DAOConstants {

    @Autowired
    JdbcTemplate jdbcTemplate;
    final String LOGIN_VALIDATION_SPN = "loginValidation";

    public List<Login> getLogin(String userName, String password) {
        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, LOGIN_VALIDATION_SPN);
        RowMapper rowMapper = new DefaultDAOImpl();
        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST,
                rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.SESSION_USERNAME, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.SESSION_PASSWORD, Types.VARCHAR));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put("username", userName);
        hMap.put("pass", password);
        Map storedProcResult = storedProcedureCall.execute(hMap);
        List userList = (List) storedProcResult.get(RESULT_LIST);
        return userList;

    }
}
