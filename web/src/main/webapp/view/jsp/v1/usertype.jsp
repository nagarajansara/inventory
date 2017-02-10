<%@ include file="lib/header.jsp"%>
<%@ include file="lib/leftsidebar.jsp"%>
<link href="${baseURL}/assest/plugin/cfdatatable.css" rel="stylesheet" />
<section id="main-content" class="hfmsMainContent">
    <section class="wrapper">
        <div class="row iv_AddUserTypeFrm">
            <div class="col-sm-12 col-lg-12">
                <section class="panel">
                    <header class="panel-heading">User Type</header>        
                    <button class="btn btn-success iv_ShowUserTypeBtn" type="button">Show
                        User Type</button>
                    <div class="panel-body">
                        <div class="position-center">
                            <form role="form" class="iv_AddUserType" data-parsley-validate="">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">User Type</label>
                                    <input type="text" placeholder="user type" class="form-control iv_userType" data-parsley-required>
                                </div>
                                <button class="btn btn-info" type="submit">ADD</button>
                                <img  class="hfmsLoader" src="${baseURL}/assest/img/index.gif"  />
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="row iv_ShowUserType">
            <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading"> User Type Lists </header>
                    <button class="btn btn-success iv_AddUserTypeBtn" type="button">ADD
                        NEW</button>
                    <div class="panel-body">
                        <table id="dynamic-table" width="100%"
                               class="pkDataCommonTable table table-striped table-bordered dt-responsive nowrap">
                            <thead>
                                <tr>
                                    <th>User Type</th>
                                    <th>Manage</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </section>
            </div>
        </div>
        <div class="row iv_UpdateUserType">
            <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading"> User Type</header>
                    <button class="btn btn-success iv_ShowUserTypeBtn" type="button">Show
                        User Type</button>
                    <div class="panel-body">
                        <div class="position-center">
                            <form role="form" class="iv_UpdateUserTypeFrm" data-parsley-validate="">
                                <div class="form-group">
                                    <label for="text">User Type</label>
                                    <input type="text" placeholder="user type" class="form-control iv_updateUserTypeTxt" data-parsley-required>
                                </div>
                                <button class="btn btn-info" type="submit">Upadte</button>
                                <img  class="hfmsLoader" src="${baseURL}/assest/img/index.gif"  />
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>
</section>
<%@ include file="lib/footer.jsp"%>
<script src="${baseURL}/assest/plugin/cfdatatable.js"></script>
<script src="${baseURL}/assest/plugin/selecttwo/select_min.js"></script>
<script src="${baseURL}/assest/plugin/numeric.min.js"></script>
<script src="${baseURL}/assest/plugin/getjsonparams.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $(".iv_ConfigParent a").trigger("click");
        $(".hfmsLeftSideMenu").removeClass('iv_activeSubMenu');
        $(".iv_ConfigUserType a").addClass('iv_activeSubMenu');
        
        $(".iv_AddUserTypeBtn").click(function(){
            $(".iv_AddUserTypeFrm").show();
            $(".iv_ShowUserType").hide();
            $(".iv_UpdateUserType").hide();
            
        });
        $(".iv_ShowUserTypeBtn").click(function(){
            $(".iv_AddUserTypeFrm").hide();
            $(".iv_UpdateUserType").hide();
            $(".iv_ShowUserType").show();
        });
        var aoColumns = [ {
                "mData" : "user_type",
                'bSortable' : false
            }, {
                "mData" : "editBtn",
                'bSortable' : false
            }, ];

        hfmsSetDataTableValues("#dynamic-table", "http://" + location.host + "${baseURL}/api/config/get.json", aoColumns, 'User Type');
     
        $(".iv_AddUserType").submit(function(event) {
            event.preventDefault();
            var param = {
                "user_type": $(".iv_userType").val()  
            };
            ctDAO.addUserType(param, function(data){
                if(data && data.responseStatus == bmpUtil.RESPONSE_STATUS)
                {
                    alert("Success");
                }
                
            });
        });
        $(".iv_UpdateUserTypeFrm").submit(function(event) {
            event.preventDefault();
            var URL = ctDAO.UPDATE_USER_TYPE;
            var param = {
                "usertype": $(".iv_updateUserTypeTxt").val()
            };
            URL = URL.replace("{ID}", $(".iv_updateUserTypeTxt").attr("pk_id"));
            ctDAO.updateUserType(param, URL, function(data){
                if(data && data.responseStatus == bmpUtil.RESPONSE_STATUS)
                {
                    console.log(data);
                    alert("Success");
                }
                
            });
        });
        $(document).on("click", ".hfmsDelBtn", function(){
            if(confirm("Conform to delete!"))
            {
                var userTypeId = $(this).attr("pk_id"),
                param = {};
                var URL = ctDAO.DELETE_USER_TYPE;
                URL = URL.replace("{ID}", userTypeId);
                ctDAO.deleteUserType(param, URL, function(data) {
                    if (data && data.responseStatus == bmpUtil.RESPONSE_STATUS) {
                        alert("user type deleted successfully");
                    } else {
                        alert(data.responseMsg);
                    }
                });
            }

        });
        $(document).on("click", ".hfmsEditBtn", function(){
            $(".iv_AddUserTypeFrm").hide();
            $(".iv_ShowUserType").hide();
            $(".iv_UpdateUserType").show();
            var param = {
            };
            var url = ctDAO.GET_USER_TYPE + "?id=" + $(this).attr("pk_id");
            ctDAO.getUserType(param, url, function(data){
                if(data && data.responseStatus == bmpUtil.RESPONSE_STATUS)
                {
                    var responseData = data.responseData;
                    $('.iv_updateUserTypeTxt').val(responseData[0].user_type);
                    $('.iv_updateUserTypeTxt').attr("pk_id", responseData[0].id);
                }
            });
        });
    });
</script>