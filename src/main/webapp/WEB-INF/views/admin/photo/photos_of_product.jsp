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
						<h4 class="card-title">Products List of ${product.name }</h4>
						<a href="${pageContext.request.contextPath}/admin/photo/add/${product.id}"><p class="card-category"> Add Photo</p></a>
					</div>
						<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
									<tr>
										<th>ID</th>
										<th>Photo</th>
										<th>Status</th>
										<th>Main</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									 <c:forEach var="p" items="${product.photos }">
										<tr>
											<td>${p.id }</td>
											<td><img src="${pageContext.request.contextPath}/uploads/images/${p.name}" width="120"></td> 
											<td>${p.status ? "Show" : "Hide"}</td> 
											<td>${p.main ? "Main" : ""}</td>  
											<td>
												<a href="${pageContext.request.contextPath}/admin/photo/edit/${p.id}">Edit</a> |
											 	<a href="${pageContext.request.contextPath}/admin/photo/delete/${p.id}/${p.product.id}" id="slert"
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
			notify('warning', 'Warning Message', 'Save in wrong');
		} else {
			notify('success', 'Success Message', 'Save in successfully');
		}
	}

	
</script>