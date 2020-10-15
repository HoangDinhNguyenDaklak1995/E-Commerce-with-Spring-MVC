<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/"
					title="Go to Home Page">Home</a><span>&raquo; </span></li>
				<li class="category13"><strong>Thanks</strong></li>
			</ul>
		</div>
	</div>
</div>
<section class="main-container col1-layout">
	<div class="main container">
		<div class="col-main">
			<div class="cart">
				<div class="page-title">
					<h2>Thanks for buying My Products</h2>
				</div>
				<form action="${pageContext.request.contextPath}/" method="get">
					<button title="Continue Shopping" class="button btn-continue" 
					style="bottom: 0.5rem ; left: 0">
						<span>Continue Shopping</span>
					</button>
				</form>
			</div>
		</div>
	</div>
</section>