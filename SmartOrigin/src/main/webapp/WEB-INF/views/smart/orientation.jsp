<!doctype html>
<html lang="en">
<head>
  <title>Orientation API and the HTML5 logo</title>
  
  <style>
  	.LR{
  		font-size: 14px;
  	}
  	.FB{
  		font-size: 14px;
  	}
  	.DIR{
  		font-size: 14px;
  	}
  </style>
  
</head>
<body>
  <h2>Device Orientation </h2>
<p>
<div id="LR"></div>
<div id="FB"></div>
<div id="DIR"></div>

<img src="/resources/img/logo/2.jpg" id="imgLogo" class="logo"> 

<script type="text/javascript">
	
		function deviceOrientationHandler(LR, FB, DIR) {
		    
		    document.getElementById("imgLogo").style.webkitTransform =
		    "rotate(" + LR + "deg) rotate3d(1,0,0, " + (FB * -1) + "deg)";
		    document.getElementById("imgLogo").style.transform =
		    "rotate(" + LR + "deg) rotate3d(1,0,0, " + (FB * -1) + "deg)";
		    
		    document.querySelector("#LR").innerHTML = "gamma : " + Math.round(LR);
		    document.querySelector("#FB").innerHTML = "beta : " + Math.round(FB);
		    document.querySelector("#DIR").innerHTML = "alpha : " + Math.round(DIR);
			
		}

   	if (window.DeviceOrientationEvent) {
     
      window.addEventListener('deviceorientation', function(eventData) {
          
    	  var LR = eventData.gamma;
          var FB = eventData.beta;
          var DIR = eventData.alpha;
          
          deviceOrientationHandler(LR, FB, DIR);
          
      }, false);
      
   } else {
      alert("지원하지 않는 브라우저 입니다.");
   }
   
</script>
 
</body>
</html>