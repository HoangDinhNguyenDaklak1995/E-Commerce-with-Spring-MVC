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
						<h4 class="card-title">Edit Photo of ${product.name }</h4>
					</div>
					<div class="card-body">
						<s:form method="POST" name="form-profile" modelAttribute="photo"
							onsubmit="return validateForm()" enctype="multipart/form-data"
							action="${pageContext.request.contextPath}/admin/photo/edit">
							<div class="row">
		                      <div class="col-md-12">
		                      <label class="bmd-label-floating">File</label>
		                      <div class="custom-file-upload">
									<label for="file-upload" class="custom-file-upload1">
									    <i class="fa fa-cloud-upload"></i> Custom Upload
									</label>
									<input id="file-upload" type="file" name="file"/>
									<img src="${pageContext.request.contextPath}/uploads/images/${photo.name}" width="120">
								</div>
		                      </div>
		                    </div>
							<div class="row">
								<div class="col-md-6">
									<label class="bmd-label-floating">Main</label>
									<div class="form-check">
										<label class="form-check-label"> <s:checkbox
												cssClass="form-check-input" path="main" /> <span
											class="form-check-sign"> <span class="check"></span>
										</span>
										</label> 
									</div>
								</div>
								<div class="col-md-6">
								<label class="bmd-label-floating">Status</label>
									<div class="form-check">
										<label class="form-check-label"> <s:checkbox
												cssClass="form-check-input" path="status" /> <span
											class="form-check-sign"> <span class="check"></span>
										</span>
										</label> 
									</div>
								</div>
							</div>
							<button type="submit" class="btn btn-primary pull-right">Edit Photo</button>
							<s:hidden path="product.id" />
							<s:hidden path="id" />
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
		} else {
			notify('success', 'Success Message', 'Save in successfully');
		}
	}

	
</script>