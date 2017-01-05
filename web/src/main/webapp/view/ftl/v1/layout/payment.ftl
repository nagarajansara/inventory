<#include "lib/header.ftl"> <#include "lib/leftsidebar.ftl">
<link href="${baseURL}/assest/plugin/cfdatatable.css" rel="stylesheet" />
<link rel="stylesheet"
	href="${baseURL}/assest/plugin/selecttwo/select_min.css" media="screen" />
<style>
.hfmsDelBtn {
	display: none !important;
}
</style>

<section id="main-content" class="hfmsMainContent">
	<section class="wrapper">
		<div class="row hfmsShowRoomDataRow">
			<div class="col-md-12">
				<section class="panel">
					<header class="panel-heading"> Payment List </header>
					<button type="button" class="btn btn-success hfmsAddNewBtn">ADD
						NEW</button>
					<div class="panel-body">
						<a type="button" target="_blank"
							href="${baseURL}/api/report/generateReport?type=pdf&filename=hostelerptest"
							class="btn btn-danger pull-right"><i class="fa fa-print"></i></a>
						<table id="dynamic-table" width="100%"
							class="pkDataCommonTable table table-striped table-bordered dt-responsive nowrap">
							<thead>
								<tr>
									<th>College Name</th>
									<th>Student Name</th>
									<th>Amount</th>
									<th>Status</th>
									<th>Manage</th>
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
					<header class="panel-heading"> Payment Details </header>
					<button type="button" class="btn btn-success hfmsShowRoomBut">Show
						Payment</button>
					<div class="panel-body">
						<div class="position-center">
							<form role="form" class="hrfsSubmitRoomForm"
								data-parsley-validate="">
								<div class="form-group">
									<label for="inputSuccess">College Name</label> <select
										class="form-control hfmsCollegeColName hfmsCommonRoomSelectize"
										placeholder="Select College" data-parsley-required
										jsonKey="collegeid">
										<option value=""></option> <#if model.responseData.college??>
										<#list model.responseData.college as element>
										<option value="${element.id}">${element.name}</option>
										</#list> </#if>
									</select>
								</div>
								<div class="form-group">
									<label for="inputSuccess">Student Name</label> <select
										class="form-control hfmsStudentNameSelect hfmsCommonRoomSelectize"
										data-parsley-required jsonKey="studentid"
										placeholder="Select Student">
										<option value=""></option>
									</select>
								</div>
								<div class="form-group">
									<label for="inputSuccess">Status</label> <select
										class="form-control hfmsStatus hfmsCommonRoomSelectize"
										placeholder="Select room type" jsonKey="status"
										data-parsley-required>
										<option value=""></option>
										<option value="paid">Paid</option>
										<option value="pending">Pending</option>
										<option value="nonpaid">Nonpaid</option>
									</select>
								</div>
								<div class="form-group">
									<label for="inputSuccess"
										class="col-sm-3 control-label col-lg-3">Amount</label> <input
										type="text" placeholder="numeric values"
										class="form-control hfmsAmount" jsonKey="amount" required>
								</div>
								<button class="btn btn-primary " type="submit">Submit</button>
								<img class="hfmsLoader" src="${baseURL}/assest/img/index.gif" />
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
					<header class="panel-heading"> Payment Details </header>
					<button type="button" class="btn btn-success hfmsShowRoomBut">Show
						Payment</button>
					<div class="panel-body">
						<div class="position-center">
							<form role="form" class="hrfsUpdateSubmitRoomForm"
								data-parsley-validate="">
								<div class="form-group">
									<label for="inputSuccess">College Name</label> <select
										class="form-control hfmsUpdateCollegeName hfmsCommonRoomSelectize"
										placeholder="Select College" data-parsley-required
										jsonKey="collegeid">
										<option value="">Select College</option>
									</select>
								</div>
								<div class="form-group">
									<label for="inputSuccess">Student Name</label> <select
										class="form-control hfmsUpdateStudentNameSelect hfmsCommonRoomSelectize"
										data-parsley-required jsonKey="studentid"
										placeholder="Select Student">
										<option value="">Select Student</option>
									</select>
								</div>
								<div class="form-group">
									<label for="inputSuccess">Status</label> <select
										class="form-control hfmsUpdateStatusSelect hfmsCommonRoomSelectize"
										placeholder="Select room type" jsonKey="status"
										data-parsley-required>
										<option value=""></option>
										<option value="paid">Paid</option>
										<option value="pending">Pending</option>
										<option value="nonpaid">Nonpaid</option>
									</select>
								</div>
								<div class="form-group">
									<label for="inputSuccess"
										class="col-sm-3 control-label col-lg-3">Amount</label> <input
										type="text" placeholder="numeric values"
										class="form-control hfmsUpdateAmount" jsonKey="amount"
										required>
								</div>
								<input type="hidden" jsonKey="id" name="id" class="hfmsPaymentRoomNo">
								<button class="btn btn-primary" type="submit">Update</button>
								<img class="hfmsLoader" src="${baseURL}/assest/img/index.gif" />
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
		<!-- UPDATE USER FORM  -->

		<!-- UPDATE USER FORM  -->

	</section>
</section>


<#include "lib/footer.ftl">
<script src="${baseURL}/assest/plugin/cfdatatable.js"></script>
<script src="${baseURL}/assest/plugin/selecttwo/select_min.js"></script>
<script src="${baseURL}/assest/plugin/numeric.min.js"></script>
<script src="${baseURL}/assest/plugin/getjsonparams.js"></script>
<script type="text/javascript">
    var isEditableMode = false;
    var PRE_ROOM_ALLOCATION_STATUS = "alloted";

    $(".hfmsLeftSideMenu li a").removeClass("active");
    $(".hfms_Payment").addClass("active");
    localStorage.setItem("menuId", $(".hfms_Payment").attr('pk_id'));

    $(".hfmsAmount").numeric();
    $(".hfmsUpdateAmount").numeric();

    var aoColumns = [ {
	"mData" : "collegename",
	'bSortable' : false
    }, {
	"mData" : "studentname",
	'bSortable' : false
    }, {
	"mData" : "amount",
	'bSortable' : false
    }, {
	"mData" : "status",
	'bSortable' : false
    }, {
	"mData" : "editBtn",
	'bSortable' : false
    }, ];

    hfmsSetDataTableValues("#dynamic-table", "http://" + location.host
	    + "${baseURL}/api/manager/getPayments", aoColumns, 'College Name');

    $(".hfmsAddNewBtn").click(function() {
	$(".hfmsAddRow").show();
	$(".hfmsShowRoomDataRow").hide();
	$(".hfmsUpdateRow").hide();
    })

    $(".hfmsShowRoomBut").click(function() {
	$(".hfmsAddRow").hide();
	$(".hfmsShowRoomDataRow").show();
	$(".hfmsUpdateRow").hide();
    });

    $(".hfmsCommonRoomSelectize").selectize({
	sortField : {
	    field : "text",
	    direction : "asc"
	}
    });

    $(".hrfsUpdateSubmitRoomForm").submit(function(event) {
	event.preventDefault();
	if ($('.hrfsUpdateSubmitRoomForm').parsley().validate()) {
	    var config = {};
	    config.jqSelector = ".hrfsUpdateSubmitRoomForm";
	    var constJSONParam = new ConstJSONParam(config);
	    var paramMap = constJSONParam.getParamsValue();
	    paramMap["preStatus"] = PRE_ROOM_ALLOCATION_STATUS;
	    console.log(paramMap);
	    paramMap["id"] = $(".hfmsPaymentRoomNo").val();
	    ctDAO.updatePaymentsViaId(paramMap, function(data){
	    	if(data && data.responseStatus == bmpUtil.RESPONSE_STATUS)
	    	    {
	    			alert("updated successfully");
	    	    }
	    	else
	    	    {
	    	    	alert(data.responseMsg);
	    	    }
	    });
	}
    });

    $(document).on('click', ".hfmsEditBtn", function() {

	isEditableMode = true;
	$(".hfmsAddRow").hide();
	$(".hfmsShowRoomDataRow").hide();
	$(".hfmsUpdateRow").show();

	var paymentId = $(this).attr('pk_id');
	var param = {
	    "id" : paymentId
	};
	ctDAO.getPaymentsViaId(param, function(data) {
	    if (data && data.responseStatus == bmpUtil.RESPONSE_STATUS) {
		var responseData = data.responseData;
		var selectize = $(".hfmsUpdateCollegeName")[0].selectize
		selectize.clearOptions();
		selectize.addOption({
		    text : responseData[0].collegename,
		    value : responseData[0].collegeid
		});
		selectize.setValue(responseData[0].collegeid);
		selectize.disable();
		var selectize = $(".hfmsUpdateStudentNameSelect")[0].selectize
		selectize.clearOptions();
		selectize.addOption({
		    text : responseData[0].studentname,
		    value : responseData[0].studentid
		});
		selectize.setValue(responseData[0].studentid);
		selectize.disable();
		var selectize = $(".hfmsUpdateStatusSelect")[0].selectize
		selectize.clearOptions();
		selectize.addOption({
		    text : responseData[0].status,
		    value : responseData[0].status
		});
		selectize.setValue(responseData[0].status);
		selectize.disable();
		$(".hfmsUpdateAmount").val(responseData[0].amount);

		$(".hfmsPaymentRoomNo").val(responseData[0].id);


	    } else {
		alert(data.responseMsg);
	    }

	});

    });

    $(".hrfsSubmitRoomForm").submit(function(event) {
	event.preventDefault();
	if ($('.hrfsSubmitRoomForm').parsley().validate()) {
	    var config = {};
	    config.jqSelector = ".hrfsSubmitRoomForm";
	    var constJSONParam = new ConstJSONParam(config);
	    var paramMap = constJSONParam.getParamsValue();
	    ctDAO.addPayment(paramMap, function(data) {
		if (data && data.responseStatus == bmpUtil.RESPONSE_STATUS) {
		    alert("Payment added successfully");
		    bmpUtil.reLoad();
		} else {
		    alert(data.responseMsg);
		    bmpUtil.reLoad();
		}
	    });

	}
    });

    $('.hfmsCollegeColName').on('change', function() {
	var collegeId = $(this).val();
	hfmsGetStudentsViaCollegeId(collegeId, '.hfmsStudentNameSelect');
    });

    function hfmsGetStudentsViaCollegeId(collegeId, jqStudentSelector) {
	if (collegeId && !isEditableMode) {
	    var param = {
		"collegeId" : collegeId
	    }
	    ctDAO.getAllStudentViaCollegeId(param, function(data) {
		if (data && data.responseStatus == bmpUtil.RESPONSE_STATUS) {
		    var studentSelectize = $(jqStudentSelector)[0].selectize;
		    studentSelectize.clearOptions();

		    var responseData = data.responseData;
		    if (responseData && responseData.length > 0) {

			for (var i = 0; i < responseData.length; i++) {
			    studentSelectize.addOption({
				text : responseData[i].name,
				value : responseData[i].id
			    });
			}
			studentSelectize.refreshItems();

		    }

		} else {
		    alert(data.responseMsg);
		}
	    });
	}
    }
</script>


