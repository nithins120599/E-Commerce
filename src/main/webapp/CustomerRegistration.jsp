<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Header.jsp" />

<script>
    function checkPasswordStrength(password) {
      // Define your password strength criteria and calculations here
      // This is a simple example, you can modify it based on your requirements

      var strength = 0;

      // Check the length of the password
      if (password.length >= 8) {
        strength += 1;
      }

      // Check if the password contains both uppercase and lowercase characters
      if (/[a-z]/.test(password) && /[A-Z]/.test(password)) {
        strength += 1;
      }

      // Check if the password contains at least one number
      if (/\d/.test(password)) {
        strength += 1;
      }

      // Check if the password contains at least one special character
      if (/[$&+,:;=?@#|'<>.^*()%!-]/.test(password)) {
        strength += 1;
      }

      // Display the password strength
      var strengthText = "";
      switch (strength) {
        case 0:
        case 1:
          strengthText = "Weak";
          break;
        case 2:
          strengthText = "Moderate";
          break;
        case 3:
        case 4:
          strengthText = "Strong";
          break;
      }

      document.getElementById("password-strength").innerHTML = "Password Strength: " + strengthText;
	  if(strengthText=="Weak"){
		document.getElementById("password-strength").style.color = 'red';
    }else if(strengthText=="Moderate"){
		document.getElementById("password-strength").style.color = 'blue';
    }else if(strengthText=="Strong"){
		document.getElementById("password-strength").style.color = 'green';
    }
	}
	
	
	
	function validatePasswords(cpassword){
		var cpwd = document.getElementById("password").value;
		if(cpassword == cpwd){
		document.getElementById("cpwdLabel").innerHTML = "Passwords match";
		document.getElementById("cpwdLabel").style.color = "green";
		}else{
		document.getElementById("cpwdLabel").innerHTML = "Passwords not match";
		document.getElementById("cpwdLabel").style.color = "red";
		}
	
	}
  </script>


</head>
<body>
<form action="/FullstackEcommerce/AddCustomersServlet" method="post" enctype="multipart/form-data">
		
		<div class="container mt-3 card " style='background-color:#AEE7ED' >
			<h1 class="text-danger ">Customer Registration</h1>
			
			<div class="row">
				<div class="col-sm-6">
					<label class="text-dark">First Name</label> 
					<input type="text" class="form-control" name="firstName">
				</div>
			
				
	
				<div class="col-sm-6">
					<label class="text-dark">LastName</label> 
					<input type="text" class="form-control" name="lastName">
				</div>
			</div>
			

			<div class="row">
				<div class="col-sm-6">
				<label class="text-dark">Mobile Number</label> 
					<input type="number" class="form-control" name="mobileNumber">
				</div>
				
				<div class="col-sm-6">
				<label class="text-dark">EmailID</label> 
					<input type="email" class="form-control" name="emailId">
				</div>
				</div>
				
				<div class="row">
				<div class="col-sm-6">
				<label class="text-dark">Password</label> 
					<input type="password"   id="password" oninput="checkPasswordStrength(this.value)" class="form-control" name="password">
				</div>
				 <div id="password-strength"></div>
				
				
				<div class="col-sm-6">
				<label class="text-dark">Confirm Password</label> 
					<input type="password" id="cpassword" oninput="validatePasswords(this.value)" class="form-control" name="password">
				</div>
				<div id="cpwdLabel"></div>
				
				
				</div>
				
				<div class="row">
				<div class="col-sm-6">
				<label>ProfilePic</label> 
					<input type="file"
						 class="form-control" name="profilePic">
				</div>
				</div>
				
			
				
				<div class="row mt-3">
				<div class="col-sm-12">
			
				<input type="submit" name="submit"  class="form-control btn btn-md btn-info" 
				 style="width:150px" value="Register">
				</div>
				</div>
				<br>
		</div>
		
		
<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong>  Customer Account created Sucessfully!!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Customer Account Not Created
		</div>
		<%
		}
		}
		%>
		
		</form>
		
		
		
</body>
</html>



</body>
</html>

