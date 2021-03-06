<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
 <div class="main-container col2-left-layout">
    <div class="main container">
      <div class="page-title">
        <h2>Customer Panel</h2>
      </div>
      <div class="row">
        <section class="col-main col-sm-9">
  <ol class="one-page-checkout" id="checkoutSteps">
            <li id="opc-billing" class="section allow active">
              <div id="checkout-step-billing" class="step a-item" style="">
                <fieldset class="group-select">
                   <s:form id="co-billing-form" action="${pageContext.request.contextPath}/customer-panel/dashboard" method="POST" modelAttribute="customer">
                    <p class="required">${err }</p>
                          <ul>
                            <li>
                              <div class="customer-name">
                               	<s:input path="id" cssClass="input-text required-entry" type="hidden" required="required"/>
                               		<s:input path="role" cssClass="input-text required-entry" type="hidden" required="required"/>
                                <div class="input-box name-firstname">
                                  <label for="billing:firstname"> User Name<span class="required">*</span></label>
                                  <br />
                                  <s:input path="username" cssClass="input-text required-entry" readonly="true" />
                                </div>
                                <div class="input-box name-lastname">
                                  <label for="billing:lastname"> Full Name<span class="required">*</span> </label>
                                  <br />
                                  <s:input path="fullName" cssClass="input-text required-entry" required="required"/>
                                </div>
                              </div>
                            </li>
                            <li>
                              <div class="input-box">
                                <label for="billing:company">Password</label>
                                <br />
                                <s:input path="password" cssClass="input-text required-entry" type="password"/>
                              </div>
                              <div class="input-box">
                                <label for="billing:email">Email Address <span class="required">*</span></label>
                                <br />
                                <s:input path="email" cssClass="input-text required-entry" type="email" required="required"/>
                              </div>
                            </li>
                            <li>
                              <div class="input-box">
                                <label for="billing:telephone">Telephone <span class="required">*</span></label>
                                <br />
                                <s:input path="phone" cssClass="input-text required-entry"/>
                              </div>
                              <div class="input-box">
                                <label for="billing:fax">Address</label>
                                <br />
                                <s:input path="address" cssClass="input-text required-entry"/>
                              </div>
                            </li>
                          </ul>
                    	<button type="submit" class="button continue"><span>Update</span></button>
                    	<s:hidden path="id"/>
                    </s:form>
                  </fieldset>
              </div>
            </li>
          </ol>
        </section>
          <aside class="col-left sidebar col-sm-3 col-xs-12">
          <div class="block block-account">
            <div class="block-title">My Account</div>
            <div class="block-content">
              <ul>
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li class="current"><a href="${pageContext.request.contextPath}/customer-panel/dashboard">Customer Panel</a></li>
                <li><a href="${pageContext.request.contextPath}/customer-panel/history">History</a></li>
              </ul>
            </div>
          </div>
        </aside>
      </div>
    </div>
  </div>
