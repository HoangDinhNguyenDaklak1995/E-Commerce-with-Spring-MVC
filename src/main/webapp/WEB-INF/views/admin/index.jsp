<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-3 col-md-6 col-sm-6">
			<div class="card card-stats">
				<div class="card-header card-header-warning card-header-icon">
					<div class="card-icon">
						<i class="material-icons">content_copy</i>
					</div>
					<p class="card-category">New Orders</p>
					<h3 class="card-title">
						${invoice }
					</h3>
				</div>
				<div class="card-footer">
					<div class="stats">
						<i class="material-icons text-danger">warning</i> <a
							href="javascript:;">Get More Space...</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-6">
			<div class="card card-stats">
				<div class="card-header card-header-success card-header-icon">
					<div class="card-icon">
						<i class="material-icons">Products</i>
					</div>
					<p class="card-category">Products</p>
					<h3 class="card-title">${products }</h3>
				</div>
				<div class="card-footer">
					<div class="stats">
						<i class="material-icons">date_Update</i> Last 24 Hours
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-6">
			<div class="card card-stats">
				<div class="card-header card-header-danger card-header-icon">
					<div class="card-icon">
						<i class="material-icons">info_outline</i>
					</div>
					<p class="card-category">Fixed Issues</p>
					<h3 class="card-title">75</h3>
				</div>
				<div class="card-footer">
					<div class="stats">
						<i class="material-icons">local_offer</i> Tracked from Github
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-6">
			<div class="card card-stats">
				<div class="card-header card-header-info card-header-icon">
					<div class="card-icon">
						<i class="fa fa-twitter"></i>
					</div>
					<p class="card-category">Followers</p>
					<h3 class="card-title">+245</h3>
				</div>
				<div class="card-footer">
					<div class="stats">
						<i class="material-icons">update</i> Just Updated
					</div>
				</div>
			</div>
		</div>
	</div>
</div>