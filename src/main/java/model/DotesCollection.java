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
	
	public static void add(Dote dote, HttpServletRequest request) {
		var session = request.getSession();
		try {
			collection.add(dote);
		} catch (NullPointerException exception) {
			collection = new ArrayList<>();
			collection.add(dote);
		} finally {
			session.setAttribute("collection", collection);
		}
	}
}