package view;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Dote;
import netscape.javascript.JSObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "GetterServlet", value = "/getDotData")
public class GetterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        sendData(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        sendData(request, response);
    }
    
    public void sendData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        ArrayList<String> listAnswer = (ArrayList<String>) session.getAttribute("Answer-list");
        ArrayList<String> listR = (ArrayList<String>) session.getAttribute("R-list");
        ArrayList<Dote> dots = (ArrayList<Dote>) session.getAttribute("Dot-list");
        if (dots != null) {
            ArrayList<Double> listX = new ArrayList<>();
            ArrayList<Double> listY = new ArrayList<>();
            for (Dote dot : dots) {
                listX.add(dot.x());
                listY.add(dot.y());
            }
    
            var json = new JsonObject();
            Gson gson = new Gson();
            json.addProperty("x", gson.toJson(listX, ArrayList.class));
            json.addProperty("y", gson.toJson(listY, ArrayList.class));
            json.addProperty("R", gson.toJson(listR, ArrayList.class));
            json.addProperty("answer", gson.toJson(listAnswer, ArrayList.class));
            String jsonString = json.toString();
            response.setContentType("application/json");
            try (PrintWriter out = response.getWriter()) {
                out.write(jsonString);
            }
        } else {
            try (PrintWriter out = response.getWriter()) {
                out.write("-1");
            }
        }
    }
}
