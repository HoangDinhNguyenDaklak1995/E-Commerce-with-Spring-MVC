<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<div class="main-container col2-left-layout">
	<div class="main container">
		<div class="page-title">
			<h2>History</h2>
		</div>
		<div class="row">
			<section class="col-main col-sm-9">
				<div class="form-add">
					<form id="review-form" method="post" action="">
						<fieldset>
							<span id="input-message-box"></span>
							<table id="product-review-table" class="data-table">
								<thead>
									<tr class="first last">
										<th>&nbsp;</th>
										<th><span class="nobr">Name</span></th>
										<th><span class="nobr">Created</span></th>
										<th><span class="nobr">Status</span></th>
										<th><span class="nobr">Action</span></th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="invoice" items="${invoices }">
									<tr class="first odd">
										<th>${invoice.id }</th>
										<td class="value">${invoice.name }</td>
										<td class="value">${invoice.created }</td>
										<td class="value">${invoice.status }</td>
										<td class="value"><a href="${pageContext.request.contextPath}/customer-panel/invoice_details/${invoice.id }">Details</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</fieldset>
					</form>
				</div>
			</section>
			<aside class="col-left sidebar col-sm-3 col-xs-12">
				<div class="block block-account">
					<div class="block-title">My Account</div>
					<div class="block-content">
						<ul>
							<li><a href="${pageContext.request.contextPath}/">Home</a></li>
							<li><a
								href="${pageContext.request.contextPath}/customer-panel/dashboard">Customer
									Panel</a></li>
							<li class="current"><a
								href="${pageContext.request.contextPath}/customer-panel/history">History</a></li>
						</ul>
					</div>
				</div>
			</aside>
		</div>
	</div>
</div>
