<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<section class="main-container col1-layout">
	<div class="main container">
		<div class="account-login">
			<div class="page-title">
				<h2>Login or Create an Account</h2>
			</div>
			<fieldset class="col2-set">
				<legend>Login or Create an Account</legend>
					<div class="col-1 new-users">
						<strong>New Customers</strong>
						<div class="content">
							<p>By creating an account with our store, you will be able to
								move through the checkout process faster, store multiple
								shipping addresses, view and track your orders in your account
								and more.</p>
							<div class="buttons-set">
								<button	onClick="window.location='${pageContext.request.contextPath}/customer-panel/register';"	class="button create-account" type="button">
									<span>Create an Account</span>
								</button>
							</div>
						</div>
					</div>
					<form action="${pageContext.request.contextPath}/customer/process-login" method="POST">
					<div class="col-2 registered-users">
						<strong>Login Customers</strong>
						<div class="content">
							<p>If you have an account with us, please log in.</p>
							<p class="required">${msg }</p>
							<ul class="form-list">
								<li><label for="email">Email Address 
									<span class="required">*</span></label> <br> 
									<input type="text" title="Email Address" class="input-text required-entry"
										id="username" value="" name="username">
								</li>
								<li><label for="pass">Password <span
										class="required">*</span></label> <br> 
									<input type="password"	title="Password" id="password"	class="input-text required-entry validate-password"
									name="password">
								</li>
							</ul>
							<div class="buttons-set">
								<button id="send2" name="send" type="submit" class="button login">
									<span>Login</span>
								</button>
							</div>
						</div>
					</div>
				</form>
			</fieldset>
		</div>

	</div>
</section>
