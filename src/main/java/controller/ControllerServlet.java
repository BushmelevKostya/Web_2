package controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
	
	public void delegate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		var names = request.getParameterNames();
		var gson = new Gson();
		HashMap<String, Double> params = new HashMap<>();
		if (names.hasMoreElements()) {
			do {
				String name = names.nextElement();
				params.put(name, Double.valueOf(request.getParameter(name)));
			} while (names.hasMoreElements());
		} else {
			BufferedReader reader = request.getReader();
			StringBuilder jsonBuffer = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				jsonBuffer.append(line);
			}
			String json = jsonBuffer.toString();
			Map<String, Object> data = gson.fromJson(json, new TypeToken<Map<String, Object>>() {
			}.getType());
			params.put("radio", Double.valueOf((String) data.get("radio")));
			params.put("text", Double.valueOf((String) data.get("text")));
			params.put("press_button", (Double) data.get("press_button"));
		}
		HttpSession session = request.getSession();
		session.setAttribute("data", params);
		response.sendRedirect("./hit");
	}
}
