/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.dao;

import com.saratech.enginee.auth.model.Login;
import com.saratech.enginee.util.Logger.LoggerUtil;
import com.saratech.enginee.util.Utilities.Utilities;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;
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
    final String LOGIN_VALIDATION_SPN = "c_login_get";
    final String ADD_SESSION_SPN = "c_session_post";

    @Override
    public List<Login> getLogin(String userName, String password) {
        LoggerUtil.getDebugLog().debug("<< SessionDAOImpl process start >>");
        List<Login> login = new ArrayList<Login>();
        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, LOGIN_VALIDATION_SPN);
        RowMapper rowMapper = new DefaultDAOImpl();
        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC,
                rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.SESSION_USERNAME_PC, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.SESSION_PASSWORD_PC, Types.VARCHAR));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put("username", userName);
        hMap.put("pass", password);
        Map storedProcResult = storedProcedureCall.execute(hMap);
        List userList = (List) storedProcResult.get(RESULT_LIST_PC);
        LoggerUtil.getDebugLog().debug(this.getClass().getName() + " userList = " + userList);
        if (!userList.isEmpty()) {
            JSONObject jSONObject = new JSONObject(userList.get(0).toString());
            LoggerUtil.getDebugLog().debug(this.getClass().getName() + " userList = " + userList.get(0));
            JSONArray jSONArray = jSONObject.getJSONArray(DAOConstants.RESULTSET_KEY);
            LoggerUtil.getDebugLog().debug(this.getClass().getName() + " jSONArray = " + jSONArray);
            if (jSONArray != null && jSONArray.length() > 0) {
                LoggerUtil.getDebugLog().debug(this.getClass().getName() + " jSONArray = " + jSONArray);
                JSONObject jsono = jSONArray.getJSONObject(0);
                String apiKey = Utilities.UUID();
                int userId = jsono.getInt("userid");
                LoggerUtil.getDebugLog().debug(this.getClass().getName() + " apiKey = " + apiKey);
                LoggerUtil.getDebugLog().debug(this.getClass().getName() + " userId = " + userId);
                _addSession(userId, apiKey);
                Login temp = new Login(apiKey, userId);
                login.add(temp);
            }
            LoggerUtil.getDebugLog().debug("<< SessionDAOImpl process end >>");
        }
        return login;
    }

    private void _addSession(int userId, String apiKey) {
        LoggerUtil.getDebugLog().debug("<< SessionDAOImpl addSession process start >>");
        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, ADD_SESSION_SPN);
        RowMapper rowMapper = new DefaultDAOImpl();
        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC,
                rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.SESSION_USERID_PC, Types.INTEGER));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.SESSION_APIKEY_PC, Types.VARCHAR));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put("userid", userId);
        hMap.put("apikey", apiKey);
        Map storedProcResult = storedProcedureCall.execute(hMap);
        storedProcResult.get(RESULT_LIST_PC);
        LoggerUtil.getDebugLog().debug("<< SessionDAOImpl addSession process end >>");
    }
}
