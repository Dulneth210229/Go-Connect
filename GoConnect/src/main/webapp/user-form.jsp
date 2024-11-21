<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
   <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
    <style>


	@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
	
	* {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	    font-family: "Poppins", sans-serif;
	}
	
	body {
	    height: 100vh;
	    width: 100%;
	    background-color: #74CDF3;
	    background-position: center;
	    background-size: cover;
	}
	
	.sidebar {
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 110px;
	    height: 100%;
	    display: flex;
	    align-items: center;
	    flex-direction: column;
	    background: rgba(255, 255, 255, 0.2);
	    backdrop-filter: blur(17px);
	    --webkit-backdrop-filter: blur(17px);
	    border-right: 1px solid rgba(255, 255, 255, 0.7);
	    transition: width 0.3s ease;
	}
	
	.sidebar:hover {
	    width: 260px;
	}
	
	.sidebar .logo {
	    color: #000;
	    display: flex;
	    align-items: center;
	    padding: 25px 10px 15px;
	}
	
	.logo img {
	    width: 43px;
	    border-radius: 50%;
	}
	
	.logo h2 {
	    font-size: 1.15rem;
	    font-weight: 600;
	    margin-left: 15px;
	    display: none;
	}
	
	.sidebar:hover .logo h2 {
	    display: block;
	}
	
	.sidebar .links {
	    list-style: none;
	    margin-top: 20px;
	    overflow-y: auto;
	    scrollbar-width: none;
	    height: calc(100% - 140px);
	}
	
	.sidebar .links::-webkit-scrollbar {
	    display: none;
	}
	
	.links li {
	    display: flex;
	    border-radius: 4px;
	    align-items: center;
	}
	
	.links li:hover {
	    cursor: pointer;
	    background: #fff;
	}
	
	.links h4 {
	    color: #222;
	    font-weight: 500;
	    display: none;
	    margin-bottom: 10px;
	}
	
	.sidebar:hover .links h4 {
	    display: block;
	}
	
	.links hr {
	    margin: 10px 8px;
	    border: 1px solid #4c4c4c;
	}
	
	.sidebar:hover .links hr {
	    border-color: transparent;
	}
	
	.links li span {
	    padding: 12px 10px;
	}
	
	.links li a {
	    padding: 10px;
	    color: #000;
	    display: none;
	    font-weight: 500;
	    white-space: nowrap;
	    text-decoration: none;
	}
	
	.sidebar:hover .links li a {
	    display: block;
	}
	
	.links .logout-link {
	    margin-top: 20px;
	}
	    
    </style>

</head>
<body>

	<header>
		 <aside class="sidebar">
      <div class="logo">
        <h2>GoConnect</h2>
      </div>
      <ul class="links">
        <h4>Main Menu</h4>
        <li>
          <span class="material-symbols-outlined">dashboard</span>
          <a href="http://localhost:8090/GoConnect/AdminDsahboard.jsp#">Dashboard</a>
        </li>
        <li>
          <span class="material-symbols-outlined">show_chart</span>
          <a href="#">Revenue</a>
        </li>
        <li>
          <span class="material-symbols-outlined">flag</span>
          <a href="#">Reports</a>
        </li>
        <hr>
        <h4>Advanced</h4>
        <li>
          <span class="material-symbols-outlined">person</span>
          <a href="#">Accounts</a>
        </li>
        <li>
          <span class="material-symbols-outlined">group</span>
          <a href="<%=request.getContextPath()%>/list">Drivers </a>
        </li>
        <li>
          <span class="material-symbols-outlined">ambient_screen</span>
          <a href="#">Magic Build</a>
        </li>
        <li>
          <span class="material-symbols-outlined">pacemaker</span>
          <a href="#">Theme Maker</a>
        </li>
        <li>
          <span class="material-symbols-outlined">monitoring</span>
          <a href="#">Analytic</a>
        </li>
        <hr>
        <h4>Account</h4>
        <li>
          <span class="material-symbols-outlined">bar_chart</span>
          <a href="#">Overview</a>
        </li>
        <li>
          <span class="material-symbols-outlined">mail</span>
          <a href="#">Message</a>
        </li>
        <li>
          <span class="material-symbols-outlined">settings</span>
          <a href="#">Settings</a>
        </li>
        <li class="logout-link">
          <span class="material-symbols-outlined">logout</span>
          <a href="#">Logout</a>
        </li>
      </ul>
    </aside>
	</header>
	<br>
	<div class="container col-md-5" >
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form id="driverForm" action="update" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form id="driverForm" action="insert" method="post" >
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Update Driver
            		</c:if>
						<c:if test="${user == null}">
            			Add New Driver
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Driver Name</label> <input type="text" 
						value="<c:out value='${user.name}' />" class="form-control"
						name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Driver Email</label> <input type="text" placeholder="example@gmail.com"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email" id="email" required="required">
						<div id="emailError" style="color: red;"></div>
				</fieldset>

				<fieldset class="form-group">
					<label>Driver Address</label> <input type="text"
						value="<c:out value='${user.address}' />" class="form-control"
						name="address">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Driver contact</label> <input type="text" placeholder="07x xxxx xxx"
						value="<c:out value='${user.phone}' />" class="form-control"
						name="phone">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Driver vehicle No</label> <input type="text"
						value="<c:out value='${user.vehicle}' />" class="form-control"
						name="vehicle" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Driver Date of Birth</label> <input type="text"
						value="<c:out value='${user.dob}' />" class="form-control"
						name="dob">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Driver Username</label> <input type="text"
						value="<c:out value='${user.username}' />" class="form-control"
						name="username" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Driver password</label> <input type="password"
						value="<c:out value='${user.password}' />" class="form-control"
						name="password" id="password" required="required">
						<div id="passwordError" style="color: red;"></div>
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	 //Validation part fo the email
    function validateEmail() {
        var emailInput = document.getElementById("email");
        var emailError = document.getElementById("emailError");
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailRegex.test(emailInput.value)) {
            emailError.innerText = "Please enter a valid email address.";
            return false;
        } else {
            emailError.innerText = "";
            return true;
        }
    }

    //Validation part fo the password
    function validatePassword() {
        var passwordInput = document.getElementById("password");
        var passwordError = document.getElementById("passwordError");

        if (passwordInput.value.length < 8) {
            passwordError.innerText = "Password must be at least 8 characters long.";
            return false;
        } else {
            passwordError.innerText = "";
            return true;
        }
    }

    // Form submission validation
    document.getElementById("driverForm").onsubmit = function() {
        return validateEmail() && validatePassword();
    };
	</script>
</body>
</html>