<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
					<form action="doGetFollowers" method="post">
	                    <label for="followID">ID to follow:</label>
						<input type="hidden" name="userID" value=<%=session.getAttribute("id")%> >	                    
 	                    <div id="lower">
	                        <input type="submit" name="doGetFollowers" value="doGetFollowers">
	                    </div><!--/ lower-->
	                </form>
</body>
</html>