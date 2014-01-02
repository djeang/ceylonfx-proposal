import javafx.collections {
	JObservableList = ObservableList
}

shared class ObservableList<CeylonItem, JavaItem>(JObservableList<JavaItem> delegate) 
		extends CeylonFxAdapter<JObservableList<JavaItem>(delegate) {
}