<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
        <head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	        <title>Home Page</title>
	        <style>
	        /* Basics */
	        html, body {
	            width: 100%;
	            height: 100%;
	            font-family: "Helvetica Neue", Helvetica, sans-serif;
	            color: #444;
	            -webkit-font-smoothing: antialiased;
	            background: lightblue;
	        }
	        #container {
	            width: 500px;
	            height: 630px;
	            top: 50%;
	            left: 50%;
	            margin-top: 20px;
	            margin-left: 435px;
	            background: bisque;
	            border-radius: 3px;
	            border: 1px solid #ccc;
	            box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
	
	        }
	        
	        #container #center {
	        	text-align:center;
	        }
	        
	       	h1#title {
				font-family: 'Roboto Slab', serif;
				font-weight: 300;
				font-size: 3.2em;
				color: white;
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
	            margin-left: 18px;
	            padding-top: 10px;
	            font-size: 14px;
	        }
	        a {
	            color: #999;
	            text-decoration:none;
	           
	        }
	        a:hover {
	            color: #F20000;
	        }
	        input {
	            font-family: "Helvetica Neue", Helvetica, sans-serif;
	            font-size: 12px;
	            outline: none;
	        }
	        input[type=submit] {
	            float: right;
	            margin-right: 20px;
	            margin-top: 20px;
	            width: 80px;
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
	        input[type=submit]:active {
	            background-image: -webkit-gradient(linear, left top, left bottom, from(#6ec2e8), to(#b6e2ff));
	            background-image: -moz-linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
	            background-image: linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
	        }
	        p{
	        	padding: 5px 20px;
				margin: 25px 30px;
				background: #FFA;
	        }
	        
	        p a{
	        	
	        }
	        
	        </style>
	
	        </head>
	
	        <body >
				
				<h1 id="title" class="hidden"><span id="logo">LBSN <span>UI</span></span></h1>
	            <!-- Begin Page Content-->
	            <div id="container">
	            
	                <h2 id="center">Welcome ${it.name} </h2>
	                
	                <p> You can show your current position on map and update your position on our database from <a href="/FCISquareApp/app/showLocation"> here</a>
	                <p> You can create New place<a href="/FCISquareApp/app/addplaces"> here</a>
	                <p> You can save New place<a href="/FCISquareApp/app/saveplace"> here</a>
					<p> You can create check in from <a href="/FCISquareApp/app/addNewcheckin"> here</a>
					<p> You can like check in from <a href="/FCISquareApp/app/Likecheckin"> here</a>
					<p> You can comment check in from <a href="/FCISquareApp/app/commentCheckIn"> here</a>
					<p> You can follow anther user from <a href="/FCISquareApp/app/follow"> here</a>
					<p> You can unfollow anther user from <a href="/FCISquareApp/app/unfollow"> here</a>
					<p> You can show followers list <a href="/FCISquareApp/app/getfollowers"> here</a>
					<p> You can get your current position stored in database <a href="/FCISquareApp/app/GetLocation"> here</a>

	                
	            </div><!--/ container-->
	            <!-- End Page Content -->
	        </body>
        </html>

	
	
	<!-- <body>
			<p>Welcome b2a ya ${it.name} :D :D </p>
			<p>This is should be user home page</p>
			<p> You can show your current position on map and update your position on our database from <a href="/FCISquareApp/app/showLocation"> here</a>
			<p> You can follow anther user from <a href="/FCISquareApp/app/follow"> here</a>
			<p> You can unfollow anther user from <a href="/FCISquareApp/app/unfollow"> here</a>
			<p> You can get your current postion stord in database <a href="/FCISquareApp/app/GetLocation"> here</a>
			
			
			
			<p>Current implemented services
				"http://se2firstapp-softwareeng2.rhcloud.com/FCISquare/rest/signup ---
				{requires: name, email, pass}"</p>
			<p>and "http://se2firstapp-softwareeng2.rhcloud.com/FCISquare/rest/login ---
				{requires: name, pass}"</p>
			<p>and "http://se2firstapp-softwareeng2.rhcloud.com/FCISquare/rest/updatePosition ---
				{requires: id, lat, long}"</p>
			<p> All parameters are post parameters </p>
			
			<p>you should implement Follow,	UnFollow, getFollowers and getLastPositionOfUser services </p>
	</body>
	 -->
</html>