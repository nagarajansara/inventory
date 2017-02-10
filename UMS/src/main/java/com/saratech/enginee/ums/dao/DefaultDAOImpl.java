/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.ums.dao;

import com.saratech.enginee.util.Logger.LoggerUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Nagaraj
 */
public class DefaultDAOImpl implements RowMapper {

    public Object mapRow(ResultSet resultSet, int index) throws SQLException {
        return generateJSON(resultSet, 0);
    }

    public String generateJSON(ResultSet resultSet, int numEntries) throws SQLException {
        JSONObject json = new JSONObject();
        JSONArray respJSON = new JSONArray();
        try {
            LoggerUtil.getDebugLog().debug("resultSet :" + resultSet.getRow());
            java.sql.ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            int numColumns = resultSetMetaData.getColumnCount();
            LoggerUtil.getDebugLog().debug("No of columns = " + numColumns);
            do {
                JSONObject obj = new JSONObject();
                for (int i = 1; i < numColumns + 1; i++) {
                    String columnName = resultSetMetaData.getColumnLabel(i);
                    if (resultSetMetaData.getColumnType(i) == java.sql.Types.ARRAY) {
                        obj.put(columnName, resultSet.getArray(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.BIGINT) {
                        obj.put(columnName, resultSet.getInt(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.BOOLEAN) {
                        obj.put(columnName, resultSet.getBoolean(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.BLOB) {
                        obj.put(columnName, resultSet.getBlob(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.DOUBLE) {
                        obj.put(columnName, resultSet.getDouble(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.FLOAT) {
                        obj.put(columnName, resultSet.getFloat(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.INTEGER) {
                        obj.put(columnName, resultSet.getInt(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.NVARCHAR) {
                        obj.put(columnName, resultSet.getNString(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.VARCHAR) {
                        obj.put(columnName, resultSet.getString(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.TINYINT) {
                        obj.put(columnName, resultSet.getInt(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.SMALLINT) {
                        obj.put(columnName, resultSet.getInt(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.DATE) {
                        obj.put(columnName, resultSet.getDate(i));
                    } else if (resultSetMetaData.getColumnType(i) == java.sql.Types.TIMESTAMP) {
                        obj.put(columnName, resultSet.getTimestamp(i));
                    } else {
                        obj.put(columnName, resultSet.getObject(i));
                    }
                }
                respJSON.put(obj);
            } while (resultSet.next());
            json.put(DAOConstants.RESULTSET_KEY, respJSON);
        } catch (SQLException ex) {
            LoggerUtil.getDebugLog().debug(this.getClass().getName() + " " + ex.getMessage());
            throw ex;
        } catch (JSONException ex) {
            LoggerUtil.getDebugLog().debug(this.getClass().getName() + " " + ex.getMessage());
            throw ex;
        }

        return json.toString();

    }
}
