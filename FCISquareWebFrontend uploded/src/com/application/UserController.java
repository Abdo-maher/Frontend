package com.application;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.server.mvc.Viewable;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@Path("/")
public class UserController {

	@Context
	HttpServletRequest request;

	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public Response loginPage() {
		return Response.ok(new Viewable("/Login.jsp")).build();
	}
	
	@GET
	@Path("/home")
	@Produces(MediaType.TEXT_HTML)
	public Response homePage() {
		return Response.ok(new Viewable("/home.jsp")).build();
	}


	@GET
	@Path("/signUp")
	@Produces(MediaType.TEXT_HTML)
	public Response signUpPage() {
		return Response.ok(new Viewable("/Signup.jsp")).build();
	}
	
	@GET
	@Path("/showLocation")
	@Produces(MediaType.TEXT_HTML)
	public Response showLocationPage(){
		return Response.ok(new Viewable("/ShowLocation.jsp")).build();
	}

	
	
	@GET
	@Path("/follow")
	@Produces(MediaType.TEXT_HTML)
	public Response followPage(){
		return Response.ok(new Viewable("/follow.jsp")).build();
	}
	
	@GET
	@Path("/unfollow")
	@Produces(MediaType.TEXT_HTML)
	public Response unfollowPage(){
		return Response.ok(new Viewable("/unfollow.jsp")).build();
	}
	
	@GET
	@Path("/GetLocation")
	@Produces(MediaType.TEXT_HTML)
	public Response getlocation(){
		return Response.ok(new Viewable("/GetLocation.jsp")).build();
	}
	
	@GET
	@Path("/getfollowers")
	@Produces(MediaType.TEXT_HTML)
	public Response getfollowers(){
		return Response.ok(new Viewable("/followerList.jsp")).build();
	}
	
	

	
	@POST
	@Path("/updateMyLocation")
	@Produces(MediaType.TEXT_PLAIN)
	public String updateLocation(@FormParam("lat") String lat, @FormParam("long") String lon){
		HttpSession session = request.getSession();
		Long id = (Long) session.getAttribute("id");
		String serviceUrl = "http://backend-sw2project2016.rhcloud.com/FCISquare/rest/updatePosition";
		//String serviceUrl = "http://localhost:8080/FCISquare/rest/updatePosition";

		String urlParameters = "id=" + id + "&lat=" + lat + "&long="+ lon;
		 System.out.println(urlParameters);
		String retJson = Connection.connect(serviceUrl, urlParameters, "POST",
				"application/x-www-form-urlencoded;charset=UTF-8");
		JSONParser parser = new JSONParser();
		JSONObject obj;
		try {
			obj = (JSONObject)parser.parse(retJson);
			Long status = (Long) obj.get("status");
			if(status == 1)
				return "Your location is updated";
			else
				return "A problem occured";
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "A problem occured";
		
	}
	
	@POST
	@Path("/doLogin")
	@Produces(MediaType.TEXT_HTML)
	public Response showHomePage(@FormParam("email") String email,
			@FormParam("pass") String pass) {
		String serviceUrl = "http://backend-sw2project2016.rhcloud.com/FCISquare/rest/login";
		//String serviceUrl = "http://localhost:8080/FCISquare/rest/login";

		String urlParameters = "email=" + email + "&pass=" + pass;
		// System.out.println(urlParameters);
		String retJson = Connection.connect(serviceUrl, urlParameters, "POST",
				"application/x-www-form-urlencoded;charset=UTF-8");
		HttpSession session = request.getSession();
		JSONObject obj = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			obj = (JSONObject) parser.parse(retJson);
			session.setAttribute("email", obj.get("email"));
			session.setAttribute("name", obj.get("name"));
			session.setAttribute("id", obj.get("id"));
			session.setAttribute("lat", obj.get("lat"));
			session.setAttribute("long", obj.get("long"));
			session.setAttribute("pass", obj.get("pass"));
			Map<String, String> map = new HashMap<String, String>();

			map.put("name", (String) obj.get("name"));
			map.put("email", (String) obj.get("email"));

			return Response.ok(new Viewable("/home.jsp", map)).build();

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	@POST
	@Path("/doSignUp")
	@Produces(MediaType.TEXT_HTML)
	public Response showHomePage(@FormParam("name") String name,
			@FormParam("email") String email, @FormParam("pass") String pass) {
		String serviceUrl = "http://backend-sw2project2016.rhcloud.com/FCISquare/rest/signup";
		//String serviceUrl = "http://localhost:8080/FCISquare/rest/signup";

		String urlParameters = "name=" + name + "&email=" + email + "&pass="
				+ pass;
		// System.out.println(urlParameters);
		String retJson = Connection.connect(serviceUrl, urlParameters, "POST",
				"application/x-www-form-urlencoded;charset=UTF-8");
		HttpSession session = request.getSession();
		JSONObject obj = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			obj = (JSONObject) parser.parse(retJson);
			session.setAttribute("email", obj.get("email"));
			session.setAttribute("name", obj.get("name"));
			session.setAttribute("id", obj.get("id"));
			session.setAttribute("lat", obj.get("lat"));
			session.setAttribute("long", obj.get("long"));
			session.setAttribute("pass", obj.get("pass"));
			Map<String, String> map = new HashMap<String, String>();

			map.put("name", (String) obj.get("name"));
			map.put("email", (String) obj.get("email"));

			return Response.ok(new Viewable("/home.jsp", map)).build();

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
	@POST
	@Path("/dofollow")
	@Produces(MediaType.TEXT_HTML)
	public Response followUser(@FormParam("id2") int id2,
			@FormParam("id1") int id1) {
		String serviceUrl = "http://backend-sw2project2016.rhcloud.com/FCISquare/rest/follow";
		//String serviceUrl = "http://localhost:8080/FCISquare/rest/follow";

		String urlParameters = "id2=" + id2 + "&id1=" + id1;
		// System.out.println(urlParameters);
		String retJson = Connection.connect(serviceUrl, urlParameters, "POST",
				"application/x-www-form-urlencoded;charset=UTF-8");
		HttpSession session = request.getSession();
		JSONObject obj = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			obj = (JSONObject) parser.parse(retJson);
			session.setAttribute("id2", obj.get("id2"));
			
			return Response.ok(new Viewable("/home.jsp")).build();

		} catch (ParseException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}
		return null;

	}
	
	@POST
	@Path("/dounfollow")
	@Produces(MediaType.TEXT_HTML)
	public Response unfollowUser(@FormParam("id2") int id2,
			@FormParam("id1") int id1) {
		String serviceUrl = "http://backend-sw2project2016.rhcloud.com/FCISquare/rest/unfollow";
		//String serviceUrl = "http://localhost:8080/FCISquare/rest/unfollow";

		String urlParameters = "id2=" + id2 + "&id1=" + id1;
		// System.out.println(urlParameters);
		String retJson = Connection.connect(serviceUrl, urlParameters, "POST",
				"application/x-www-form-urlencoded;charset=UTF-8");
		HttpSession session = request.getSession();
		JSONObject obj = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			obj = (JSONObject) parser.parse(retJson);
			session.setAttribute("id2", obj.get("id2"));
			
			return Response.ok(new Viewable("/home.jsp")).build();

		} catch (ParseException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}
		return null;

	}
	
	
	@Path("/getlocation")
	@Produces(MediaType.TEXT_HTML)
	public Response showHomePage(@FormParam("userID") int id) {
		String serviceUrl = "http://backend-sw2project2016.rhcloud.com/FCISquare/rest/currentLocation";
		//String serviceUrl = "http://localhost:8080/FCISquare/rest/currentLocation";

		String urlParameters = "userID=" + id;
		// System.out.println(urlParameters);
		String retJson = Connection.connect(serviceUrl, urlParameters, "POST",
				"application/x-www-form-urlencoded;charset=UTF-8");
		HttpSession session = request.getSession();
		JSONObject obj = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			obj = (JSONObject) parser.parse(retJson);
			session.setAttribute("id", obj.get("id"));
			session.setAttribute("lat", obj.get("lat"));
			session.setAttribute("long", obj.get("long"));
			return Response.ok(new Viewable("/GetLocation.jsp")).build();

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
	
	@POST
	@Path("/doGetFollowers")
	@Produces(MediaType.TEXT_HTML)
	public Response doGetFollowers(@FormParam("userID") int userID) {
		String serviceUrl = "http://backend-sw2project2016.rhcloud.com/FCISquare/rest/getFollowersList";
		//String serviceUrl = "http://localhost:8080/FCISquare/rest/getFollowersList";
		String urlParameters = "userID=" + userID;
		// System.out.println(urlParameters);

		String retJson = Connection.connect(serviceUrl, urlParameters, "POST",
				"application/x-www-form-urlencoded;charset=UTF-8");
		System.out.println(retJson);
		HttpSession session = request.getSession();
		org.json.simple.JSONArray retArry = new org.json.simple.JSONArray();

		JSONParser parser = new JSONParser();

		System.out.println("getfollowers");
		return Response.ok(new Viewable("/followList.jsp", retJson)).build();
	}
	
	

	
	
	
}
