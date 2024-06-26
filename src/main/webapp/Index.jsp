<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="Header.jsp" />
</head>
<body>
<jsp:include page="Menu.jsp" />
<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

    <!-- Indicators/dots -->
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
      <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
      <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    </div>
    
    <!-- The slideshow/carousel -->
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="images/ecome3.webp" alt="Los Angeles" class="d-block" style="width:100%">
       
      </div>
      <div class="carousel-item">
        <img src="images/ecome2.jpeg" alt="Chicago" class="d-block" style="width:100%">
       
      </div>
      <div class="carousel-item">
        <img src="images/ecome.webp" alt="New York" class="d-block" style="width:100%">
          
      </div>
    </div>
    
    <!-- Left and right controls/icons -->
    <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
    </button>
  </div>
  

</body>
</html>
