<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
		 		<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title ">Customer Table</h4>
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
										<th>ID</th>
										<th>Name</th>
										<th>Full name</th>
										<th>Address</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="c" items="${customers }">
										<tr>
											<td>${c.id }</td>
											<td>${c.username }</td>
											<td>${c.fullName }</td>
											<td>${c.address }</td>
											<td>${c.email }</td>
											<td>${c.phone }</td>
											<td>${c.status ? "Active" : "InActive" }</td>
											<td>
												<a href="${pageContext.request.contextPath}/admin/customer/invoices/${c.username}">Invoices</a>
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