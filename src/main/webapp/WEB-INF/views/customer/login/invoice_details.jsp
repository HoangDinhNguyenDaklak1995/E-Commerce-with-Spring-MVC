<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<div class="main-container col2-left-layout">
	<div class="main container">
		<div class="page-title">
			<h2>Invoice Details by [History]</h2>
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
										<th><span class="nobr">Photo</span></th>
										<th><span class="nobr">price</span></th>
										<th><span class="nobr">Quantity</span></th>
										<th><span class="nobr">Total</span></th>
									</tr>
								</thead>
								<tbody>
								<c:set var="total" value="0"></c:set>
								<c:forEach var="iv" items="${invoice.invoiceDetailses }">
								<c:set var="total" value="${toatal + iv.product.quantity * iv.product.price   }"></c:set>
								 <c:set var="images" value="${iv.product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }"></c:set>
									<tr class="first odd">
										<th>${iv.product.id }</th>
										<th>${iv.product.name }</th>
										<th>
											<a href="${pageContext.request.contextPath}/product/detail/${iv.product.id}" title="Sample Product" class="product-image">
                    						<img src="${pageContext.request.contextPath}/uploads/images/${images.name}" alt="Sample Product" width="55"></a>
										</th>
										<th>${iv.product.price }</th>
										<th>${iv.product.quantity }</th>
										<th>$${iv.product.quantity * iv.product.price}</th>
									</tr>
								</c:forEach>
								<tr class="first odd">
									<td colspan="5">Total</td>
									<td>$${total }</td>
								</tr>
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
