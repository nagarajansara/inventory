/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.auth.security;

import com.saratech.enginee.auth.controller.BaseController;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nagaraj
 */
@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter extends BaseController implements Filter {

    public String SERVER_NAME = "localhost:8080";
    public String CONTEXT_NAME = "inventory";
    private String SESSION_FAILURE_URL = "http://" + SERVER_NAME + "/"
            + CONTEXT_NAME + "/" + "view/jsp/v1/login.jsp";
    private String SESSION_FAILURE_PATH = "/view/jsp/v1/login.jsp";
    private List<String> AUTHENTICATED_URL = new ArrayList<String>();
    private List<String> AUTHENTICATED_URL_INDEXOF = new ArrayList<String>();
    private ServletContext context;

    public void init(FilterConfig fConfig) throws ServletException {
        this.context = fConfig.getServletContext();

        AUTHENTICATED_URL.add("ping");
        AUTHENTICATED_URL.add("session");
        AUTHENTICATED_URL.add("session.json");
        AUTHENTICATED_URL.add("logout");

    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();

        HttpSession session = req.getSession(false);
        Object userDetails =
                (session != null) ? session.getAttribute(ATTR_USER_ID) : null;

        String lastURIWord = uri.substring(uri.lastIndexOf("/") + 1);

        if (userDetails == null
                && !(AUTHENTICATED_URL.indexOf(lastURIWord) >= 0)) {

            boolean isAuthntificated = false;
            String lastURLIndex = uri.substring(0, uri.lastIndexOf("/"));
            String[] params = lastURLIndex.split("/");
            for (int i = 0; i < params.length; i++) {
                if (AUTHENTICATED_URL_INDEXOF.indexOf(params[i]) >= 0) {
                    isAuthntificated = true;
                    break;
                }
            }
            lastURLIndex =
                    lastURLIndex.substring(lastURLIndex.lastIndexOf("/") + 1,
                    lastURLIndex.length());

            if (AUTHENTICATED_URL_INDEXOF.indexOf(lastURLIndex) >= 0
                    || isAuthntificated) {
                chain.doFilter(request, response);
            } else {
                RequestDispatcher requestDispatcher =
                        request.getRequestDispatcher(SESSION_FAILURE_PATH);
                requestDispatcher.forward(request, response);

            }

        } else {
            chain.doFilter(request, response);
        }

    }

    public void destroy() {
    }
}
