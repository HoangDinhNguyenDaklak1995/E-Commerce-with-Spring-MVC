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
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/account/profile"><i
					class="material-icons">person</i>
					<p>User Profile</p> </a></li>
			<li class="nav-item "><a class="nav-link" href="${pageContext.request.contextPath}/admin/category">
					<i class="material-icons">content_paste</i>
					<p>Category List</p>
			</a></li>
			<li class="nav-item "><a class="nav-link"
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
			<div class="col-md-8">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title">Edit Profile</h4>
						<p class="card-category">Complete your profile</p>
					</div>
					<div class="card-body">
						<s:form method="POST" name="form-profile" modelAttribute="account" onsubmit="return validateForm()"
						 action="${pageContext.request.contextPath}/admin/account/profile">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="bmd-label-floating" for="username">User
											name</label>
										<s:input path="username" cssClass="form-control" id="username" required="required"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="bmd-label-floating" for="password">Password</label>
										<s:input path="password" cssClass="form-control" id="pasword" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="bmd-label-floating">Full Name</label> 
										<s:input path="fullName" cssClass="form-control" id="fullName"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="bmd-label-floating">Address</label> 
										<s:input path="address" cssClass="form-control" id="address" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="bmd-label-floating" for="password">Emall</label>
										<s:input path="email" cssClass="form-control" id="email" required="required"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="bmd-label-floating" for="password">Phone</label>
										<s:input path="phone" cssClass="form-control" id="phone" required="required"/>
									</div>
								</div>
							</div>
							<button type="submit" class="btn btn-primary pull-right">Update Profile</button>
							<s:hidden path="id"/>
							<div class="clearfix"></div>
						</s:form>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card card-profile">
				<% request.setAttribute("isManager", request.isUserInRole("ROLE_ADMIN")); %>
					<div class="card-avatar">
						<c:choose>
						    <c:when test="${requestScope.isManager}">
						      	<a href="javascript:;"> <img class="img" src="${pageContext.request.contextPath}/resources/admin/assets/img/faces/marc.jpg" /></a>
						    </c:when>
						    <c:otherwise>
						     	<a href="javascript:;"> <img class="img" src="${pageContext.request.contextPath}/resources/admin/assets/img/faces/avatar.jpg" /></a>
						    </c:otherwise>
						 </c:choose>
					</div>
					<div class="card-body">	
						 <c:choose>
						    <c:when test="${requestScope.isManager}">
						      	<h4 class="card-category text-gray">ROLE ADMIN</h4>
						    </c:when>
						    <c:otherwise>
						     	<h4 class="card-category text-gray">ROLE CUSTOMER</h4>
						    </c:otherwise>
						 </c:choose>
						<h4 class="card-title">${pageContext.request.userPrincipal.name }</h4>
						<p class="card-description">Don't be scared of the truth
							because we need to restart the human foundation in truth And I
							love you like Kanye loves Kanye I love Rick Owens’ bed design but
							the back is...</p>
						<a href="javascript:;" class="btn btn-primary btn-round">Follow</a>
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
			notify('warning', 'Warning Message', 'Save error .');
		}else{
			notify('success', 'Success Message', 'Save success.');
		}
	}
</script>