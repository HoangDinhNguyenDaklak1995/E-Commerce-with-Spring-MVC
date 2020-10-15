<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sidebar" data-color="purple" data-background-color="white"
	data-image="${pageContext.request.contextPath}/resources/admin/assets/img/sidebar-1.jpg">
	<div class="logo">
		<a href="${pageContext.request.contextPath}/admin/dardboard"
			class="simple-text logo-normal"> Creative Tim </a>
	</div>
	<div class="sidebar-wrapper">
		<ul class="nav">
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/dardboard"> <i
					class="material-icons">dashboard</i>
					<p>Dashboard</p>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/account/profile"><i
					class="material-icons">person</i>
					<p>User Profile</p> </a></li>
			<li class="nav-item "><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/category"> <i
					class="material-icons">content_paste</i>
					<p>Category List</p>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/product"> <i
					class="material-icons">library_books</i>
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
						<h4 class="card-title">Edit Products of ${product.category.name }</h4>
					</div>
					<div class="card-body">
						<s:form method="POST" name="form-profile" modelAttribute="product"
							onsubmit="return validateForm()"
							action="${pageContext.request.contextPath}/admin/product/edit">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="bmd-label-floating" for="name">Name</label>
										<s:input path="name" cssClass="form-control" id="name"
											required="required" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="bmd-label-floating">Price</label>
										<s:input path="price" min="0" cssClass="form-control"
											id="price" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="bmd-label-floating">Quantity</label>
										<s:input path="quantity" cssClass="form-control" id="quantity"
											min="0" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="bmd-label-floating" for="description">Description</label>
										<s:textarea path="description" cssClass="form-control"
											id="description" required="required" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="bmd-label-floating" for="details">Details</label>
										<s:textarea path="details" cssClass="form-control"
											id="details" required="required" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-check">
										<label class="form-check-label"> <s:checkbox
												cssClass="form-check-input" path="status" /> <span
											class="form-check-sign"> <span class="check"></span>
										</span>
										</label> <label class="bmd-label-floating">Status</label>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-check">
										<label class="form-check-label"> <s:checkbox
												cssClass="form-check-input" path="featured" /> <span
											class="form-check-sign"> <span class="check"></span>
										</span>
										</label> <label class="bmd-label-floating">Featured</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="bmd-label-floating" for="">Categories</label>
										<div class="box">
											<s:select path="category.id">
												<c:forEach var="cat" items="${categories }">
													<optgroup label="${cat.name }"></optgroup>
													<c:if test="${!cat.categories.isEmpty() }">
														<c:forEach var="subCategory" items="${cat.categories }">
														<option value="${ subCategory.id}" ${category.id == subCategory.id ? 'selected="selected"' : ""}>${ subCategory.name}</option>
														</c:forEach>
													</c:if>
												</c:forEach>
											</s:select>
										</div>
									</div>
								</div>
							</div>
							<button type="submit" class="btn btn-primary pull-right">Edit
								Products</button>
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