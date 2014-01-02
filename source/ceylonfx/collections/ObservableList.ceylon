import javafx.collections {
	JObservableList = ObservableList
}
import ceylonfx.application { CeylonFxAdapter }

shared class ObservableList<CeylonItem, JavaItem>(JObservableList<JavaItem> delegate, JavaItem(CeylonItem) c2j, CeylonItem(JavaItem) j2c) 
	extends CeylonFxAdapter<JObservableList<JavaItem>>(delegate) {

	shared void setAll({CeylonItem*} items) {
		[JavaItem*] javaItems = [for (i in items) c2j(i)]; 
		
	}
}