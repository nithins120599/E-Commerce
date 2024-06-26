<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>

<form method='POST' action="AddCategory.jsp">

  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">E-commerce</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            &nbsp;&nbsp;&nbsp;
            
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="AdminHome.jsp"><i class="fa-solid fa-house-signal" style="color: #10d594;"></i>Home</a>
                    </li>&nbsp;&nbsp;&nbsp;
                    
                    
					<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Category</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="AddCategory.jsp">Add Category</a></li>
            <li><a class="dropdown-item" href="ViewCategories.jsp">View Category</a></li>
          </ul>
        </li>
        
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Products</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="AddProduct.jsp">Add Products</a></li>
            <li><a class="dropdown-item" href="ViewProducts.jsp">View Products</a></li>
          </ul>
        </li>
        
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Customer</a>
          <ul class="dropdown-menu">
           
            <li><a class="dropdown-item" href="CustomerView.jsp">ViewCustomers</a></li>
            
          </ul>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="CustomerOrders.jsp">CustomerOrders</a>
           </li>
        
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Employee</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="AddEmployee.jsp">AddEmployee</a></li>
            <li><a class="dropdown-item" href="ViewEmployee.jsp">ViewEmployee</a></li>
            
          </ul>
        </li>
        
        
        
        
        
                    <li class="nav-item">
                        <a class="nav-link" href="AdminInvoiceView.jsp">Invoices</a>
                    </li>&nbsp;&nbsp;&nbsp;
                     <li class="nav-item">
                        <a class="nav-link" href="AdminFeedbackView.jsp">Feedback</a>
                    </li>&nbsp;&nbsp;&nbsp;
                     <li class="nav-item">
                        <a class="nav-link" href="AdminCustomerReview.jsp">Review</a>
                    </li>&nbsp;&nbsp;&nbsp;
                    <li class="nav-item">
                        <a class="nav-link" href="Logout.jsp">Logout</a>
                    </li>&nbsp;&nbsp;&nbsp;
                   
                </ul>
            </div>
        </div>
    </nav>
 </form> 
 
</body>

</html>