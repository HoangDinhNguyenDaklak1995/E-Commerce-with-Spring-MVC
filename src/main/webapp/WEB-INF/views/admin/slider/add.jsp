<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title">Add Slide</h4>
					</div>
					<div class="card-body">
						<s:form method="POST" name="form-profile" modelAttribute="slides" onsubmit="return validateForm()"
						 action="${pageContext.request.contextPath}/admin/slider/add" enctype="multipart/form-data"> 	
							<div class="row">
								<div class="col-md-6">
								 <div class="custom-file-upload">
									<label for="file-upload" class="custom-file-upload1">
									    <i class="fa fa-cloud-upload"></i> Custom Upload
									</label>
									<input id="file-upload" type="file" name="file" multiple="multiple"/>
								</div>
								</div>
								<div class="col-md-6">
									<div class="form-check">
									<label class="bmd-label-floating" for="username">Status</label>
			                              <label class="form-check-label" style="left: 20px; bottom: 12px;">
			                                  <s:checkbox cssClass="form-check-input" path="status"/>
				                                  <span class="form-check-sign">
				                                    <span class="check"></span>
				                                  </span>
			                             </label>
	                              	</div>
                              	</div>	
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="bmd-label-floating" for="password">Description</label>
										<s:input path="description" cssClass="form-control" id="phone" required="required"/>
									</div>
								</div>
							</div>
							<button type="submit" class="btn btn-primary pull-right">Add Slide</button>
							<s:hidden path="id"/>
							<div class="clearfix"></div>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function validateForm() {
	var x = document.forms["form-profile"].value;
		if (x == "") {
			notify('warning', 'Warning Message', 'Save in wrong');
		}else{
			notify('success', 'Success Message', 'Save in successfully');
		}
	}
</script>