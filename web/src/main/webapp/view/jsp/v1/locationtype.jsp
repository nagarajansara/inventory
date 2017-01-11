<%@ include file="lib/header.jsp"%>
<%@ include file="lib/leftsidebar.jsp"%>
<section id="main-content" class="hfmsMainContent">
    <section class="wrapper">
        <div class="row hfmsShowStudentDataRow">
            <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading"> Location Type List</header>
                    <button type="button" class="btn btn-success hfmsAddNewBtn">ADD
                        NEW</button>
                    <div class="panel-body">
                        <table id="dynamic-table" width="100%"
                               class="pkDataCommonTable table table-striped table-bordered dt-responsive nowrap">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Location Type</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </section>
            </div>
        </div>
        <!-- page start-->

        <!-- ADD USER FORM  -->
        <div class="row hfmsAddRow" style="display: none">
            <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading"> Location Type Details </header>
                    <button type="button" class="btn btn-success hfmsShowUsresBut">Show
                        Location Type</button>
                    <div class="panel-body">
                        <div class="position-center">
                            <form role="form" class="hrfsSubmitCollegeForm"
                                  data-parsley-validate="">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Location Type Name</label> <input
                                        type="text" class="form-control hfmsCollegeName"
                                        placeholder="Location Name" jsonKey="name" required>
                                </div>
                                <button class="btn btn-primary" type="submit">Submit</button>
                                <img class="hfmsLoader" src="/hostelerp/assest/img/index.gif" />
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- ADD USER FORM  END -->

        <!-- UPDATE USER FORM  -->
        <div class="row hfmsUpdateRow" style="display: none">
            <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading"> Location Type Details </header>
                    <button type="button" class="btn btn-success hfmsShowUsresBut">Show
                        Location Type</button>
                    <div class="panel-body">
                        <div class="position-center">
                            <form role="form" class="hrfsUpdateCollegeForm"
                                  data-parsley-validate="">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Location Type Name</label> <input
                                        type="text" class="form-control hfmsUpdateCollegeName"
                                        placeholder="Location Type Name" jsonKey="name" required>
                                </div>
                                <input type="hidden" jsonKey="id" class="hfmsUpdateCollegeId">
                                <button class="btn btn-primary" type="submit">Update</button>
                                <img class="hfmsLoader" src="/hostelerp/assest/img/index.gif" />
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- UPDATE USER FORM  END -->
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
        $(".hfmsAddNewBtn").click(function() {
            $(".hfmsAddRow").show();
            $(".hfmsShowStudentDataRow").hide();
        });

        $(".hfmsShowUsresBut").click(function() {
            $(".hfmsAddRow").hide();
            $(".hfmsUpdateRow").hide();
            $(".hfmsShowStudentDataRow").show();
        });
            
    });
</script>