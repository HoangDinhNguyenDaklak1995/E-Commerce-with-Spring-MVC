<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<div class="main-container col2-left-layout">
    <div class="main container">
      <div class="page-title">
        <h1>Register</h1>
      </div>
      <div class="row">
        <section class="col-main col-sm-12">
          <ol class="one-page-checkout" id="checkoutSteps">
            <li id="opc-billing" class="section allow active">
              <div id="checkout-step-billing" class="step a-item">
                  <fieldset class="group-select">
                   <s:form id="co-billing-form" action="${pageContext.request.contextPath}/customer-panel/register" method="POST" modelAttribute="customer">
                    <p class="required">${err }</p>
                          <ul>
                            <li>
                              <div class="customer-name">
                                <div class="input-box name-firstname">
                                  <label for="billing:firstname"> User Name<span class="required">*</span></label>
                                  <br />
                                  <s:input path="username" cssClass="input-text required-entry" required="required"/>
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
                    	<button type="submit" class="button continue"><span>Register</span></button>
                    </s:form>
                  </fieldset>
              </div>
            </li>
          </ol>
        </section>
      </div>
    </div>
  </div>