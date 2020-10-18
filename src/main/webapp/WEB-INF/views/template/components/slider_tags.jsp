<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <section class="slider-intro">
    <div class="container">
      <div class="the-slideshow slideshow-wrapper">
        <ul style="overflow: hidden;" class="slideshow">
        <c:forEach var="c" items="${slides }">
          <li class="slide" style="display: block;">
            <p><a href="#"> <img src="${pageContext.request.contextPath}/uploads/images/${c.name}" alt="${c.description }"></a></p>
            <div class="caption light1 top-right">
              <div class="caption-inner">
                <p class="heading">Women Collection 2014</p>
                <div class="badge"><em>up to</em> 70% <span>OFF</span></div>
                <p class="heading1">${c.description }</p>
                <p class="intro-btn"><a  href="#" title="Click to see all features">Shop Now</a> </p>
              </div>
            </div>
          </li>
          </c:forEach>
        </ul>
        <a href="#" id="home-slides-prev" class="backward browse-button">previous</a> <a href="#" id="home-slides-next" class="forward browse-button">next</a>
        <div id="home-slides-pager" class="tab-pager tab-pager-img tab-pager-ring-lgray"></div>
      </div>
    </div>
  </section>