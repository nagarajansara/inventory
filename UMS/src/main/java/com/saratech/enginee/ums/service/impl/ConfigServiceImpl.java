/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.ums.service.impl;

import com.saratech.enginee.ums.dao.ConfigDAO;
import com.saratech.enginee.ums.model.Config;
import com.saratech.enginee.ums.model.LocationDetails;
import com.saratech.enginee.ums.model.LocationType;
import com.saratech.enginee.ums.model.OrganizationDetails;
import com.saratech.enginee.ums.service.ConfigService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nagaraj
 */
@Service
public class ConfigServiceImpl implements ConfigService {

    @Autowired
    ConfigDAO configDAO;

    public String add(String userType, int userId) throws Exception {
        return configDAO.add(userType, userId);
    }

    public String addOrgDetails(String parentId, String locationName, int locationTypeId, String phone, String email, String address) throws Exception {
        return configDAO.addOrgDetails(parentId, locationName, locationTypeId, phone, email, address);
    }

    public List<Config> get(String type, Object ipValue, int startIndx, int maxIndx) throws Exception {
        return configDAO.get(type, ipValue, startIndx, maxIndx);
    }

    public List<OrganizationDetails> getOrgDetails(String type, Object ipValue, int startIndx, int maxIndx) throws Exception {
        return configDAO.getOrgDetails(type, ipValue, startIndx, maxIndx);
    }

    public List<LocationType> getLocationType() throws Exception {
        return configDAO.getLocationType();
    }

    public List<LocationDetails> getLocationDetails(int locationTypeId) throws Exception {
        return configDAO.getLocationDetails(locationTypeId);
    }

    public void update(Config config) {
        configDAO.update(config);
    }

    public void delete(Config config) {
        configDAO.delete(config);
    }
}
