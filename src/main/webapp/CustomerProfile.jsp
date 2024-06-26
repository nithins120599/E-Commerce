<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@page import="java.util.List" %>
    <%@page import="com.example.model.Customer" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <jsp:include page="Header.jsp" />
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
       
        
        
      </head>

      <body>
        <jsp:include page="CustomerMenu.jsp" />

        <% Customer customer=new Customer(); 
        List<Customer> customerList = customer.getCustomerById((int)session.getAttribute("customerId"));
        
        
        %>

          <% for (Customer customerObj : customerList) 
          { 
          
          %>

            <div class="container mt-3">

              <div class="card" style="width:400px">
                <div class="card-header">
                <center>
                  <div class="col-sm-6">
			   	<td><img src='uploads/<%=customerObj.getProfilePic() %>'  class="rounded-circle img-fluid " 
 style='width: 160px; height: 200px' />


                  </div>
                </center>
                  <div><A href='CustomerEditProfile.jsp?tableName=customers&setColName=profilePic&whereColName=customerId&conditionValue=<%=customerObj.getCustomerId() %>&colName=productImage1'><i class='far fa-edit' style='font-size:36px'></i>Edit</a>
                  </div>

                </div>
                <div class="card-body" style="width:400px">
                  <div class="row">
                    <div class="col-sm-6">
                      <h6>CustomerId</h6>
                      <p class="text-muted">
                        <%=customerObj.getCustomerId()%>
                      </p>
                    </div>
                    <div class="col-sm-6">
                      <h6>FirstName</h6>
                      <p class="text-muted">
                        <%=customerObj.getFirstName()%>
                      </p>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-sm-6">
                      <h6>LastName</h6>
                      <p class="text-muted">
                        <%=customerObj.getLastName()%>
                      </p>
                    </div>
                    <div class="col-sm-6">
                      <h6>MobileNumber</h6>
                      <p class="text-muted">
                        <%=customerObj.getMobileNumber()%>
                      </p>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-sm-6">
                      <h6>EmailId</h6>
                      <p class="text-muted">
                        <%=customerObj.getEmailId()%>
                      </p>
                    </div>
                    <div class="col-sm-6">
                      <h6>Password</h6>
                      <p class="text-muted">
                        <%=customerObj.getPassword()%>
                      </p>
                    </div>
                  </div>


               
                <div class="row">
                  <div class="col-sm-6">
                    <h6>Register Date</h6>
                    <p class="text-muted">
                      <%=customerObj.getRegisterDate()%>
                    </p>
                  </div>

                </div>
              </div>

                


                <div class="card-footer" style="width:400px">

                  <div class="row">
                    <div class="col-sm-6">
                      <a href='/FullstackEcommerce/EditCustomer.jsp?customerId=<%=customerObj.getCustomerId() %> '><button type="submit" class="btn btn-danger">Edit</a>
                      
                      <% 
                      } 
                      %>
                    </div>
                  </div>
                </div>
              </div>
            </div>

      </body>

      </html>