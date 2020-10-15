<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sidebar" data-color="purple" data-background-color="white"
	data-image="${pageContext.request.contextPath}/resources/admin/assets/img/sidebar-1.jpg">
	<div class="logo">
		<a href="${pageContext.request.contextPath}/admin/dardboard"
			class="simple-text logo-normal"> Creative Tim </a>
	</div>
	<div class="sidebar-wrapper">
		<ul class="nav">
			<li class="nav-item "><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/dardboard"> <i
					class="material-icons">dashboard</i>
					<p>Dashboard</p>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/account/profile">
					<i class="material-icons">person</i>
					<p>User Profile</p>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/category"> <i
					class="material-icons">content_paste</i>
					<p>Category List</p>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/product"> <i class="material-icons">library_books</i>
					<p>Products</p>
			</a></li>
			<li class="nav-item "><a class="nav-link" href="./icons.html">
					<i class="material-icons">bubble_chart</i>
					<p>Icons</p>
			</a></li>
			<li class="nav-item "><a class="nav-link" href="./map.html">
					<i class="material-icons">location_ons</i>
					<p>Maps</p>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="./notifications.html"> <i class="material-icons">notifications</i>
					<p>Notifications</p>
			</a></li>
			<li class="nav-item "><a class="nav-link" href="./rtl.html">
					<i class="material-icons">language</i>
					<p>RTL Support</p>
			</a></li>
		</ul>
	</div>
</div>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title">Product table </h4>
						<a href="${pageContext.request.contextPath}/admin/product/add"><p class="card-category"> Add Products</p></a>
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
										<th>Price</th>
										<th>Category</th>
										<th>Featured</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									 <c:forEach var="product" items="${products }">
										<tr>
											<td>${product.id }</td>
											<td>${product.name }</td> 
											<td>${product.price }</td> 
											<td>${product.category.name }</td>
											<td>${product.featured ? 'Featured' : '' }</td>  
											<td>${product.status ? 'Show' : 'Hide' }</td>
											<td>
												<a href="${pageContext.request.contextPath}/admin/product/edit/${product.id}">Edit</a> |
											 	<a href="${pageContext.request.contextPath}/admin/product/delete/${product.id}" id="slert"
												onclick="return confirm('are you sure?')">Delete</a> 
												|<a href="${pageContext.request.contextPath}/admin/photo/product/${product.id}">Photo</a> |
												<a href="${pageContext.request.contextPath}/admin/photo/add/${product.id}">Add Photo</a>
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