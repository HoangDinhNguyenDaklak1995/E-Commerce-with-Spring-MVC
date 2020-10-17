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
						<h4 class="card-title">Sub Categories of ${category.name }</h4>
						<a href="${pageContext.request.contextPath}/admin/category/addsubcategories/${category.id}"><p class="card-category"> Add Sub categories</p></a>
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
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="c" items="${category.categories }">
										<tr>
											<td>${c.id }</td>
											<td>${c.name }</td> 
											<td>${c.status ? 'show' : 'hide' }</td>
											<td>
												<a href="${pageContext.request.contextPath}/admin/category/editsubcategory/${c.id}">Edit</a> |
											 	<a href="${pageContext.request.contextPath}/admin/category/deletesubcategory/${c.id}" id="slert"
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
		}else{
			notify('success', 'Success Message', 'Save in successfully');
		}
	}
</script>