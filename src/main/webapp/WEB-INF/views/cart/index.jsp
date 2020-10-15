<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div class="breadcrumbs">
    <div class="container">
      <div class="row">
        <ul>
          <li class="home"> <a href="${pageContext.request.contextPath}/" title="Go to Home Page">Home</a><span>&raquo; </span></li>
          <li class="category13"><strong>Shoping Cart</strong></li>
        </ul>
      </div>
    </div>
 </div>
<section class="main-container col1-layout">
	<div class="main container">
		<div class="col-main">
			<div class="cart">
				<div class="page-title">
					<h2>Shopping Cart [${countItems } item]</h2>
				</div>
				<div class="table-responsive">
					<form method="post" action="${pageContext.request.contextPath}/cart/update" class="formcart">
						<input type="hidden" value="Vwww7itR3zQFe86m" name="form_key">
						<fieldset>
							<table id="shopping-cart-table" class="data-table cart-table">
								<thead>
									<tr class="first last">
										<th rowspan="1">&nbsp;</th>
										<th rowspan="1"><span class="nobr">Product Name</span></th>
										<th class="a-center" colspan="1"><span class="nobr">Unit
												Price</span></th>
										<th rowspan="1" class="a-center ">Quantity</th>
										<th class="a-center" colspan="1">Total</th>
										<th rowspan="1" class="a-center">&nbsp;</th>
									</tr>
								</thead>
								<tfoot>
									<tr class="first last">
										<td colspan="8" class="a-right last">
										<c:if test="${sessionScope.cart !=null}">
											<button type="submit" name="update_cart_action" value="update_qty" title="Update Cart"	class="button btn-update">
												<span>Update Cart</span>
											</button>
										</c:if>
										</td>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="items" items="${sessionScope.cart }" varStatus="i">
										<c:set var="images"
											value="${items.product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }"></c:set>
										<tr class="first odd">
											<td class="image"><a
												href="${pageContext.request.contextPath}/uploads/images/${images.name}"
												title="Sample Product" class="product-image"> <img
													width="75"
													src="${pageContext.request.contextPath}/uploads/images/${images.name}"
													alt="Women's Crepe Printed Black"></a></td>
											<td><h2 class="product-name">
													<a>${items.product.name }</a>
												</h2></td>
											<td class="a-center hidden-table"><span
												class="cart-price"> <span class="price">${items.product.price }</span>
											</span></td>
											<td class="a-center movewishlist"><input type="number"
												name="quantities" value="${items.quantity }" size="4"
												class="input-text qty" maxlength="12"></td>
											<td class="a-center movewishlist"><span
												class="cart-price"> <span class="price">${items.product.price * items.quantity }</span>
											</span></td>
											<td class="a-center last"><a
												href="${pageContext.request.contextPath}/cart/remove/${i.index}"
												title="Remove item" class="button remove-item"><span><span>Remove
															item</span></span></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</fieldset>
						<div class="cart-collaterals row">
							<div class="totals col-sm-6"></div>
							<div class="totals col-sm-6">
								<h3>Shopping Cart Total</h3>
								<div class="inner">
									<table id="shopping-cart-totals-table">
										<tfoot>
											<tr>
												<td colspan="1" class="a-left" style="">
												<strong>Grand Total</strong>
												</td>
												<td class="a-right" style="">
													<strong><span class="price">$${total }</span></strong>
												</td>
											</tr>
										</tfoot>
										<tbody>
											<tr>
												<td colspan="1" class="a-left" style="">Subtotal</td>
												<td class="a-right" style="">
													<span class="price">$${total}</span>
												</td>
											</tr>
										</tbody>
									</table>
									<ul class="checkout">
										<li>
											<button onclick="location.href='${pageContext.request.contextPath}/cart/checkout'" class="button btn-proceed-checkout"
												title="Proceed to Checkout" type="button">
												<span>Proceed to Checkout</span>
											</button>
										</li>
									</ul>
								</div>
								<!--inner-->
							</div>
						</div>
					</form>
					<tfoot>
						<tr class="first last">
							<td colspan="8" class="a-right last">
								<form action="${pageContext.request.contextPath}/" method="get">
									<button title="Continue Shopping" class="button btn-continue">
										<span>Continue Shopping</span>
									</button>
								</form>
							</td>
						</tr>
					</tfoot>
				</div>
			</div>
		</div>
	</div>
</section>