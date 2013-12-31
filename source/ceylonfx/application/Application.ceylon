
import ceylonfx.application.java {
	JavaApp {
		initialize
	}
}
import ceylonfx.stage {
	Stage
}
import ceylonfx.utils {
	doInFxThread
}
import ceylon.language.meta.model { Type }

"Application class which is the root of all CeylonFX applications."
shared class CeylonFX(stage, Boolean showNow = true, String?* args) {

	shared Stage stage;
	
	print("Created CeylonApp");
	value actualStage = initialize(*args);
	
	doInFxThread(void(Object* args) {
		stage.delegate = actualStage;
		if (exists d = stage.delegate) {
			print("App started!!!");
			if (showNow) {
				d.centerOnScreen();
			}
		} else {
			throw Exception("Could not start CeylonFX Application");	
		}
	});
		
	shared void show() {
		actualStage.show();
	}
	
	shared void hide() {
		actualStage.hide();
	}
	
}

"""A bridge class between CeylonFX and the underlying JavaFX framework.
   
   All CeylonFX Nodes, except for some top-level components, should extend this class
   so that it is always possible to reach the JavaFX delegate"""
shared abstract class CeylonFxAdapter<out Delegate>(shared Delegate delegate) {}




//shared {JNode*} asNodes({JNode|Node*} mixed) {
//	value nodes = { for(node in mixed) asType<JNode>(node) };
//	return { for(node in nodes) if (exists node) node };
//}
//
//shared Type? asType<out Type>(Type|CeylonFxAdapter<Type> toConvert)
//	given Type satisfies Object {
//	if (is Type toConvert) {
//		return toConvert;
//	}
//	if (is CeylonFxAdapter<Type> toConvert) {
//		return toConvert.delegate;
//	}
//	return null;
//}
