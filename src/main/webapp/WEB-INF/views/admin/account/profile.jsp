<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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