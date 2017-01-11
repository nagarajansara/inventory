/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.ums.dao;

import com.saratech.enginee.util.Utilities.Utilities;
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
    final String ADD_USERS_PC = "c_users_post";

    public String add(String userType) throws Exception {
        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, ADD_USERTYPE_PC);
        RowMapper rowMapper = new DefaultDAOImpl();
        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC,rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_USER_TYPE, Types.VARCHAR));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put(DAOConstants.IN_USER_TYPE, userType);
        Map storedProcResult = storedProcedureCall.execute(hMap);
        List result = (List) storedProcResult.get(RESULT_LIST_PC);
        return result.toString();
    }

    public String addUser(String user, String name, String password, String locationId, String userTypeId, String phone, String email, String createdBy) throws Exception {
        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, ADD_USERS_PC);
        RowMapper rowMapper = new DefaultDAOImpl();
        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC, rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_ID, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_USER_TYPE, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_NAME, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_PASSWORD, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_LOCATION_ID, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_USERTYPE_ID, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_PHONE, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_EMAIL, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_CREATED_BY, Types.VARCHAR));        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put(DAOConstants.IN_ID, Utilities.UUID());
        hMap.put(DAOConstants.IN_USER_TYPE, user);
        hMap.put(DAOConstants.IN_NAME, name);
        hMap.put(DAOConstants.IN_PASSWORD, password);
        hMap.put(DAOConstants.IN_LOCATION_ID, "1");
        hMap.put(DAOConstants.IN_USERTYPE_ID, "1");
        hMap.put(DAOConstants.IN_PHONE, phone);
        hMap.put(DAOConstants.IN_EMAIL, email);
        hMap.put(DAOConstants.IN_CREATED_BY, "1");
        Map storedProcResult = storedProcedureCall.execute(hMap);
        List result = (List) storedProcResult.get(RESULT_LIST_PC);
        return result.toString();
    }
}
