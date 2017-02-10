/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.controller;

import com.saratech.enginee.auth.model.Login;
import com.saratech.enginee.auth.service.SessionService;
import com.saratech.enginee.util.exception.ConstException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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

    public List<Login> getLogin(HttpServletRequest request, String userName, String password) throws SQLException, Exception {
        try {
            List<Login> loginResponse = sessionService.getLogin(userName, password);
            if (loginResponse != null && loginResponse.size() > 0) {
                setUserSession(request, loginResponse.get(0));
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
