package view;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "TableServlet", value = "/view")
public class TableServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		run(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        run(request, response);
	}
	
	private void run (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var session = request.getSession();
        request.setAttribute("Dot-list", session.getAttribute("Dot-list"));
        request.setAttribute("R-list", session.getAttribute("R-list"));
        request.setAttribute("Answer-list", session.getAttribute("Answer-list"));
//		ServletContext servletContext = getServletContext();
        RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
        dispatcher.forward(request, response);
	}
}
