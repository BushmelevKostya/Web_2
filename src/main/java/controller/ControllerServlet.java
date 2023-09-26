package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "ControllerServlet", value = "/controller")
public class ControllerServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		delegate(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		delegate(request, response);
	}
	
	public void delegate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		var names = request.getParameterNames();
		var gson = new Gson();
		HashMap<String, Double> params = new HashMap<>();
		while (names.hasMoreElements()) {
			String name = names.nextElement();
			params.put(name, Double.valueOf(request.getParameter(name)));
		}
		var map = gson.toJson(params, HashMap.class);
		HttpSession session = request.getSession();
		session.setAttribute("data", map);
		
		response.sendRedirect("./hit");
	}
}
