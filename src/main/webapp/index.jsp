<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SoftwareHolic</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <style>
		.fixed-img-height {
			height: 280px; 
		    object-fit: cover;
		}
		
		.card {
		    margin: 0 15px;
		}
		
    </style>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>
	
	<div class="row flex justify-content-center">
	
	    <div class="card mt-5 p-3" style="width: 30rem;">
	        <img src="images/show users.svg" class="card-img-top fixed-img-height" alt="Show Users"/>
	        <hr />
	        <div class="card-body">
	            <p class="card-text">Empower your team by viewing all users at a glance, ensuring clarity and streamlined oversight.</p>
	        </div>
	    </div>
	    
	    <div class="card mt-5 ml-5 mr-5 p-3" style="width: 30rem;">
	        <img src="images/add user.svg" class="card-img-top fixed-img-height" alt="Add Users"/>
	        <hr />
	        <div class="card-body">
	            <p class="card-text">Expand your network with ease—seamlessly onboard new users to grow your platform.</p>
	        </div>
	    </div>
	    
	    <div class="card mt-5 p-3" style="width: 30rem;">
	        <img src="images/update users details.svg" class="card-img-top fixed-img-height" alt="Update User Details"/>
	        <hr />
	        <div class="card-body">
	            <p class="card-text">Keep information accurate and up-to-date, ensuring your user data reflects real-time changes.</p>
	        </div>
	    </div>
	    
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
