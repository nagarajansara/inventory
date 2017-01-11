<%@ include file="lib/header.jsp"%>
<%@ include file="lib/leftsidebar.jsp"%>
<section id="main-content" class="hfmsMainContent">
    <section class="wrapper">
        <div class="row hfmsShowStudentDataRow">
            <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading"> User List</header>
                    <button type="button" class="btn btn-success hfmsAddNewBtn">ADD
                        NEW</button>
                    <div class="panel-body">
                        <table id="dynamic-table" width="100%"
                               class="pkDataCommonTable table table-striped table-bordered dt-responsive nowrap">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
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
                    <header class="panel-heading"> User Details </header>
                    <button type="button" class="btn btn-success hfmsShowUsresBut">Show
                        User</button>
                    <div class="panel-body">
                        <div class="position-center">
                            <form role="form" class="hrfsSubmitCollegeForm"
                                  data-parsley-validate="">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Name</label> <input
                                        type="text" class="form-control hfmsCollegeName"
                                        placeholder="User Name" jsonKey="name" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Mobile No</label> <input
                                        type="text" class="form-control hfmsMobileNo"
                                        placeholder="Mobile No" jsonKey="mobileno" required>
                                </div>
<!--                                <div class="form-group">
                                    <label for="exampleInputEmail1">Address</label>
                                    <textarea rows="6" class="form-control hfmsCollegeAddress"
                                              required jsonKey="address"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">City</label> <input
                                        style="width: 100%;" type="hidden" name="locationid"
                                        id="hfmsCity">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">State</label> <input
                                        style="width: 100%;" type="hidden" name="locationid"
                                        id="hfmsState">
                                </div>-->
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Select Location</label> <select
                                        class="form-control m-bot15 hfmsCountry hfmsCommonCollegeSelectize" placeholder="Select Country" data-parsley-required jsonKey="country">
                                        <option value=""></option>
                                        <option value="india">Head Office</option>
                                        <option value="india">Region</option>
                                        <option value="india">District</option>
                                        <option value="india">College</option>
                                        <option value="india">Trade</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">User Type</label> <select
                                        class="form-control m-bot15 hfmsCountry hfmsCommonCollegeSelectize" placeholder="Select Country" data-parsley-required jsonKey="country">
                                        <option value=""></option>
                                        <option value="india">Super Admin</option>
                                        <option value="india">Admin</option>
                                        <option value="india">Staff</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">User Name</label> <input
                                        type="text" class="form-control hfmsMobileNo"
                                        placeholder="User name" jsonKey="mobileno" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Password</label> <input
                                        type="password" class="form-control hfmsMobileNo"
                                        placeholder="Password" jsonKey="mobileno" required>
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
                    <header class="panel-heading"> College Details </header>
                    <button type="button" class="btn btn-success hfmsShowUsresBut">Show
                        College</button>
                    <div class="panel-body">
                        <div class="position-center">
                            <form role="form" class="hrfsUpdateCollegeForm"
                                  data-parsley-validate="">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">College Name</label> <input
                                        type="text" class="form-control hfmsUpdateCollegeName"
                                        placeholder="Student Name" jsonKey="name" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Mobile No</label> <input
                                        type="text" class="form-control hfmsUpdateMobileNo"
                                        placeholder="Mobile No" jsonKey="mobileno" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Address</label>
                                    <textarea rows="6" class="form-control hfmsUpdateCollegeAddress"
                                              required jsonKey="address"></textarea>
                                </div>
                                <div class="form-group hfmsCityParent"></div>
                                <div class="form-group hfmsStateParent"></div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Select Country</label> <select
                                        class="form-control m-bot15 hfmsUpdateCountry hfmsCommonCollegeSelectize"  placeholder="Select Country" data-parsley-required jsonKey="country">
                                        <option value="india">India</option>
                                    </select>
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