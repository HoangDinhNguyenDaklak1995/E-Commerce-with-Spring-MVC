<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/" title="Go to Home Page">Home</a><span>&raquo;</span></li>
				<li class="category13"><strong> Products Details </strong></li>
			</ul>
		</div>
	</div>
</div>
<section class="main-container col1-layout">
<c:set var="images" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }"></c:set>
    <div class="main container">
      <div class="col-main">
        <div class="row">
          <div class="product-view">
            <div class="product-essential">
              <form action="#" method="post" id="product_addtocart_form">
                <input name="form_key" value="6UbXroakyQlbfQzK" type="hidden">
                <div class="product-img-box col-sm-4 col-xs-12">
                  <div class="new-label new-top-left"> New </div>
                  <div class="product-image">
                    <div class="large-image"> <a href="${pageContext.request.contextPath}/uploads/images/${images.name}" class="cloud-zoom" id="zoom1" rel="useWrapper: false, adjustY:0, adjustX:20">
                     	<img alt="product-image" src="${pageContext.request.contextPath}/uploads/images/${images.name}"> </a> 
                     </div>
                    <div class="flexslider flexslider-thumb">
	                    <ul class="previews-list slides">
	                      <c:forEach var="photozoom" items="${photos }" >
	                        <li><a href='${pageContext.request.contextPath}/uploads/images/${photozoom.name}' class='cloud-zoom-gallery' 
	                        	rel="useZoom: 'zoom1', smallImage: '${pageContext.request.contextPath}/uploads/images/${photozoom.name }' ">
	                        	<img src="${pageContext.request.contextPath}/uploads/images/${photozoom.name}" style="width: 100px !important; height: 100px !important;" alt="Thumbnail 1"/></a>
	                       	</li>
	                       	</c:forEach>
	                    </ul>        
                    </div>
                  </div>
                  <!-- end: more-images -->
                  <div class="clear"></div>
                </div>
                <div class="product-shop col-sm-5 col-xs-12">
                  <div class="product-next-prev"> <a class="product-next" href="#"><span></span></a> <a class="product-prev" href="#"><span></span></a> </div>
                  <div class="product-name">
                    <h1>${product.name }</h1>
                  </div>
                  <div class="short-description">
                    <p>${product.description } </p>
                  </div>
                  <div class="ratings">
                    <div class="rating-box">
                      <div style="width:60%" class="rating"></div>
                    </div>
                    <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Your Review</a> </p>
                  </div>
                  <c:if test="${product.status == true }">
                  	<p class="availability in-stock">Availability: <span>In Stocks</span></p>
                  </c:if>
                  
                  <c:if test="${product.status == false }">
                  	<p class="availability">Availability: <span style="color: red;">Out of Stock</span></p>
                  </c:if>
                  <div class="price-block">
                    <div class="price-box">
                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> $315.99 </span> </p>
                      <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> $${product.price }</span> </p>
                    </div>
                  </div>
                  <div class="add-to-box">
                    <div class="add-to-cart">
                      <label>Qty :</label>
                      <select>
                        <option>1</option>
                        <option>2 </option>
                        <option>3</option>
                        <option>4</option>
                        <option>5 </option>
                        <option>6</option>
                        <option>7</option>
                        <option>8 </option>
                        <option>9</option>
                        <option>10</option>
                      </select>
                    </div>
                      <form  action="${pageContext.getServletContext().getContextPath()}/cart/buy/${product.id }" method="get">
                        	<button type="submit" title="Add to Cart" class="button btn-cart"><span>Add to Cart</span></button>
                        </form>
                  </div>
                  <div class="email-addto-box">
                    <p class="email-friend"><a href="#" data-toggle="tooltip" data-placement="top" data-original-title="Email to a Friend"><span></span></a></p>
                    <ul class="add-to-links">
                      <li><span class="separator">|</span> <a class="link-compare" href="compare.html" data-toggle="tooltip" data-placement="top" data-original-title="Add to Compare"></a></li>
                      <li> <a class="link-wishlist" href="wishlist.html"  data-toggle="tooltip" data-placement="top" data-original-title="Add to Wishlist"></a></li>
                    </ul>
                  </div>
                  <div class="toggle-content">
                    <div class="toggle toggle-white">
                      <h4 class="trigger"><a href="#">Product Description</a></h4>
                      <div style="display: none;" class="toggle_container tabcontent">
                        <div class="std">
                          <p>${product.details }<span class="read-more">… <a href="#">read more</a></span></p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="product-img-box col-sm-3 col-xs-12">
                  <div class="product-additional"><span class="product-additional"><img alt="custom block" 
                  src="${pageContext.request.contextPath}/resources/user/images/offer-banner5.png"></span></div>
                </div>
              </form>
              
              <!-- related Product Slider -->
              <div class="product-collateral"> 
                
                <!-- related Product Slider -->
                <section class="related-pro">
                  <div class="slider-items-products">
                    <div class="new_title center">
                      <h2>Featured Products</h2>
                    </div>
                    <div id="related-products-slider" class="product-flexslider hidden-buttons">
                      <div class="slider-items slider-width-col4 products-grid"> 
                        <!-- Item -->
                        <c:forEach var="product" items="${featured }">
								<c:set var="photo" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }"></c:set>
	                        <div class="item">
	                          <div class="col-item">
	                            <div class="item-inner">
	                              <div class="item-img">
	                                <div class="new-label new-top-left">New</div>
	                                <div class="item-img-info"> <a href="${pageContext.request.contextPath}/product/detail/${product.id}" title="Sample Product" 
	                                class="product-image"> 
	                                	<img src="${pageContext.request.contextPath}/uploads/images/${photo.name}" alt="Sample Product"> </a>
	                                  <div class="item-box-hover">
	                                    <div class="box-inner">
	                                      <div class="product-detail-bnt"><a  href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
	                                    </div>
	                                  </div>
	                                </div>
	                              </div>
	                              <div class="item-info">
	                                <div class="info-inner">
	                                  <div class="item-title"> <a href="${pageContext.request.contextPath}/product/detail/${product.id}" 
	                                  title="Sample Product">${product.name }</a> </div>
	                                  <div class="item-content">
	                                    <div class="rating">
	                                      <div class="ratings">
	                                        <div class="rating-box">
	                                          <div class="rating" style="width:80%"></div>
	                                        </div>
	                                        <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
	                                      </div>
	                                    </div>
	                                    <div class="item-price">
	                                      <div class="price-box"> <span class="regular-price" id="product-price-1"> <span class="price">$${product.price }</span> </span> </div>
	                                    </div>
	                                  </div>
	                                </div>
	                                <div class="actions"><span class="add-to-links"> <a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a>
	                                   <form  action="${pageContext.getServletContext().getContextPath()}/cart/buy/${product.id }" method="get">
				                        	<button type="submit" title="Add to Cart" class="button btn-cart"><span>Add to Cart</span></button>
				                        </form>
	                                  <a href="compare.html" class="link-compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
	                              </div>
	                            </div>
	                          </div>
	                        </div>
                        </c:forEach>
                        <!-- End Item --> 
                      </div>
                    </div>
                  </div>
                </section>
                <!-- related Product Slider End --> 
                
                <!-- Upsell Product Slider -->
                <section class="upsell-pro">
                  <div class="slider-items-products">
                    <div class="new_title center">
                      <h2>Latest Products</h2>
                    </div>
                    <div id="upsell-products-slider" class="product-flexslider hidden-buttons">
                      <div class="slider-items slider-width-col4 products-grid"> 
                        <!-- Item -->
                        <c:forEach var="product" items="${relatestProduct }">
								<c:set var="photo"	value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }"></c:set>
                        <div class="item">
                          <div class="col-item">
                            <div class="item-inner">
                              <div class="item-img">
                                <div class="new-label new-top-left">New</div>
                                <div class="item-img-info"> <a href="${pageContext.request.contextPath}/product/detail/${product.id}" 
                                title="Sample Product" class="product-image"> <img src="${pageContext.request.contextPath}/uploads/images/${photo.name}" alt="Sample Product"> </a>
                                  <div class="item-box-hover">
                                    <div class="box-inner">
                                      <div class="product-detail-bnt"><a  href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="item-info">
                                <div class="info-inner">
                                  <div class="item-title"> <a href="${pageContext.request.contextPath}/product/detail/${product.id}" title="Sample Product"> ${product.name } </a> </div>
                                  <div class="item-content">
                                    <div class="rating">
                                      <div class="ratings">
                                        <div class="rating-box">
                                          <div class="rating" style="width:80%"></div>
                                        </div>
                                        <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                      </div>
                                    </div>
                                    <div class="item-price">
                                      <div class="price-box"> <span class="regular-price"> <span class="price">$${product.price }</span> </span> </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="actions"><span class="add-to-links"> <a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a>
                                  <form  action="${pageContext.getServletContext().getContextPath()}/cart/buy/${product.id }" method="get">
		                        	<button type="submit" title="Add to Cart" class="button btn-cart"><span>Add to Cart</span></button>
		                        </form>
                                  <a href="compare.html" class="link-compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        </c:forEach>
                        <!-- End Item --> 
                      </div>
                    </div>
                  </div>
                </section>
                <!-- Upsell Product Slider End --> 
                
              </div>
            </div>
          </div>
          <div class="box-collateral box-reviews" id="customer-reviews">
              <div class="page-title">
                <h2>Reviews</h2>
              </div>
              <div class="box-reviews1">
                <div class="form-add">
                  <form id="review-form" method="post" action="http://www.magikcommerce.com/review/product/post/id/176/">
                    <h3>Write Your Own Review</h3>
                    <fieldset>
                      <h4>How do you rate this product? <em class="required">*</em></h4>
                      <span id="input-message-box"></span>
                      <table id="product-review-table" class="data-table">
                        <colgroup>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                        </colgroup>
                        <thead>
                          <tr class="first last">
                            <th>&nbsp;</th>
                            <th><span class="nobr">1 *</span></th>
                            <th><span class="nobr">2 *</span></th>
                            <th><span class="nobr">3 *</span></th>
                            <th><span class="nobr">4 *</span></th>
                            <th><span class="nobr">5 *</span></th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="first odd">
                            <th>Price</th>
                            <td class="value"><input type="radio" class="radio" value="11" id="Price_1" name="ratings[3]"></td>
                            <td class="value"><input type="radio" class="radio" value="12" id="Price_2" name="ratings[3]"></td>
                            <td class="value"><input type="radio" class="radio" value="13" id="Price_3" name="ratings[3]"></td>
                            <td class="value"><input type="radio" class="radio" value="14" id="Price_4" name="ratings[3]"></td>
                            <td class="value last"><input type="radio" class="radio" value="15" id="Price_5" name="ratings[3]"></td>
                          </tr>
                          <tr class="even">
                            <th>Value</th>
                            <td class="value"><input type="radio" class="radio" value="6" id="Value_1" name="ratings[2]"></td>
                            <td class="value"><input type="radio" class="radio" value="7" id="Value_2" name="ratings[2]"></td>
                            <td class="value"><input type="radio" class="radio" value="8" id="Value_3" name="ratings[2]"></td>
                            <td class="value"><input type="radio" class="radio" value="9" id="Value_4" name="ratings[2]"></td>
                            <td class="value last"><input type="radio" class="radio" value="10" id="Value_5" name="ratings[2]"></td>
                          </tr>
                          <tr class="last odd">
                            <th>Quality</th>
                            <td class="value"><input type="radio" class="radio" value="1" id="Quality_1" name="ratings[1]"></td>
                            <td class="value"><input type="radio" class="radio" value="2" id="Quality_2" name="ratings[1]"></td>
                            <td class="value"><input type="radio" class="radio" value="3" id="Quality_3" name="ratings[1]"></td>
                            <td class="value"><input type="radio" class="radio" value="4" id="Quality_4" name="ratings[1]"></td>
                            <td class="value last"><input type="radio" class="radio" value="5" id="Quality_5" name="ratings[1]"></td>
                          </tr>
                        </tbody>
                      </table>
                      <input type="hidden" value="" class="validate-rating" name="validate_rating">
                      <div class="review1">
                        <ul class="form-list">
                          <li>
                            <label class="required" for="nickname_field">Nickname<em>*</em></label>
                            <div class="input-box">
                              <input type="text" class="input-text required-entry" id="nickname_field" name="nickname">
                            </div>
                          </li>
                          <li>
                            <label class="required" for="summary_field">Summary<em>*</em></label>
                            <div class="input-box">
                              <input type="text" class="input-text required-entry" id="summary_field" name="title">
                            </div>
                          </li>
                        </ul>
                      </div>
                      <div class="review2">
                        <ul>
                          <li>
                            <label class="label-wide" for="review_field">Review<em class="required">*</em></label>
                            <div class="input-box">
                              <textarea class="required-entry" rows="3" cols="5" id="review_field" name="detail"></textarea>
                            </div>
                          </li>
                        </ul>
                        <div class="buttons-set">
                          <button class="button submit" title="Submit Review" type="submit"><span>Submit Review</span></button>
                        </div>
                      </div>
                    </fieldset>
                  </form>
                </div>
              </div>
              <div class="box-reviews2">
                <h3>Customer Reviews</h3>
                <div class="box visible">
                  <ul>
                    <li>
                      <table class="ratings-table">
                        <colgroup>
                        <col>
                        <col>
                        </colgroup>
                        <tbody>
                          <tr>
                            <th>Value</th>
                            <td><div class="rating-box">
                                <div class="rating" style="width:100%;"></div>
                              </div></td>
                          </tr>
                          <tr>
                            <th>Quality</th>
                            <td><div class="rating-box">
                                <div class="rating" style="width:100%;"></div>
                              </div></td>
                          </tr>
                          <tr>
                            <th>Price</th>
                            <td><div class="rating-box">
                                <div class="rating" style="width:100%;"></div>
                              </div></td>
                          </tr>
                        </tbody>
                      </table>
                      <div class="review">
                        <h6><a href="#/catalog/product/view/id/61/">Excellent</a></h6>
                        <small>Review by <span>Leslie Prichard </span>on 1/3/2014 </small>
                        <div class="review-txt"> I have purchased shirts from Minimalism a few times and am never disappointed. The quality is excellent and the shipping is amazing. It seems like it's at your front door the minute you get off your pc. I have received my purchases within two days - amazing.</div>
                      </div>
                    </li>
                    <li class="even">
                      <table class="ratings-table">
                        <colgroup>
                        <col>
                        <col>
                        </colgroup>
                        <tbody>
                          <tr>
                            <th>Value</th>
                            <td><div class="rating-box">
                                <div class="rating" style="width:100%;"></div>
                              </div></td>
                          </tr>
                          <tr>
                            <th>Quality</th>
                            <td><div class="rating-box">
                                <div class="rating" style="width:100%;"></div>
                              </div></td>
                          </tr>
                          <tr>
                            <th>Price</th>
                            <td><div class="rating-box">
                                <div class="rating" style="width:80%;"></div>
                              </div></td>
                          </tr>
                        </tbody>
                      </table>
                      <div class="review">
                        <h6><a href="#/catalog/product/view/id/60/">Amazing</a></h6>
                        <small>Review by <span>Sandra Parker</span>on 1/3/2014 </small>
                        <div class="review-txt"> Minimalism is the online ! </div>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="actions"> <a class="button view-all" id="revies-button"><span><span>View all</span></span></a> </div>
              </div>
              <div class="clear"></div>
            </div>
        </div>
      </div>
    </div>
  </section>