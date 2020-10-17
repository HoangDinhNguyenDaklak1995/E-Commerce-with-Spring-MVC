<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title ">Details List</h4>
					</div>
					<c:if test="${error != null }">
						<div class="alert alert-success slert">${error}</div>
					</c:if>
					<div class="row">
						<div class="col-sm-3">
							<div class="card card-profile">
								<div class="card-body">
									<p class="card-description">Name: ${invoice.account.fullName }</p>
									<p class="card-description">Address: ${invoice.account.address }</p>
									<p class="card-description">Phone :${invoice.account.phone }</p>
									<p class="card-description">Email :${invoice.account.email }</p>
								</div>
							</div>
						</div>
						<div class="col-sm-9">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead class=" text-primary">
											<tr>
												<th><span class="nobr">Id</span></th>
												<th><span class="nobr">Name</span></th>
												<th><span class="nobr">Photo</span></th>
												<th><span class="nobr">Price</span></th>
												<th><span class="nobr">Quantity</span></th>
												<th><span class="nobr">Subtotal</span></th>
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
									<c:if test="${invoice.status == 'Pending' }">
									<button type="submit" onclick="location.href='${pageContext.request.contextPath}/admin/invoices/update/${invoice.id}'" class="btn btn-primary pull-right">
										Update<div class="ripple-container"></div>
									</button>
									</c:if>
								</div>
							</div>
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
			notify('warning', 'Warning Message', '${error}');
		} else {
			notify('success', 'Success Message', 'Save success.');
		}
	};
</script>