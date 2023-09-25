package model;
import jakarta.ejb.Stateful;
import jakarta.enterprise.context.SessionScoped;

import java.io.Serializable;
import java.util.ArrayList;

@Stateful
@SessionScoped
public class DotesCollection implements Serializable {
	private ArrayList<Dote> collection;
	
	public DotesCollection() {
		create();
	}
	private void create() {
		if (collection == null) this.collection = new ArrayList<>();
	}
	
	public void add (Dote dote) {
		create();
		collection.add(dote);
	}
	
	public ArrayList<Dote> get () {return collection;}
}