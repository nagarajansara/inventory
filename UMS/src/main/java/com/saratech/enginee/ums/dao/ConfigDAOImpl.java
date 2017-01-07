/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.ums.dao;

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
public class ConfigDAOImpl implements ConfigDAO, DAOConstants {

    @Autowired
    JdbcTemplate jdbcTemplate;
    
    final String ADD_USERTYPE_PC = "c_user_type_post";

    public String add(String userType) throws Exception {
        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, ADD_USERTYPE_PC);
        RowMapper rowMapper = new DefaultDAOImpl();
            storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC,
                rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_USER_TPE, Types.VARCHAR));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put(DAOConstants.IN_USER_TPE, userType);
        Map storedProcResult = storedProcedureCall.execute(hMap);
        List result = (List) storedProcResult.get(RESULT_LIST_PC);
        return result.toString();


    }
}
