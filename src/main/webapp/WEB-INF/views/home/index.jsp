<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<div class="std">
				<div class="best-pro col-lg-12">
				<div class="slider-items-products">
					<div class="new_title center">
						<h2>Featured Products</h2>
					</div>
					<div id="best-seller-slider"
						class="product-flexslider hidden-buttons">
						<div class="slider-items slider-width-col4">
							<!-- Item -->
							<c:forEach var="product" items="${featured }">
								<c:set var="photo" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }"></c:set>
								<div class="item">
									<div class="col-item">
										<div class="item-inner">
											<div class="item-img">
												<div class="new-label new-top-left">New</div>
												<div class="item-img-info">
													<a href="${pageContext.request.contextPath}/product/detail/${product.id}" title="Sample Product"
														class="product-image">
														 <img src="${pageContext.request.contextPath}/uploads/images/${photo.name}"	alt="Sample Product">
													</a>
													<div class="item-box-hover">
														<div class="box-inner">
															<div class="product-detail-bnt">
																<a href="quick_view.html" class="button detail-bnt">
																	<span> Quick View</span>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="item-info">
												<div class="info-inner">
													<div class="item-title">
														<a href="${pageContext.request.contextPath}/product/detail/${product.id}" title="Sample Product">${product.name }</a>
													</div>
													<div class="item-content">
														<div class="rating">
															<div class="ratings">
																<div class="rating-box">
																	<div class="rating" style="width: 80%"></div>
																</div>
																<p class="rating-links">
																	<a href="#">1 Review(s)</a> <span class="separator">|</span>
																	<a href="#">Add Review</a>
																</p>
															</div>
														</div>
														<div class="item-price">
															<div class="price-box">
																<span class="regular-price" id="product-price-1">
																	<span class="price">$${product.price }</span>
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="actions">
													<span class="add-to-links"> <a href="wishlist.html"
														class="link-wishlist" title="Add to Wishlist"><span>Add
																to Wishlist</span></a>
														  <form  action="${pageContext.getServletContext().getContextPath()}/cart/buy/${product.id }" method="get">
								                        	<button type="submit" title="Add to Cart" class="button btn-cart"><span>Add to Cart</span></button>
								                        </form> <a href="compare.html" class="link-compare"
														title="Add to Compare"><span>Add to Compare</span></a></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="best-pro col-lg-12">
				<div class="slider-items-products">
					<div class="new_title center">
						<h2>Latest Products</h2>
					</div>
					<div id="best-seller-slider"
						class="product-flexslider hidden-buttons">
						<div class="slider-items slider-width-col4">
							<!-- Item -->
							<c:forEach var="product" items="${products }">
								<c:set var="photo"	value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }"></c:set>
								<div class="item">
									<div class="col-item">
										<div class="item-inner">
											<div class="item-img">
												<div class="new-label new-top-left">New</div>
												<div class="item-img-info">
													<a href="${pageContext.request.contextPath}/product/detail/${product.id}" title="Sample Product"
														class="product-image"> 
														<img	src="${pageContext.request.contextPath}/uploads/images/${photo.name}" alt="Sample Product">
													</a>
													<div class="item-box-hover">
														<div class="box-inner">
															<div class="product-detail-bnt">
																<a href="quick_view.html" class="button detail-bnt">
																	<span> Quick View</span>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="item-info">
												<div class="info-inner">
													<div class="item-title">
														<a href="${pageContext.request.contextPath}/product/detail/${product.id}" title="Sample Product">${product.name }</a>
													</div>
													<div class="item-content">
														<div class="rating">
															<div class="ratings">
																<div class="rating-box">
																	<div class="rating" style="width: 80%"></div>
																</div>
																<p class="rating-links">
																	<a href="#">1 Review(s)</a> <span class="separator">|</span>
																	<a href="#">Add Review</a>
																</p>
															</div>
														</div>
														<div class="item-price">
															<div class="price-box">
																<span class="regular-price" id="product-price-1">
																	<span class="price">$${product.price }</span>
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="actions">
													<span class="add-to-links"> <a href="wishlist.html"
														class="link-wishlist" title="Add to Wishlist"><span>Add
																to Wishlist</span></a>
														  <form  action="${pageContext.getServletContext().getContextPath()}/cart/buy/${product.id }" method="get">
								                        	<button type="submit" title="Add to Cart" class="button btn-cart"><span>Add to Cart</span></button>
								                        </form> <a href="compare.html" class="link-compare"
														title="Add to Compare"><span>Add to Compare</span></a></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
