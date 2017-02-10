var ctDAO = new CtDAO();

function CtDAO() {
    this.CONTEXT_NAME = "inventory";
    this.DOMAIN_NAME = window.location.host;
    this.HTTP_URL_PREFIX = "http://" + window.location.host + "/"
    + this.CONTEXT_NAME + "/";
    this.HTTPS_URL_PREFIX = "https://" + window.location.host + "/"
    + this.CONTEXT_NAME + "/";
    this.API_PREFIX = this.HTTP_URL_PREFIX + "api";


    this.LOGIN_VALIDATE = this.API_PREFIX + "/web/session";
    this.ADD_USER_TYPE = this.API_PREFIX + "/config/add";
    this.ADD_ORG_DETAILS = this.API_PREFIX + "/config/addorgdetails";
    this.UPDATE_USER_TYPE = this.API_PREFIX + "/config/update/{ID}";
    this.DELETE_USER_TYPE = this.API_PREFIX + "/config/delete/{ID}";
    this.GET_USER_TYPE = this.API_PREFIX + "/config/get";
    this.GET_LOCATION_TYPE = this.API_PREFIX + "/config/locationtype";

    this.LOGIN_VALIDATE = this.API_PREFIX + "/web/session.json";
    this.ADD_USER_TYPE = this.API_PREFIX + "/config/add.json";
    this.ADD_ORG_DETAILS = this.API_PREFIX + "/config/addorgdetails.json";

    
    this.RESPONSE_CACHE = {};
    
    this.HTTP_GET = "GET";
    this.HTTP_POST = "POST";
    this.HTTP_PUT = "PUT";
    this.HTTP_DELETE = "DELETE";

    this.TOTAL_RECORDS_PER_PAGE = 10;

    this.CACHE_MAP = {};

};

CtDAO.prototype.getLoginValidate = function(postParams, cbk) {
    var tObj = this;
    tObj.getData(tObj.LOGIN_VALIDATE, postParams, cbk, tObj.HTTP_POST);
};
CtDAO.prototype.addUserType = function(postParams, cbk) {
    var tObj = this;
    tObj.getData(tObj.ADD_USER_TYPE, postParams, cbk, tObj.HTTP_POST);
};
CtDAO.prototype.addOrgDetails = function(postParams, cbk) {
    var tObj = this;
    tObj.getData(tObj.ADD_ORG_DETAILS, postParams, cbk, tObj.HTTP_POST);
};
CtDAO.prototype.getUserType = function(postParams, url, cbk) {
    var tObj = this;
    tObj.getData(url, postParams, cbk);
};

CtDAO.prototype.updateUserType = function(postParams, url, cbk) {
    var tObj = this;
    tObj.getData(url, postParams, cbk, tObj.HTTP_PUT);
};
CtDAO.prototype.deleteUserType = function(postParams, url, cbk) {
    var tObj = this;
    tObj.getData(url, postParams, cbk, tObj.HTTP_DELETE);
};
CtDAO.prototype.getData = function(url, postParams, callback, type, isCacheMap, isParse) {
    $(".hfmsLoader").show();

    var tObj = this, cbk = function(data) {
        if (data && data.model) {
            data = data.model;
            if (!isParse) {

            }
            if (isCacheMap && !tObj.CACHE_MAP[url]) {
                tObj.CACHE_MAP[url] = data;
            }
        }
        callback(data);
    }, ajaxConfig = {
        "contentType": 'application/json',
        "type" : type,
        "url" : url,
        "dataType" : "json",
        "data" : jQuery.isEmptyObject(postParams) ? "": JSON.stringify(postParams),
        error : function(err) {

        },
        success : function(data) {
            $(".hfmsLoader").hide();
            cbk(data);
        },
        statusCode : {
            404 : function() {
                alert("Check your internet connection");
            }
        }

    };
    jQuery.ajax(ajaxConfig);
};
CtDAO.prototype.parseJSON = function(jsonData) {
    try {
        jsonData = JSON.parse(jsonData);
    } catch (ex) {
        console.log(ex);
    }
    return jsonData;
};
