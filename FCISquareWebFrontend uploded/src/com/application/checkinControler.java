package com.application;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.server.mvc.Viewable;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


@Path("/")
public class checkinControler {
	


	
		@Context
		HttpServletRequest request;
		

		@GET
		@Path("/addNewcheckin")
		@Produces(MediaType.TEXT_HTML)
		public Response showPage() {
			return Response.ok(new Viewable("/checkIn.jsp")).build();
		}
		
		@GET
		@Path("/Likecheckin")
		@Produces(MediaType.TEXT_HTML)
		public Response likeCheck() {
			return Response.ok(new Viewable("/likeCheckIn.jsp")).build();
		}
		
		@GET
		@Path("/commentCheckIn")
		@Produces(MediaType.TEXT_HTML)
		public Response commentCheck() {
			return Response.ok(new Viewable("/commentCheckIn.jsp")).build();
		}
		
		

		
		
		
		@POST
		@Path("/doaddNewcheckin")
		@Produces(MediaType.TEXT_HTML)
		public Response addNewcheckin(@FormParam("userId") int userId,
				@FormParam("placeID") int placeID,@FormParam("description") String description) {
			String serviceUrl = "http://backend-sw2project2016.rhcloud.com/FCISquare/rest/CreateCheckin";

			//String serviceUrl = "http://localhost:8080/FCISquare/rest/CreateCheckin";

			String urlParameters = "userId=" + userId + "&placeID=" + placeID + "&description="+ description;

			String retJson = Connection.connect(serviceUrl, urlParameters, "POST","application/x-www-form-urlencoded;charset=UTF-8");
			HttpSession session = request.getSession();
			JSONObject obj = new JSONObject();
			JSONParser parser = new JSONParser();
			
			try {
				obj = (JSONObject) parser.parse(retJson);
				session.setAttribute("userID", obj.get("userId"));
				session.setAttribute("placeID", obj.get("placeID"));
				session.setAttribute("checkDescription", obj.get("description"));
				//session.setAttribute("checkInPlaceName",request.getParameter("placeName"));
				return Response.ok(new Viewable("/home.jsp")).build();

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;

		}
		
		@POST
		@Path("/doLikeCheckin")
		@Produces(MediaType.TEXT_HTML)
		public Response likeCheckIn(@FormParam("UserLikeID") int UserLikeID,
				@FormParam("CheckinID") int CheckinID) {
			String serviceUrl = "http://backend-sw2project2016.rhcloud.com/FCISquare/rest/addlike";

			//String serviceUrl = "http://localhost:8080/FCISquare/rest/addlike";

			String urlParameters = "userId=" + UserLikeID + "&checkinID=" + CheckinID ;

			String retJson = Connection.connect(serviceUrl, urlParameters, "POST","application/x-www-form-urlencoded;charset=UTF-8");
			HttpSession session = request.getSession();
			JSONObject obj = new JSONObject();
			JSONParser parser = new JSONParser();
			
			try {
				obj = (JSONObject) parser.parse(retJson);
				session.setAttribute("UserLikeID", obj.get("UserLikeID"));
				session.setAttribute("CheckinID", obj.get("CheckinID"));
				return Response.ok(new Viewable("/home.jsp")).build();

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;

		}
		
		@POST
		@Path("/doCommentcheckin")
		@Produces(MediaType.TEXT_HTML)
		public Response Commentcheckin(@FormParam("UserCommentID") int userId,
				 @FormParam("checkinID") int checkinID,@FormParam("CommentText") String CommentText) {
			String serviceUrl = "http://se2firstapp-softwareeng2.rhcloud.com/FCISquare/rest/Comment";
			//String serviceUrl = "http://localhost:8080/FCISquare/rest/Comment";

			String urlParameters = "userId=" + userId + "&checkinID=" + checkinID + "&CommentText="+ CommentText;

			String retJson = Connection.connect(serviceUrl, urlParameters, "POST","application/x-www-form-urlencoded;charset=UTF-8");
			HttpSession session = request.getSession();
			JSONObject obj = new JSONObject();
			JSONParser parser = new JSONParser();
			
			try {
				obj = (JSONObject) parser.parse(retJson);
				session.setAttribute("Comment",CommentText);
				session.setAttribute("seccesscomment","you comment on this check in");

				return Response.ok(new Viewable("/home.jsp")).build();

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;

		}
		

}
