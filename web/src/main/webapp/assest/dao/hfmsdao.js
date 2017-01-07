var ctDAO = new CtDAO();

function CtDAO() {
    this.CONTEXT_NAME = "inventory";
    this.DOMAIN_NAME = window.location.host;
    this.HTTP_URL_PREFIX = "http://" + window.location.host + "/"
    + this.CONTEXT_NAME + "/";
    this.HTTPS_URL_PREFIX = "https://" + window.location.host + "/"
    + this.CONTEXT_NAME + "/";
    this.API_PREFIX = this.HTTP_URL_PREFIX + "api";

    this.LOGIN_VALIDATE = this.API_PREFIX + "/web/session.json";
    this.ADD_USER_TYPE = this.API_PREFIX + "/web/configadd.json";
    
    this.RESPONSE_CACHE = {};

    this.TOTAL_RECORDS_PER_PAGE = 10;

    this.CACHE_MAP = {};

};

CtDAO.prototype.getLoginValidate = function(postParams, cbk) {
    var tObj = this;
    tObj.getData(tObj.LOGIN_VALIDATE, postParams, cbk);
};
CtDAO.prototype.addUserType = function(postParams, cbk) {
    var tObj = this;
    tObj.getData(tObj.ADD_USER_TYPE, postParams, cbk);
};

CtDAO.prototype.getData = function(url, postParams, callback, isCacheMap,
    isParse) {
    $(".hfmsLoader").show();
    if (localStorage.getItem("menuId") && postParams) {
        postParams["menuId"] = localStorage.getItem("menuId");
    }

    var tObj = this, cbk = function(data) {
        if (data && data.response) {
            data = data.response;
            if (!isParse) {

            }
            if (isCacheMap && !tObj.CACHE_MAP[url]) {
                tObj.CACHE_MAP[url] = data;
            }
        }
        callback(data);
    }, ajaxConfig = {
        "type" : (postParams ? "POST" : "GET"),
        "url" : url,
        "dataType" : "json",
        "data" : postParams,
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
