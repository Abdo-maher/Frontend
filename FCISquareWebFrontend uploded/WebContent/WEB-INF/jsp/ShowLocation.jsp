
<!--%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
        <head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	        <title>update location Page</title>
	        <style>
	        /* Basics */
	        html, body {
	            width: 100%;
	            height: 100%;
	            color: #444;
	            -webkit-font-smoothing: antialiased;
	            background-color: lightblue;
	        }
	        #container {
	            position: fixed;
	            width: 500px;
	            height: 400px;
	            top: 50%;
	            left: 50%;
	            margin-top: -165px;
	            margin-left: -270px;
	            background: #fff;
	            border-radius: 3px;
	            border: 1px solid #ccc;
	            box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
	            padding:20px;
	
	        }
	        
	       	h1#title {
				font-family: 'Roboto Slab', serif;
				font-weight: 300;
				font-size: 3.2em;
				color: #FF5858;
				text-shadow: 0 0 10px rgba(0,0,0,0.8);
				margin: 0 auto;
				padding-top: 80px;
				max-width: 300px;
				text-align: center;
				position: relative;
				top: 0px;
			}
	        form {
	            margin: 0 auto;
	            margin-top: 20px;
	        }
	        label {
	            color: #555;
	            display: inline-block;
	            margin-left: 55px;
	            padding-top: 10px;
	            font-size: 14px;
	        }
	        a {
	            color: #999;
	            text-decoration:none;
	           
	        }
	        a:hover {
	            color: #555;
	        }
	        input {
	            font-family: "Helvetica Neue", Helvetica, sans-serif;
	            font-size: 12px;
	            outline: none;
	        }
	        input[type=text],
	        input[type=password] ,input[type=time]{
	            color: #777;
	            padding-left: 10px;
	            margin: 10px;
	            margin-top: 12px;
	            margin-left: 18px;
	            width: 200px;
	            height: 35px;
	            border: 1px solid #c7d0d2;
	            border-radius: 2px;
	            box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #f5f7f8;
	            -webkit-transition: all .4s ease;
	            -moz-transition: all .4s ease;
	            transition: all .4s ease;
	            }
	        input[type=text]:hover,
	        input[type=password]:hover,input[type=time]:hover {
	            border: 1px solid #b6bfc0;
	            box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .7), 0 0 0 5px #f5f7f8;
	        }
	        input[type=text]:focus,
	        input[type=password]:focus,input[type=time]:focus {
	            border: 1px solid #a8c9e4;
	            box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #e6f2f9;
	        }
	        #lower {
	        	position:fixed;
	        	top: 80%;
	            left: 93%;
	            margin-top: -140px;
	            margin-left: -270px;
	            background: #ecf2f5;
	            width: 250px;
	            height: 95px;
	            box-shadow: inset 0 1px 1px #fff;
	            border: 2px solid #FFFFFF;
	            border-radius: 60px;
	        }
	        input[type=submit] {
	            float: right;
	            margin-right: 20px;
	            margin-top: 20px;
	            height: 30px;
	            font-size: 14px;
	            font-weight: bold;
	            color: #fff;
	            background-color: #acd6ef; /*IE fallback*/
	            background-image: -webkit-gradient(linear, left top, left bottom, from(#acd6ef), to(#6ec2e8));
	            background-image: -moz-linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
	            background-image: linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
	            border-radius: 30px;
	            border: 1px solid #66add6;
	            box-shadow: 0 1px 2px rgba(0, 0, 0, .3), inset 0 1px 0 rgba(255, 255, 255, .5);
	            cursor: pointer;
	        }
	        input[type=submit]:hover {
	            background-image: -webkit-gradient(linear, left top, left bottom, from(#b6e2ff), to(#6ec2e8));
	            background-image: -moz-linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
	            background-image: linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
	        }
	        input[type=submit]:active {
	            background-image: -webkit-gradient(linear, left top, left bottom, from(#6ec2e8), to(#b6e2ff));
	            background-image: -moz-linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
	            background-image: linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
	        }
	        
	        </style>
	        
	        
		    <script src="http://maps.googleapis.com/maps/api/js">
			</script>
			<script>
				function getLocation() {
					if (navigator.geolocation) {
						navigator.geolocation.getCurrentPosition(showPosition, showError);
					} else {
			
					}
				}
			
				function showPosition(position) {
					document.getElementById('lat').value = position.coords.latitude;
					document.getElementById('long').value = position.coords.longitude;
					var myLatLng = {
						lat : position.coords.latitude,
						lng : position.coords.longitude
					};
					var map = {
						center : myLatLng,
						zoom : 15,
						mapTypeId : google.maps.MapTypeId.ROADMAP
					};
					var map = new google.maps.Map(document.getElementById("googleMap"), map);
					var marker = new google.maps.Marker({
						position : myLatLng,
						map : map,
						title : 'You are here, ta2reban ensh2allah ya3ny :D :D '
					});
			
				}
			
				function showError(error) {
					switch (error.code) {
					case error.PERMISSION_DENIED:
						x.innerHTML = "User denied the request for Geolocation."
						break;
					case error.POSITION_UNAVAILABLE:
						x.innerHTML = "Location information is unavailable."
						break;
					case error.TIMEOUT:
						x.innerHTML = "The request to get user location timed out."
						break;
					case error.UNKNOWN_ERROR:
						x.innerHTML = "An unknown error occurred."
						break;
					}
				}
				google.maps.event.addDomListener(window, 'load', getLocation);
			</script>
			</head>
		
	        <body >
				
				<h1 id="title" class="hidden"><span id="logo">LBSN <span>UI</span></span></h1>
	            <!-- Begin Page Content-->
	            <div id="container">
	                <form action="updateMyLocation" method="post">
	                    <div id="googleMap" style="width: 500px; height: 380px;"></div>
						<br>					
						<input id="lat" type="hidden" name="lat" /> 
						<input id="long" type="hidden" name="long" /> 
	 	                <div id="lower">
						<input type="submit" value="update my current position" />
		                     <label> Return to home page <a href = "/FCISquareApp/app/home">here </a></label>
		                 </div><!--/ lower-->
	                </form>
	            </div><!--/ container-->
	            <!-- End Page Content -->
	        </body>
</html>
 




<!-- 

%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>FCISquare Application</title>
<script src="http://maps.googleapis.com/maps/api/js">
	
</script>
<script>
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition, showError);
		} else {

		}
	}

	function showPosition(position) {
		document.getElementById('lat').value = position.coords.latitude;
		document.getElementById('long').value = position.coords.longitude;
		var myLatLng = {
			lat : position.coords.latitude,
			lng : position.coords.longitude
		};
		var map = {
			center : myLatLng,
			zoom : 15,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"), map);
		var marker = new google.maps.Marker({
			position : myLatLng,
			map : map,
			title : 'You are here, ta2reban ensh2allah ya3ny :D :D '
		});

	}

	function showError(error) {
		switch (error.code) {
		case error.PERMISSION_DENIED:
			x.innerHTML = "User denied the request for Geolocation."
			break;
		case error.POSITION_UNAVAILABLE:
			x.innerHTML = "Location information is unavailable."
			break;
		case error.TIMEOUT:
			x.innerHTML = "The request to get user location timed out."
			break;
		case error.UNKNOWN_ERROR:
			x.innerHTML = "An unknown error occurred."
			break;
		}
	}
	google.maps.event.addDomListener(window, 'load', getLocation);
</script>
</head>
<body>

	<div id="googleMap" style="width: 500px; height: 380px;"></div>
	<br>
	<form action="updateMyLocation" method="post">

		<input id="lat" type="hidden" name="lat" /> <input id="long"
			type="hidden" name="long" /> <input type="submit"
			value="update my current position" />
	</form>
</body>
</html>

 -->
 
 <%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>FCISquare Application</title>
<script src="http://maps.googleapis.com/maps/api/js">
	
</script>
<script>
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition, showError);
		} else {

		}
	}

	function showPosition(position) {
		document.getElementById('lat').value = position.coords.latitude;
		document.getElementById('long').value = position.coords.longitude;
		var myLatLng = {
			lat : position.coords.latitude,
			lng : position.coords.longitude
		};
		var map = {
			center : myLatLng,
			zoom : 15,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"), map);
		var marker = new google.maps.Marker({
			position : myLatLng,
			map : map,
			title : 'You are here, ta2reban ensh2allah ya3ny :D :D '
		});

	}

	function showError(error) {
		switch (error.code) {
		case error.PERMISSION_DENIED:
			x.innerHTML = "User denied the request for Geolocation."
			break;
		case error.POSITION_UNAVAILABLE:
			x.innerHTML = "Location information is unavailable."
			break;
		case error.TIMEOUT:
			x.innerHTML = "The request to get user location timed out."
			break;
		case error.UNKNOWN_ERROR:
			x.innerHTML = "An unknown error occurred."
			break;
		}
	}
	google.maps.event.addDomListener(window, 'load', getLocation);
</script>
</head>
<body>

	<div id="googleMap" style="width: 500px; height: 380px;"></div>
	<br>
	<form action="updateMyLocation" method="post">

		<input id="lat" type="hidden" name="lat" /> <input id="long"
			type="hidden" name="long" /> <input type="submit"
			value="update my current position" />
	</form>
</body>
</html>