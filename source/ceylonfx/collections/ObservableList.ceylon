import ceylonfx.application {
	CeylonFxAdapter
}

import javafx.collections {
	JObservableList=ObservableList
}

import ceylonfx.application.java { ObservableListUtils {utilsSetAll = setAll} }


shared interface ObservableList<Item> {
	
	shared formal void setAll({Item*} items);

} 

shared class WrappedObservableList<CeylonItem, JavaItem>(JObservableList<JavaItem> delegate, JavaItem(CeylonItem) c2j, CeylonItem(JavaItem) j2c) 
	extends CeylonFxAdapter<JObservableList<JavaItem>>(delegate)
    satisfies ObservableList<CeylonItem> {

	shared actual void setAll({CeylonItem*} items) {
		[JavaItem*] javaItems = [for (i in items) c2j(i)];  
		utilsSetAll(delegate, javaItems);  // Workaround as commented statement triggers a weird compilation error
		//delegate.setAll(*javaItems); 
	}
	
	 
}