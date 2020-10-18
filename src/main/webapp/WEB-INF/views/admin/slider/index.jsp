<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
		 		<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title ">Slider Table</h4>
						<a href="${pageContext.request.contextPath}/admin/slider/add"><p class="card-category"> Add Slider</p></a>
					</div>
					<c:if test="${error != null }">
						<div class="alert alert-success slert" >
                  			${error}
                  		</div>
					</c:if>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
									<tr>
										<th>Photo</th>
										<th>Status</th>
										<th>Description</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="c" items="${slide }">
										<tr>
											<td>
												<img src="${pageContext.request.contextPath}/uploads/images/${c.name }" width="70" height="70">
											</td>
											<td>${c.status ? "Active" : "InActive" }</td>
											<td>${c.description }</td>
											<td>
												<a href="${pageContext.request.contextPath}/admin/slider/edit/${c.id}">Update</a>|
												<a href="${pageContext.request.contextPath}/admin/slider/delete/${c.id}" id="slert"
												onclick="return confirm('are you sure?')">Delete</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
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
			notify('warning', 'Warning Message', '${error}');
		}else{
			notify('success', 'Success Message', 'Save success.');
		}
};
</script>