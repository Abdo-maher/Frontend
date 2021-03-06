<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
        <head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	        <title>follow Page</title>
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
	            width: 300px;
	            height: 120px;
	            top: 50%;
	            left: 50%;
	            margin-top: -140px;
	            margin-left: -170px;
	            background: #fff;
	            border-radius: 3px;
	            border: 1px solid #ccc;
	            box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
	
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
	            margin-left: 18px;
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
	            background: #ecf2f5;
	            width: 100%;
	            height: 69px;
	            box-shadow: inset 0 1px 1px #fff;
	            border-top: 1px solid #ccc;
	            border-bottom-right-radius: 3px;
	            border-bottom-left-radius: 3px;
	        }
	        #lower label{
	        	margin-top:20px;
	        }
	        input[type=submit] {
	            margin-left: 80px;
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
	
	        </head>
	
	        <body >
				
				<h1 id="title" class="hidden"><span id="logo">LBSN <span>UI</span></span></h1>
	            <!-- Begin Page Content-->
	            <div id="container">
	                <form action="doaddNewcheckin" method="post">
					
					<input type="hidden" name="userId" value=<%=session.getAttribute("id") %>>
					<label for="PlaceID">placeID to check in:</label>
					<input type="text" name = "placeID" />
					<label for="description">place description:</label>
					<input type="text" name = "description" placeholder="say any thing" />
					
					<input type="submit" value="Post">
					
					
					</form>

	                
	            </div><!--/ container-->
	            <!-- End Page Content -->
	        </body>
</html>



