package model;

import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;

import java.io.Serializable;
import java.util.ArrayList;

public class DotesCollection implements Serializable {
	private static ArrayList<Dote> collection;
	
	private DotesCollection() {
	
	}
	
	public static ArrayList<Dote> get(HttpServletRequest request) {
		var session = request.getSession();
		try {
			collection = (ArrayList<Dote>) session.getAttribute("collection");
			return collection;
		} catch (NullPointerException exception) {
			collection = new ArrayList<>();
			session.setAttribute("collection", collection);
			return collection;
		}
	}
	
	public static void addDot(Dote dot, HttpServletRequest request) {
		var session = request.getSession();
		try {
			collection.add(dot);
		} catch (NullPointerException exception) {
			collection = new ArrayList<>();
			collection.add(dot);
		} finally {
			session.setAttribute("Dot-list", collection);
		}
	}
	
	public static void addR(Double R, HttpServletRequest request) {
		var session = request.getSession();
		ArrayList<Double> list = new ArrayList<>();
		try {
			var attr = (ArrayList<Double>)session.getAttribute("R-list");
			if (attr != null) list = attr;
		} catch (NullPointerException exception) {
			list = new ArrayList<>();
		} finally {
			list.add(R);
			session.setAttribute("R-list", list);
		}
	}
	
	public static void addAnswer(String answer, HttpServletRequest request) {
		var session = request.getSession();
		ArrayList<String> list = new ArrayList<>();
		try {
			var attr = (ArrayList<String>)session.getAttribute("Answer-list");
			if (attr != null) list = attr;
		} catch (NullPointerException ignored) {
		} finally {
			list.add(answer);
			session.setAttribute("Answer-list", list);
			System.out.println(list.size());
		}
	}
}