/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.controller;

import com.saratech.enginee.auth.model.Login;
import com.saratech.enginee.auth.service.SessionService;
import com.saratech.enginee.util.exception.ConstException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nagaraj
 */
@Service
public class SessionController extends BaseController {

    @Autowired
    SessionService sessionService;

    public String getLogin(HttpServletRequest request, String userName, String password) throws SQLException, Exception {
        try {
            String loginResponse = sessionService.getLogin(userName, password);
            JSONObject jSONObject = new JSONObject(loginResponse);
            if (jSONObject.has("sessionId")) {
                Login login = new Login(jSONObject.getString("sessionId"),
                        jSONObject.getInt("userId"));
                setUserSession(request, login);
                return loginResponse;
            } else {
                throw new ConstException(ConstException.ERR_CODE_INVALID_LOGIN,
                        ConstException.ERR_MSG_SESSION_EXP);
            }
        } catch (Exception ex) {
            throw ex;
        }

    }
}
