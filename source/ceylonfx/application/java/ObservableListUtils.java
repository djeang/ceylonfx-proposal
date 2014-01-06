package ceylonfx.application.java;

import java.util.LinkedList;
import java.util.List;

import javafx.collections.ObservableList;
import ceylon.language.Integer;
import ceylon.language.Sequential;

public class ObservableListUtils {
	
	public static <E> void setAll(ObservableList<E> jList, Sequential<? extends E> sequence) {
		List<E> items = new LinkedList<>();
		for (int i = 0; i < sequence.getSize(); i++) {
			ceylon.language.Integer index = new Integer(i);
			E item = (E) sequence.get(index);
			items.add(item);
		}
		jList.setAll(items);
	}

}
