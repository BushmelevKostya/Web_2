package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Dote;
import model.DotesCollection;

import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "AreaCheckServlet", value = "/hit")
public class AreaCheckServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		run(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		run(request, response);
	}
	
	public void run(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			double x = Double.parseDouble(request.getParameter("radio"));
			double y = Double.parseDouble(request.getParameter("text"));
			double R = Double.parseDouble(request.getParameter("press_button"));
			boolean res = checkPlace(x, y, R);
			var dc = new DotesCollection();
			var dote = new Dote(x, y);
			if (res) dc.add(dote);
			sendResponse(res, dc, response);
		} catch (NullPointerException exception) {
			System.out.println(2);
			response.setContentType("application/json");
			var writer = response.getWriter();
			writer.write(exception.getMessage() + "\n");
			writer.write(Arrays.toString(exception.getStackTrace()));
			writer.close();
		}
	}
	
	public boolean checkPlace(double x, double y, double R) {
		boolean res = false;
		if (x >= 0 && y >= 0) res = triangle(x, y, R);
		else if (x <= 0 && y >= 0) res = circle(x, y, R);
		else if (x <= 0 && y <= 0) res = square(x, y, R);
		return res;
	}
	
	private boolean triangle(double x, double y, double R) {
		return (y <= -x + R / 2);
	}
	
	private boolean circle(double x, double y, double R) {
		return (y <= Math.sqrt(Math.pow(R, 2) - Math.pow(x, 2)));
	}
	
	private boolean square(double x, double y, double R) {
		return (x >= -R && y >= -R);
	}
	
	public void sendResponse (boolean res, DotesCollection dc, HttpServletResponse response) throws IOException {
		var om = new ObjectMapper();
		System.out.println(3);
		String json;
		if (res) {
			json = om.writeValueAsString(dc.get());
		}
		else {
			var answer = "The dote doesn't hits to region";
			json = om.writeValueAsString(answer);
		}
		response.setContentType("application/json");
		var writer = response.getWriter();
		writer.write(json);
		System.out.println(json);
		writer.close();
	}
}
