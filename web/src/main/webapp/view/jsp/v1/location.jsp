<%@ include file="lib/header.jsp"%>
<%@ include file="lib/leftsidebar.jsp"%>
<section id="main-content" class="hfmsMainContent">
    <section class="wrapper">
        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <section class="panel">
                    <header class="panel-heading">User Type</header>        
                    <div class="panel-body">
                        <div class="position-center">
                            <form role="form" class="iv_AddUserType" data-parsley-validate="">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">User Type</label>
                                    <input type="text" placeholder="user type" class="form-control iv_userType" data-parsley-required>
                                </div>
                                <button class="btn btn-info" type="submit">ADD</button>
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
        $(".iv_Config a").trigger("click");
        $(".iv_AddUserType").submit(function(event) {
            event.preventDefault();
            var param = {
              "usertype": $(".iv_userType").val()  
            };
            ctDAO.addUserType(param, function(data){
                if(data && data.responseStatus == bmpUtil.RESPONSE_STATUS)
                {
                    alert("Success");
                }
                
            });
        });
            
    });
</script>