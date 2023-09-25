package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AreaCheckServlet", value = "/AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		run(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		run(request, response);
	}
	
	public void run(HttpServletRequest request, HttpServletResponse response) {
		double x = Double.parseDouble(request.getParameter("x"));
		double y = Double.parseDouble(request.getParameter("y"));
		double R = Double.parseDouble(request.getParameter("R"));
		
		boolean res = checkPlace(x, y, R);
		
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
}
