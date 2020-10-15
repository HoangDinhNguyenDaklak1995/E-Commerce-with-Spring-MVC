<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <%@taglib prefix="mt" uri="http://nilpointer.net/" %>
    <%@taglib prefix="mb" uri="http://nilpointer-mobile.net/" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Accord, premium HTML5 &amp; CSS3 template</title>
<link rel="icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/slider.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/style.css" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Bitter:400,700,400italic' rel='stylesheet' type='text/css'>
</head>

<body class="cms-index-index">
<div class="page"> 
  <!-- Header -->
  <header class="header-container">
    <div class="header-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-5 col-md-5 col-xs-6"> 
            
            <!-- Header Language -->
            <div class="dropdown block-language-wrapper"> <a role="button" data-toggle="dropdown" data-target="#" class="block-language dropdown-toggle" href="#"> <img src="${pageContext.request.contextPath}/resources/user/images/english.png" alt="language"> English <i class="icon-angle-down"></i> </a>
              <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="${pageContext.request.contextPath}/resources/user/images/english.png" alt="language"> English </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="${pageContext.request.contextPath}/resources/user/images/francais.png" alt="language"> French </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="${pageContext.request.contextPath}/resources/user/images/german.png" alt="language"> German </a></li>
              </ul>
            </div>
            
            <!-- End Header Language --> 
            <!-- Header Currency -->
            <div class="dropdown block-currency-wrapper"> <a role="button" data-toggle="dropdown" data-target="#" class="block-currency dropdown-toggle" href="#"> USD <i class="icon-angle-down"></i></a>
              <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> $ - Dollar </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> £ - Pound </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> € - Euro </a></li>
              </ul>
            </div>
            
            <!-- End Header Currency -->
            <div class="welcome-msg hidden-xs"> Default welcome msg! </div>
          </div>
          <div class="col-lg-7 col-md-7 col-xs-6"> 
            
            <!-- Header Top Links -->
            <div class="toplinks">
              <div class="links">
                <!-- End Header Company -->
                <c:if test="${pageContext.request.userPrincipal.name != null }">
                	<div class="myaccount"><a title="My Account" href="${pageContext.request.contextPath}/customer-panel/dashboard">
                		<span>Welcome ${pageContext.request.userPrincipal.name }</span></a>
                	</div>
                	<div class="myaccount"><a title="Logout" href="${pageContext.request.contextPath}/customer/process-logout">
                		<span>Logout</span></a>
                	</div>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name == null }">
                	<div class="login"><a href="${pageContext.request.contextPath}/customer-panel">
                		<span>Log In</span></a>
                	</div>
                </c:if>
              </div>
            </div>
            <!-- End Header Top Links --> 
          </div>
        </div>
      </div>
    </div>
   
    <div class="header container">
      <div class="row">
        <div class="col-lg-3 col-sm-4 col-md-3"> 
          <!-- Header Logo -->
          <div class="logo"> <a title="Magento Commerce" href="${pageContext.request.contextPath}/"><img alt="Magento Commerce" src="${pageContext.request.contextPath}/resources/user/images/logo.png"></a> </div>
          <!-- End Header Logo --> 
        </div>
        <div class="col-lg-6 col-sm-4 col-md-3">
       		<mt:seachTag/>
        </div>
        <div class="col-lg-3 col-xs-12">
          <div class="top-cart-contain">
            <div class="mini-cart">
            	<c:if test="${sessionScope.cart.size() == null }">
            		 <div data-toggle="dropdown" data-hover="dropdown" class="basket dropdown-toggle"> <a href="#"><span>Shopping Cart (0)</span></a></div>
            	</c:if>
            	<c:if test="${sessionScope.cart.size() != null }">
            		  <div data-toggle="dropdown" data-hover="dropdown" class="basket dropdown-toggle"> <a href="#"><span>Shopping Cart (${sessionScope.cart.size() })</span></a></div>
            	</c:if>
              <div>
                <div style="display: none;" class="top-cart-content arrow_box">
                  <div class="block-subtitle">Recently added item(s)</div>
                  <c:forEach var="items" items="${sessionScope.cart }" varStatus="i">
                  <c:set var="images" value="${items.product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }"></c:set>
                  <ul id="cart-sidebar" class="mini-products-list">
                    <li class="item odd"> <a href="${pageContext.request.contextPath}/uploads/images/${images.name}" title="Sample Product" class="product-image">
                    	<img src="${pageContext.request.contextPath}/uploads/images/${images.name}" alt="Sample Product" width="55"></a>
                      <div class="product-details"> <a href="#" title="Remove This Item" onClick="" class="btn-remove1">Remove This Item</a> <a class="btn-edit" title="Edit item" href="#">Edit item</a>
	                        <p class="product-name"><a href="product_detail.html">${items.product.name }</a> </p>
	                        <strong>${items.quantity }</strong> x <span class="price">$${items.product.price }</span> 
                       </div>
                    </li>
                  </ul>
                   </c:forEach>
                  <div class="top-subtotal">Subtotal: <span class="price">$${total }</span></div>
                  <div class="actions">
                    <button class="btn-checkout" ><span>Checkout</span></button>
                    <button class="view-cart" ><span>View Cart</span></button>
                  </div>
                </div>
              </div>
            </div>
            <div id="ajaxconfig_info" style="display:none"> <a href="#/"></a>
              <input value="" type="hidden">
              <input id="enable_module" value="1" type="hidden">
              <input class="effect_to_cart" value="1" type="hidden">
              <input class="title_shopping_cart" value="Go to shopping cart" type="hidden">
            </div>
          </div>
        </div>
      </div>
    </div>
   </header>
  <!-- end header --> 
  <!-- Navbar -->
  <nav>
    <div class="container">
      <div class="nav-inner"> 
        <!-- mobile-menu -->
        <div class="hidden-desktop" id="mobile-menu">
			<mb:CategoryMobileList/>
        </div>
		<mt:CategoryList/>
      </div>
    </div>
  </nav>
	
	<c:if test="${isHome != null }">
		<mt:SliderCategoryList/>
	</c:if>
	
  <section class="main-container col1-layout home-content-container">
    <tiles:insertAttribute name="content"/>
  </section>
  <!-- End main container --> 
  
	<tiles:insertAttribute name="blog"/>
  <!-- End Latest Blog -->
  <div class="brand-logo ">
    <div class="container">
      <div class="row">
        <div class="slider-items-products col-lg-12">
          <div id="brand-logo-slider" class="product-flexslider hidden-buttons">
            <div class="slider-items slider-width-col6"> 
              
              <!-- Item -->
              <div class="item"> <a href="#x"><img src="${pageContext.request.contextPath}/resources/user/images/b-logo1.png" alt="Image"></a> </div>
              <!-- End Item --> 
              
              <!-- Item -->
              <div class="item"> <a href="#x"><img src="${pageContext.request.contextPath}/resources/user/images/b-logo2.png" alt="Image"></a> </div>
              <!-- End Item --> 
              
              <!-- Item -->
              <div class="item"> <a href="#x"><img src="${pageContext.request.contextPath}/resources/user/images/b-logo3.png" alt="Image"></a> </div>
              <!-- End Item --> 
              
              <!-- Item -->
              <div class="item"> <a href="#x"><img src="${pageContext.request.contextPath}/resources/user/images/b-logo4.png" alt="Image"></a> </div>
              <!-- End Item --> 
              
              <!-- Item -->
              <div class="item"> <a href="#x"><img src="${pageContext.request.contextPath}/resources/user/images/b-logo5.png" alt="Image"></a> </div>
              <!-- End Item --> 
              
              <!-- Item -->
              <div class="item"> <a href="#x"><img src="${pageContext.request.contextPath}/resources/user/images/b-logo6.png" alt="Image"></a> </div>
              <!-- End Item --> 
              
              <!-- Item -->
              <div class="item"> <a href="#x"><img src="${pageContext.request.contextPath}/resources/user/images/b-logo1.png" alt="Image"></a> </div>
              <!-- End Item --> 
              
              <!-- Item -->
              <div class="item"> <a href="#x"><img src="${pageContext.request.contextPath}/resources/user/images/b-logo4.png" alt="Image"></a> </div>
              <!-- End Item --> 
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<tiles:insertAttribute name="footer"/>
</div>
<tiles:insertAttribute name="confort"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/prototype.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/common.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/owl.carousel.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/toggle.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/pro-img-slider.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/jquery.flexslider.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/cloud-zoom.js"></script> 
<script type="text/javascript">
    //<![CDATA[
	jQuery(function() {
		jQuery(".slideshow").cycle({
			fx: 'scrollHorz', easing: 'easeInOutCubic', timeout: 10000, speedOut: 800, speedIn: 800, sync: 1, pause: 1, fit: 0, 			pager: '#home-slides-pager',
			prev: '#home-slides-prev',
			next: '#home-slides-next'
		});
	});
    //]]>
    </script>
</body>
</html>