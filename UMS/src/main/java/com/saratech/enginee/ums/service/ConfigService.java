/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.saratech.enginee.ums.service;

import com.saratech.enginee.ums.model.Config;
import com.saratech.enginee.ums.model.LocationDetails;
import com.saratech.enginee.ums.model.LocationType;
import com.saratech.enginee.ums.model.OrganizationDetails;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nagaraj
 */
@Service
public interface ConfigService {

    String add(String userType, int userId) throws Exception;

    String addOrgDetails(String parentId, String locationName, int locationTypeId, String phone, String email, String address) throws Exception;

    List<Config> get(String type, Object ipValue, int startIndx, int maxIndx) throws Exception;
    
    List<OrganizationDetails> getOrgDetails(String type, Object ipValue, int startIndx, int maxIndx) throws Exception;

    List<LocationType> getLocationType() throws Exception;

    List<LocationDetails> getLocationDetails(int locationTypeId) throws Exception;

    void update(Config config);

    void delete(Config config);
}
