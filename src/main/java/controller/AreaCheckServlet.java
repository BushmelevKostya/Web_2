package controller;

import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Dote;
import model.DotesCollection;

import java.io.IOException;
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
			var data = (HashMap<String, Double>) session.getAttribute("data");
			try {
				double x = data.get("radio");
				double y = data.get("text");
				double R = data.get("press_button");
				boolean res = checkPlace(x, y, R);
				updateData(x, y, R, res, request, response);
			} catch (Exception exception) {
				request.setAttribute("error", exception.getMessage());
				RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
				dispatcher.forward(request, response);
			}
			
		} catch (NullPointerException | ServletException exception) {
			response.setContentType("application/json");
			var writer = response.getWriter();
			writer.write(exception.getMessage() + "\n");
			writer.write(Arrays.toString(exception.getStackTrace()));
			writer.close();
		}
	}
	
	public boolean checkPlace(double x, double y, double R) {
		boolean res = false;
		if (x >= 0 && y >= 0) res = circle(x, y, R);
		else if (x <= 0 && y >= 0) res = square(x, y, R);
		else if (x <= 0 && y <= 0) res = triangle(x, y, R);
		return res;
	}
	
	private boolean triangle(double x, double y, double R) {
		return (y >= -2 * x - R);
	}
	
	private boolean circle(double x, double y, double R) {
		return (y <= Math.sqrt(Math.pow(R, 2) - Math.pow(x, 2)));
	}
	
	private boolean square(double x, double y, double R) {
		return (x >= -R && y <= R);
	}
	
	public void updateData(double x, double y, double R, boolean res, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		var dote = new Dote(x, y);
		DotesCollection collection = DotesCollection.getCollection();
		collection.addDot(dote);
		collection.addR(R);
		if (res) collection.addAnswer("yes");
		else collection.addAnswer("no");
		
		HttpSession session = request.getSession();
		session.setAttribute("Dot-list", collection.getDotCollection());
		session.setAttribute("R-list", collection.getRCollection());
		session.setAttribute("Answer-list", collection.getAnswerCollection());
		
		response.sendRedirect("./view");
	}
}
