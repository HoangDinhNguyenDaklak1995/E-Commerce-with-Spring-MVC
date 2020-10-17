<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
		 		<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title ">Invoices List</h4>
					</div>
					<c:if test="${error != null }">
						<div class="alert alert-success slert" >
                  			${error}
                  		</div>
					</c:if>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
									<tr>
										<th>&nbsp;</th>
										<th><span class="nobr">Name</span></th>
										<th><span class="nobr">Created</span></th>
										<th><span class="nobr">Status</span></th>
										<th><span class="nobr">Action</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="invoice" items="${invoices }">
									<tr class="first odd">
										<th>${invoice.id }</th>
										<td class="value">${invoice.name }</td>
										<td class="value">${invoice.created }</td>
										<td class="value">${invoice.status }</td>
										<td class="value"><a href="${pageContext.request.contextPath}/admin/invoices/details/${invoice.id }">Details</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
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
		}else{
			notify('success', 'Success Message', 'Save success.');
		}
};
</script>