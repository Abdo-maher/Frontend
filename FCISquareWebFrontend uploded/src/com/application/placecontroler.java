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
public class placecontroler {
	@Context
	HttpServletRequest request;
	
	
	@GET
	@Path("/addplaces")
	@Produces(MediaType.TEXT_HTML)
	public Response addplace(){
		return Response.ok(new Viewable("/addNewPlace.jsp")).build();
	}	
	
	@GET
	@Path("/saveplace")
	@Produces(MediaType.TEXT_HTML)
	public Response saveplace(){
		return Response.ok(new Viewable("/savePlace.jsp")).build();
	}	
	
	
	@POST
	@Path("/doplaces")
	@Produces(MediaType.TEXT_HTML)
	public Response showHomePage(@FormParam("name") String name,
			@FormParam("description") String description, @FormParam("lat") double lat,@FormParam("long") double lon ) {
		String serviceUrl = "http://backend-sw2project2016.rhcloud.com/FCISquare/rest/createPlaces";
		//String serviceUrl = "http://localhost:8080/FCISquare/rest/createPlaces";

		String urlParameters = "name=" + name + "&description=" + description + "&lat=" + lat + "&long=" + lon ;
				
		// System.out.println(urlParameters);
		String retJson = Connection.connect(serviceUrl, urlParameters, "POST",
				"application/x-www-form-urlencoded;charset=UTF-8");
		HttpSession session = request.getSession();
		JSONObject obj = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			obj = (JSONObject) parser.parse(retJson);
		
			session.setAttribute("name", obj.get("name"));
			session.setAttribute("description", obj.get("description"));
			session.setAttribute("lat", obj.get("lat"));
			session.setAttribute("lon", obj.get("long"));
			session.setAttribute("id", obj.get("id"));

		
			
			return Response.ok(new Viewable("/home.jsp")).build();

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}	
	
	@Path("/doSavePlace")
	@Produces(MediaType.TEXT_HTML)
	public Response saveplace(@FormParam("placeId") int placeId,
			@FormParam("userId") int userId) {
		String serviceUrl = "http://backend-sw2project2016.rhcloud.com/FCISquare/rest/savePlace";
		//String serviceUrl = "http://localhost:8080/FCISquare/rest/savePlace";

		String urlParameters = "placeId=" + placeId + "&userId=" + userId;
		// System.out.println(urlParameters);
		String retJson = Connection.connect(serviceUrl, urlParameters, "POST",
				"application/x-www-form-urlencoded;charset=UTF-8");
		HttpSession session = request.getSession();
		JSONObject obj = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			obj = (JSONObject) parser.parse(retJson);
			session.setAttribute("placeId", obj.get("placeId"));
			
			return Response.ok(new Viewable("/home.jsp")).build();

		} catch (ParseException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}
		return null;

	}
	
	
	
}
