/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.ums.dao;

import com.saratech.enginee.ums.model.Config;
import com.saratech.enginee.ums.model.LocationDetails;
import com.saratech.enginee.ums.model.LocationType;
import com.saratech.enginee.ums.model.OrganizationDetails;


import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.rmi.CORBA.Util;
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
public class ConfigDAOImpl implements ConfigDAO, DAOConstants {

    @Autowired
    JdbcTemplate jdbcTemplate;
    final String ADD_USERTYPE_PC = "c_user_type_post";
    final String ADD_ORG_DETAILS_PC = "c_org_location_post";
    final String GET_USER_TYPE_PC = "c_user_type_get";
    final String GET_LOCATIOIN_TYPE_PC = "c_location_type_get";
    final String UPDATE_USER_TYPE_PC = "c_user_type_put";
    final String DELETE_USER_TYPE_PC = "c_user_type_delete";
    final String ADD_USERS_PC = "c_users_post";
    final String GET_LOCATIOIN_DETAILS_PC = "u_parent_location_get";
    final String GET_ORD_DETAILS_PC = "c_org_location_get";

    public String add(String userType, int userId) throws Exception {
        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, ADD_USERTYPE_PC);
        RowMapper rowMapper = new DefaultDAOImpl();

        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC,
                rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_USER_TPE, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_CREATED_BY, Types.INTEGER));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put(DAOConstants.IN_USER_TYPE, userType);
        hMap.put(DAOConstants.IN_CREATED_BY, userId);
        Map storedProcResult = storedProcedureCall.execute(hMap);
        List result = (List) storedProcResult.get(RESULT_LIST_PC);

        JSONObject jSONObject = new JSONObject(result.get(0).toString());
        JSONArray jSONArray = jSONObject.getJSONArray(DAOConstants.RESULTSET_KEY);
        JSONObject jsono = jSONArray.getJSONObject(0);
        return jsono.getString("status");
    }

    public String addOrgDetails(String parentId, String locationName, int locationTypeId, String phone, String email, String address) throws Exception {
        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, ADD_ORG_DETAILS_PC);
        RowMapper rowMapper = new DefaultDAOImpl();

        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC,
                rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_ID, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_PARENT_ID, Types.INTEGER));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_LOCATION_NAME, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_LOCATION_TYPE_ID, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_PHONE, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_EMAIL, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_ADDRESS, Types.VARCHAR));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put(DAOConstants.IN_ID, java.util.UUID.randomUUID());
        hMap.put(DAOConstants.IN_PARENT_ID, parentId);
        hMap.put(DAOConstants.IN_LOCATION_NAME, locationName);
        hMap.put(DAOConstants.IN_LOCATION_TYPE_ID, locationTypeId);
        hMap.put(DAOConstants.IN_PHONE, phone);
        hMap.put(DAOConstants.IN_EMAIL, email);
        hMap.put(DAOConstants.IN_ADDRESS, address);
        Map storedProcResult = storedProcedureCall.execute(hMap);
        List result = (List) storedProcResult.get(RESULT_LIST_PC);

        JSONObject jSONObject = new JSONObject(result.get(0).toString());
        JSONArray jSONArray = jSONObject.getJSONArray(DAOConstants.RESULTSET_KEY);
        JSONObject jsono = jSONArray.getJSONObject(0);
        return jsono.getString("status");
    }

    public List<Config> get(String type, Object ipValue, int startIndx, int maxIndx) throws Exception {
        List<Config> uConfigs = new ArrayList<Config>();

        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, GET_USER_TYPE_PC);
        RowMapper rowMapper = new DefaultDAOImpl();
        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC,
                rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_TYPE_PC, Types.VARCHAR));
        if (ipValue instanceof String) {
            storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_INPUT_PC, Types.VARCHAR));
        }
        if (ipValue instanceof Integer) {
            storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_INPUT_PC, Types.INTEGER));
        }
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_START_INDX, Types.INTEGER));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_MAX_INDX, Types.INTEGER));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put(DAOConstants.IN_TYPE_PC, type);
        hMap.put(DAOConstants.IN_INPUT_PC, ipValue);
        hMap.put(DAOConstants.IN_START_INDX, startIndx);
        hMap.put(DAOConstants.IN_MAX_INDX, maxIndx);
        Map storedProcResult = storedProcedureCall.execute(hMap);
        List result = (List) storedProcResult.get(RESULT_LIST_PC);
        if (result != null && result.size() > 0) {
            JSONObject jSONObject = new JSONObject(result.get(0).toString());
            JSONArray jSONArray = jSONObject.getJSONArray(DAOConstants.RESULTSET_KEY);
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jsono = jSONArray.getJSONObject(i);
                String userType = jsono.getString("user_type");
                String edit = jsono.getString("editBtn");
                int totalRecords = jsono.getInt("total_record");
                int id = jsono.getInt("id");
                Config config = new Config(userType, edit, totalRecords, id);
                uConfigs.add(config);
            }
        }
        return uConfigs;
    }

    public List<OrganizationDetails> getOrgDetails(String type, Object ipValue, int startIndx, int maxIndx) throws Exception {
        List<OrganizationDetails> uConfigs = new ArrayList<OrganizationDetails>();

        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, GET_ORD_DETAILS_PC);
        RowMapper rowMapper = new DefaultDAOImpl();
        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC,
                rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_TYPE_PC, Types.VARCHAR));
        if (ipValue instanceof String) {
            storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_INPUT_PC, Types.VARCHAR));
        }
        if (ipValue instanceof Integer) {
            storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_INPUT_PC, Types.INTEGER));
        }
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_START_INDX, Types.INTEGER));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_MAX_INDX, Types.INTEGER));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put(DAOConstants.IN_TYPE_PC, type);
        hMap.put(DAOConstants.IN_INPUT_PC, ipValue);
        hMap.put(DAOConstants.IN_START_INDX, startIndx);
        hMap.put(DAOConstants.IN_MAX_INDX, maxIndx);
        Map storedProcResult = storedProcedureCall.execute(hMap);
        List result = (List) storedProcResult.get(RESULT_LIST_PC);
        if (result != null && result.size() > 0) {
            JSONObject jSONObject = new JSONObject(result.get(0).toString());
            JSONArray jSONArray = jSONObject.getJSONArray(DAOConstants.RESULTSET_KEY);
            int j = 1;
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jsono = jSONArray.getJSONObject(i);
                int totalRecords = jsono.getInt("total_record");
                String id = jsono.getString("id");
                String locationName = jsono.getString("location_name");
                String locationType = jsono.getString("location_type");
                String phone = jsono.getString("phone");
                String email = jsono.getString("email");
                String address = jsono.getString("address");
                String edit = jsono.getString("editBtn");
                OrganizationDetails config = new OrganizationDetails(j++,locationName, locationType, phone, email, address, edit, totalRecords, id);
                uConfigs.add(config);
            }
        }
        return uConfigs;

    }

    public List<LocationType> getLocationType() throws Exception {
        List<LocationType> locationTypes = new ArrayList<LocationType>();
        StoredProcedureCall storedProcedureCall = new StoredProcedureCall(jdbcTemplate, GET_LOCATIOIN_TYPE_PC);
        RowMapper rowMapper = new DefaultDAOImpl();
        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC, rowMapper));
        storedProcedureCall.compile();
        Map storedProcResult = storedProcedureCall.execute();
        List result = (List) storedProcResult.get(RESULT_LIST_PC);
        if (result != null && result.size() > 0) {
            JSONObject jSONObject = new JSONObject(result.get(0).toString());
            JSONArray jSONArray = jSONObject.getJSONArray(DAOConstants.RESULTSET_KEY);
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jsono = jSONArray.getJSONObject(i);
                int id = jsono.getInt("id");
                String locationName = jsono.getString("location_name");
                LocationType locationType = new LocationType(id, locationName);
                locationTypes.add(locationType);
            }
        }
        return locationTypes;

    }

    public List<LocationDetails> getLocationDetails(int locationTypeId) throws Exception {
        List<LocationDetails> locationDetailses = new ArrayList<LocationDetails>();
        StoredProcedureCall storedProcedureCall = new StoredProcedureCall(jdbcTemplate, GET_LOCATIOIN_DETAILS_PC);
        RowMapper rowMapper = new DefaultDAOImpl();
        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC, rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_LOCATION_TYPE_ID, Types.INTEGER));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put(DAOConstants.IN_LOCATION_TYPE_ID, locationTypeId);
        Map storedProcResult = storedProcedureCall.execute(hMap);
        List result = (List) storedProcResult.get(RESULT_LIST_PC);
        if (result != null && result.size() > 0) {
            JSONObject jSONObject = new JSONObject(result.get(0).toString());
            JSONArray jSONArray = jSONObject.getJSONArray(DAOConstants.RESULTSET_KEY);
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jsono = jSONArray.getJSONObject(i);
                int id = jsono.getInt("id");
                String locationName = jsono.getString("location_name");
                LocationDetails locationDetails = new LocationDetails(id, locationName);
                locationDetailses.add(locationDetails);
            }
        }
        return locationDetailses;

    }

    public void update(Config config) {
        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, UPDATE_USER_TYPE_PC);
        RowMapper rowMapper = new DefaultDAOImpl();
        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC,
                rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_USER_TPE_ID, Types.INTEGER));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_USER_TPE, Types.VARCHAR));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_MODIFIED_BY, Types.INTEGER));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put(DAOConstants.IN_USER_TPE_ID, config.getId());
        hMap.put(DAOConstants.IN_USER_TPE, config.getUser_type());
        hMap.put(DAOConstants.IN_MODIFIED_BY, config.getUserId());
        storedProcedureCall.execute(hMap);


    }

    public void delete(Config config) {
        StoredProcedureCall storedProcedureCall =
                new StoredProcedureCall(jdbcTemplate, DELETE_USER_TYPE_PC);
        RowMapper rowMapper = new DefaultDAOImpl();
        storedProcedureCall.declareParameter(new SqlReturnResultSet(RESULT_LIST_PC,
                rowMapper));
        storedProcedureCall.declareParameter(new SqlParameter(DAOConstants.IN_USER_TPE_ID, Types.INTEGER));
        storedProcedureCall.compile();
        Map hMap = new HashMap();
        hMap.put(DAOConstants.IN_USER_TPE_ID, config.getId());
        storedProcedureCall.execute(hMap);

    }
}
