
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Customers</title>

<!-- reference our stylesheet -->

<link type="text/css"
rel="stylesheet"
href="${pageContext.request.contextPath}/resources/css/style.css">

</head>
<body>
<div id="wrapper">
<div id="header">
CRM  Customer Relationship Manager
</div>
</div>

<div id="container">  
  <div id="content">
  
  <!-- put new button : add new customer -->
  <input type="button" value="Add Customer"
  onclick="window.location.href='showFormForAdd'; return=false;"
  class="add button">
  
  <pre></pre>
  <!-- add out html table here -->
  
  <table>
  <tr>
  <th>Id</th>
  <th>FirstName</th>
  <th>LastName</th>
  <th>Email</th>
  <th>Action</th>
  </tr>
  
  <!-- loop over and print out the customers  -->
  
  <c:forEach var="tempCustomer" items="${customers}">
  
  <!-- construct an update link with customer id -->
  <c:url var="updateLink" value="/customer/showFormForUpdate">
  <c:param name="customerId" value="${tempCustomer.id}"></c:param>
  </c:url>
  
  <!-- construct delete link with customer id -->
  <c:url var="deleteLink" value="/customer/delete">
  <c:param name="customerId" value="${tempCustomer.id}"></c:param>
  </c:url>
  
  <tr>
    <td> "${tempCustomer.id}" </td>
  <td> ${tempCustomer.firstName}  </td> 
    <td> ${tempCustomer.lastName}  </td>
    <td> ${tempCustomer.email}</td>
    <td>
    <!-- display the update link -->
    <a href="${updateLink}">Update</a>
    |
    <a href="${deleteLink}"
    onclick="if(!(confirm('Are you want delete this customer?'))) return false">Delete</a>
    </td>
  
  </tr>
  
  </c:forEach>
  
  </table>
  
  </div>

</div>

</body>
</html>