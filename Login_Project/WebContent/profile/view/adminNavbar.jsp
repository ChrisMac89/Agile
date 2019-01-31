<!-- CSS for styling -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<link href="css/archives.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- Code below is taken from online jquery libaries -->
<script>
$(document).ready(function(){
	  var resize = new Array('.resizable');
	  resize = resize.join(',');
	  
	  //resets the font size when "reset" is clicked
	  var resetFont = $(resize).css('font-size');
	    $(".reset").click(function(){
	      $(resize).css('font-size', resetFont);
	    });
	  
	  //increases font size when "+" is clicked
	  $(".increase").click(function(){
	    var originalFontSize = $(resize).css('font-size');
	    var originalFontNumber = parseFloat(originalFontSize, 10);
	    var newFontSize = originalFontNumber*1.2;
	    $(resize).css('font-size', newFontSize);
	    return false;
	  });
	  
	  //decrease font size when "-" is clicked
	  
	  $(".decrease").click(function(){
	    var originalFontSize = $(resize).css('font-size');
	    var originalFontNumber = parseFloat(originalFontSize, 10);
	    var newFontSize = originalFontNumber*0.8;
	    $(resize).css('font-size', newFontSize);
	    return false;
	  });
	  
	});
</script>
 

<!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#"><img style="display: block; margin-left: auto; margin-right: auto;"
				src="./resources/Navlogo.png" alt="" width="179" height="60" /></a>
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="http://localhost:8080/Login_Project/profile/view/AdminDashBoard.jsp">Dashboard</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="http://localhost:8080/Login_Project/profile/view/AdminExam.jsp">Create Exam</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="http://localhost:8080/Login_Project/profile/view/AdminManageStaff.jsp">Manage Staff</a>
            </li>
           
            
            
            <a class="tp btn btn-danger float-right"
				href="http://localhost:8080/Login_Project/Signoutcontroller"><i class="fa fa-power-off"></i>&nbsp;Log
				Out</a>
				 </li>
          </ul>
        </div>
      </div>
    </nav>