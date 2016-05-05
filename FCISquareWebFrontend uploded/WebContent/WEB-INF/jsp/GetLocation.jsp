<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
        <head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	        <title>show cordinates Page</title>
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
	            width: 340px;
	            height : 200px;
	            top: 50%;
	            left: 50%;
	            margin-top: -140px;
	            margin-left: -170px;
	            background: #fff;
	            border-radius: 3px;
	            border: 1px solid #ccc;
	            box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
	            padding : 20px;
	
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
	        label {
	            color: #555;
	            display: inline-block;
	            margin-left: 18px;
	            padding-top: 10px;
	            font-size: 21px;
	        }
	        a {
	            color: #999;
	            text-decoration:none;
	           
	        }
	        a:hover {
	            color: #555;
	        }
	        </style>
	
	        </head>
	
	        <body >
				
				<h1 id="title" class="hidden"><span id="logo">LBSN <span>UI</span></span></h1>
	            <!-- Begin Page Content-->
	            <div id="container">
	                    <h3 >Welcome        <%=session.getAttribute("name")%> </h3>
	                    <label >Your Latitude        <%=session.getAttribute("lat")%> </label>
	                    <label >Your Longitude        <%=session.getAttribute("long")%> </label>
	                    
	                        <label> Return to home page <a href = "/FCISquareApp/app/home">here </a></label>
	            </div><!--/ container-->
	            <!-- End Page Content -->
	        </body>
        </html>





<!-- %@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
           




Welcome        <h3><%=session.getAttribute("name")%></h3>
Your Latitude  <h3><%=session.getAttribute("lat")%></h3>
Your Longitude <h3><%=session.getAttribute("long")%></h3>


</body>
</html>
 -->