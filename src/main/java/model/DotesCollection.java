package model;

import java.io.Serializable;
import java.util.ArrayList;

public class DotesCollection implements Serializable {
	private static DotesCollection collection;
	private final ArrayList<Dote> dotCollection;
	private final ArrayList<Double> RCollection;
	private final ArrayList<String> answerCollection;
	
	private DotesCollection() {
		dotCollection = new ArrayList<>();
		RCollection = new ArrayList<>();
		answerCollection = new ArrayList<>();
	}
	
	public static DotesCollection getCollection() {
		if (collection == null) collection = new DotesCollection();
		return collection;
	}
	
	public ArrayList<Dote> getDotCollection() {
		return dotCollection;
	}
	
	public ArrayList<Double> getRCollection() {
		return RCollection;
	}
	
	public ArrayList<String> getAnswerCollection() {
		return answerCollection;
	}
	
	public void addDot(Dote dot) {
		dotCollection.add(dot);
	}
	
	public void addR(Double R) {
		RCollection.add(R);
	}
	
	public void addAnswer(String answer) {
		answerCollection.add(answer);
	}
}