<!DOCTYPE html>
<html lang="en">
<head>
  <jsp:include page="Header.jsp" />
   <style>
        body {
            text-align: center;
            margin: 5px;
            font-family: Arial, sans-serif;
        }

        #customerpic {
            width: 150px; /* Adjust the width as needed */
            border-radius: 50%;
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .input-group label {
            margin-bottom: 5px;
        }

        input[type="email"],
        input[type="password"],
        select {
            padding: 12px;
            font-size: 16px;
            width: 250px;
            box-sizing: border-box;
            border: 2px solid #ccc; /* Add border */
            border-radius: 5px; /* Add border-radius */
            transition: border-color 0.3s; /* Add transition for smooth effect */
        }

        input[type="email"]:focus,
        input[type="password"]:focus,
        select:focus {
            outline: none;
            border-color: #46FF00; /* Change border color on focus */
        }

        #signin {
            padding: 12px 20px; /* Adjust padding */
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s; /* Add transition for smooth effect */
        }

        #signin:hover {
            background-color: #870071; /* Change background color on hover */
        }
    </style>
</head>
<body>
<jsp:include page="Menu.jsp" />

<form action="CustomerLoginValidation" method="post" >
    <h2 style="color:hwb(240 4% 88% / 0.589); margin-top: 5px;">CUSTOMER LOGIN</h2>
    <img id="customerpic" src="images/customers.jpg" alt="Customer Picture">
    
    <div class="input-group">
        <label for="emailId">Email</label>
        <input type="email" id="emailId" name="emailId" placeholder="Enter email">
    </div>

    <div class="input-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter your password">
    </div>

    <input type="submit"  id="signin" value="Signin"><br><br><br>
 <a href="CustomerRegistration.jsp" style="color: blue;">New Customer? Register Here...</a>
 <br><br>


 <%
			String res=request.getParameter("res");
			if(res!=null && res.equals("0")){
				out.println("<h4 style='color:red'>Invalid Email/password</h4>");
			}
		%>
		

   </form>
</body>
</html>
