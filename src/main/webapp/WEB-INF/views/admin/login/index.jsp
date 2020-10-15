<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link	href="${pageContext.request.contextPath}/resources/admin/assets/login.css"	rel="stylesheet" />
<title>Login admin</title>
</head>
<body>
	<div class="col-md-4 col-md-offset-4" id="login">
		<section id="inner-wrapper" class="login">
			<article>
				<form action="${pageContext.request.contextPath}/admin/process-login" name="form-profile" method="post" onsubmit="return validateForm()">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope">
							</i></span> <input type="text" class="form-control"
								placeholder="User Name" name="username">
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-key">
							</i></span> <input type="password" class="form-control"
								placeholder="Password" name="password">
						</div>
					</div>
					<button type="submit" class="btn btn-success btn-block">Login</button>
				</form>
			</article>
		</section>
	</div>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
function validateForm() {
	var x = document.forms["form-profile"].value;
		if (x == "") {
			notify('warning', 'Warning Message', '${msg}');
		}else{
			notify('success', 'Success Message', '${msg}');
		}
	}
</script>
</body>
</html>