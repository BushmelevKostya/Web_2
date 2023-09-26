package controller;

import com.google.gson.Gson;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Dote;
import model.DotesCollection;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

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
			HttpSession session = request.getSession();
			var gson = new Gson();
			String str = (String) session.getAttribute("data");
			var data = gson.fromJson(str, HashMap.class);
			
			double x = (double) data.get("radio");
			double y = (double) data.get("text");
			double R = (double) data.get("press_button");
			
			boolean res = checkPlace(x, y, R);
			var dc = DotesCollection.get(request);
			var dote = new Dote(x, y);
			if (res) DotesCollection.add(dote, request);
			reviewTable(res, dc, request, response);
		} catch (NullPointerException exception) {
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
	
	public void reviewTable (boolean res, ArrayList<Dote> dc, HttpServletRequest request, HttpServletResponse response) throws IOException {
		var writer = response.getWriter();

		writer.close();
	}
}
