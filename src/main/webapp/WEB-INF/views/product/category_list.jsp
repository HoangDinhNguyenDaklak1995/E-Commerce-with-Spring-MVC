<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tb" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="string"  uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="cs" uri="http://nilpointer.net/" %>
<jsp:useBean  id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder"/>
<c:url value="/product/list/${category.id }" var="pagedLink">
	<c:param name="p" value="~"/>
</c:url>
  <div class="breadcrumbs">
    <div class="container">
      <div class="row">
        <ul>
          <li class="home"> <a href="${pageContext.request.contextPath}/" title="Go to Home Page">Home</a><span>&raquo; </span></li>
          <li class="category13"><strong>${category.name }</strong></li>
        </ul>
      </div>
    </div>
 </div>
  <div class="main-container col2-right-layout">
    <div class="main container">
      <div class="row">
        <section class="col-main col-sm-9 col-sm-push-3">
          <div class="category-title">
            <h1>${category.name }</h1>
          </div>
          <div class="category-description std">
            <div class="slider-items-products">
              <div id="category-desc-slider" class="product-flexslider hidden-buttons">
                <div class="slider-items slider-width-col1"> 
                  
                  <!-- Item -->
                  <div class="item"> <a href="#x"><img alt="" src="${pageContext.request.contextPath}/resources/user/images/women_banner.png"></a>
                    <div class="cat-img-title cat-bg cat-box">
                      <h2 class="cat-heading">Category Banner</h2>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                  </div>
                  <div class="item"> <a href="#x"><img alt="" src="${pageContext.request.contextPath}/resources/user/images/women_banner1.png"></a> </div>        
                </div>
              </div>
            </div>
          </div>
          <div class="category-products">
            <div class="toolbar">
              <div class="sorter">
                	<div class="view-mode"> 
                		<a class="button button-grid" title="Grid" href="${pageContext.request.contextPath}/product/category/${category.id}">Grid</a>
                  		<span class="button button-active button-list" title="List">List</span>
                   </div>
              </div>
              <div class="pager">
                <div class="pages">
                  <label>Page:</label>
                  	<tb:paging pagedLink="${pagedLink }" pagedListHolder="${pagedListHolder }"/>
                </div>
                 <label class="font-10-page"> ${category.products.size() } products are available</label>
              </div>
            </div>
			  <ol id="products-list" class="products-list">
			  <c:forEach var="product" items="${pagedListHolder.pageList }">
			  <c:set var="images" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }"></c:set>
              <li class="item">
                <div class="col-item">
                  <div class="product-image"> <a href="${pageContext.request.contextPath}/product/detail/${product.id}" title="Sample Product"> 
                  <img class="small-image" src="${pageContext.request.contextPath}/uploads/images/${images.name}" alt="HTC Rhyme Sense"> </a> </div>
                  <div class="product-shop">
                    <h2 class="product-name"><a title=" Sample Product" href="${pageContext.request.contextPath}/product/detail/${product.id}"> ${product.name } </a></h2>
                    <div class="price-box">
                      <p class="old-price"> <span class="price-label"></span> <span id="old-price-212" class="price"> $442.99 </span> </p>
                      <p class="special-price"> <span class="price-label"></span> <span id="product-price-212" class="price"> $${product.price } </span> </p>
                    </div>
                    <div class="ratings">
                      <div class="rating-box">
                        <div style="width:50%" class="rating"></div>
                      </div>
                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#review-form">Add Your Review</a> </p>
                    </div>
                     <div class="desc std">
                      <p style="width: 550px">${product.description } </p>
                      <p>
                       <a class="link-learn" title="" href="#">Learn More</a> </p>
                    </div>
                    <div class="actions">
                         <form  action="${pageContext.getServletContext().getContextPath()}/cart/buy/${product.id }" method="get">
                        	<button type="submit" title="Add to Cart" class="button btn-cart"><span>Add to Cart</span></button>
                        </form>
                      <span class="add-to-links"> <a title="Add to Wishlist" class="button link-wishlist" href="wishlist.html"><span>Add to Wishlist</span></a> <a title="Add to Compare" class="button link-compare" href="compare.html"><span>Add to Compare</span></a> </span> </div>
                  </div>
                </div>
              </li>
              </c:forEach>
            </ol>
          </div>
        </section>
        <aside class="col-right sidebar col-sm-3 col-xs-12 col-sm-pull-9">
          <div class="side-nav-categories">
            <div class="block-title"> Categories </div>
            <!--block-title--> 
            <!-- BEGIN BOX-CATEGORY -->
            <div class="box-content box-category">
            	 <cs:CategoryListBottom/>
            </div>
            <!--box-content box-category--> 
          </div>
          <div class="block block-layered-nav">
            <div class="block-title">Shop By</div>
            <div class="block-content">
              <p class="block-subtitle">Shopping Options</p>
              <dl id="narrow-by-list">
                <dt class="odd">Price</dt>
                <dd class="odd">
                  <ol>
                    <li> <a href="#"><span class="price">$0.00</span> - <span class="price">$99.99</span></a> (6) </li>
                    <li> <a href="#"><span class="price">$100.00</span> and above</a> (6) </li>
                  </ol>
                </dd>
                <dt class="even">Manufacturer</dt>
                <dd class="even">
                  <ol>
                    <li> <a href="#">TheBrand</a> (9) </li>
                    <li> <a href="#">Company</a> (4) </li>
                    <li> <a href="#">LogoFashion</a> (1) </li>
                  </ol>
                </dd>
                <dt class="odd">Color</dt>
                <dd class="odd">
                  <ol>
                    <li> <a href="#">Green</a> (1) </li>
                    <li> <a href="#">White</a> (5) </li>
                    <li> <a href="#">Black</a> (5) </li>
                    <li> <a href="#">Gray</a> (4) </li>
                    <li> <a href="#">Dark Gray</a> (3) </li>
                    <li> <a href="#">Blue</a> (1) </li>
                  </ol>
                </dd>
                <dt class="last even">Size</dt>
                <dd class="last even">
                  <ol>
                    <li> <a href="#">S</a> (6) </li>
                    <li> <a href="#">M</a> (6) </li>
                    <li> <a href="#">L</a> (4) </li>
                    <li> <a href="#">XL</a> (4) </li>
                  </ol>
                </dd>
              </dl>
            </div>
          </div>
          <div class="block block-subscribe">
            <div class="block-title">Newsletter Sign Up</div>
            <form action="http://www.magikcommerce.com//newsletter/subscriber/new/" method="post" id="newsletter-validate-detail">
              <div class="block-content">
                <div class="form-subscribe-header"> Sign up for our newsletter:</div>
                <input type="text" name="email" id="newsletter" title="Sign up for our newsletter" class="input-text required-entry validate-email" placeholder="Enter your email address">
                <div class="actions">
                  <button class="button button-subscribe" title="Submit" type="submit"><span>Subscribe</span></button>
                </div>
              </div>
            </form>
          </div>
          <div class="block block-cart">
            <div class="block-title ">My Cart</div>
            <div class="block-content">
              <div class="summary">
                <p class="amount">There are <a href="#">2 items</a> in your cart.</p>
                <p class="subtotal"> <span class="label">Cart Subtotal:</span> <span class="price">$27.99</span> </p>
              </div>
              <div class="ajax-checkout">
                <button type="submit" title="Submit" class="button button-checkout"><span>Checkout</span></button>
              </div>
              <p class="block-subtitle">Recently added item(s) </p>
              <ul>
                <li class="item"> <a class="product-image" title="Fisher-Price Bubble Mower" href="product_detail.html"><img width="60" alt="Fisher-Price Bubble Mower" src="products-images/product1.jpg"></a>
                  <div class="product-details">
                    <div class="access"> <a class="btn-remove1" title="Remove This Item" href="#"> <span class="icon"></span> Remove </a> </div>
                    <p class="product-name"> <a href="product_detail.html">Sample Product</a> </p>
                    <strong>1</strong> x <span class="price">$19.99</span> </div>
                </li>
                <li class="item last"> <a class="product-image" title="Prince Lionheart Jumbo Toy Hammock" href="product_detail.html"><img width="60" alt="Prince Lionheart Jumbo Toy Hammock" src="products-images/product2.jpg"></a>
                  <div class="product-details">
                    <div class="access"> <a class="btn-remove1" title="Remove This Item" href="#"> <span class="icon"></span> Remove </a> </div>
                    <p class="product-name"> <a href="product_detail.html"> Sample  Product </a> </p>
                    <strong>1</strong> x <span class="price">$8.00</span> 
                    <!--access clearfix--> 
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </aside>
      </div>
    </div>
  </div>