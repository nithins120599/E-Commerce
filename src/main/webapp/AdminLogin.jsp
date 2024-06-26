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

        #adminpic {
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

        input, select {
            padding: 10px;
            font-size: 16px;
            width: 250px;
            box-sizing: border-box;
        }

        #signin {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="Menu.jsp" />

<form action="AdminLoginValidation" method="post">
    <h2 style="color:hwb(240 4% 88% / 0.589); margin-top: 5px;">ADMIN LOGIN</h2>
    <img id="adminpic" src="images/admin.jpg" alt="Admin Picture">
    
    <div class="input-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" placeholder="Enter username">
    </div>

    <div class="input-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter your password">
    </div>

    <div class="input-group">
        <label for="role">Role:</label>
        <select id="role" name="role">
            <option value="admin">Admin</option>
            <option value="customer">Customer</option>
          
        </select>
    </div>

   <!--   <button id="signin" onclick="signIn()">Sign In</button>     -->
   
   <input type="submit"  id="signin" value="Signin">
   
   <%
			String res=request.getParameter("res");
			if(res!=null && res.equals("0")){
				out.println("<h4 style='color:red'>Invalid username/password</h4>");
			}
		%>

   </form>
</body>
</html>
