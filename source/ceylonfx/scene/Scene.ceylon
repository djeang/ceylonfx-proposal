import ceylon.language {
	Boolean
}

import ceylonfx.application {
	CeylonFxAdapter
}
import ceylonfx.binding {
	Unset,
	unset,
	Property,
	doubleReadOnlyWrappedProperty,
	ReadableProperty
}
import ceylonfx.geometry {
	Dimension
}
import ceylonfx.scene.paint {
	Paint,
	paintWrappedProperty
}

import javafx.scene {
	JScene=Scene
}

// Don't need to use constructors with 'fill' parameter as a fillProperty exists.
JScene createDelegate(Dimension|Unset dimension, Parent root, Boolean|Unset depthBuffer) {
	
	//root.children.setAll(*asNodes(children));
	JScene jScene;
    switch(dimension)
	case (is Unset) {
		jScene = JScene(root.delegate);
	} 
	case (is Dimension) {
		switch(depthBuffer)
		case (is Boolean) {
			jScene = JScene(root.delegate, dimension[0], dimension[1], depthBuffer);
		} else {
			jScene = JScene(root.delegate, dimension[0], dimension[1]);
		}
	}
	return jScene;
}

shared class Scene(
	Parent root,
	Dimension|Unset dimension = unset, 
	Paint|Unset fill = unset, 
	Boolean|Unset depthBuffer = unset,
	Cursor|Unset cursor = unset,
	JScene delegate = createDelegate(dimension, root, depthBuffer))
        extends CeylonFxAdapter<JScene>(delegate) {
    
    shared Property<Paint> fillProperty = paintWrappedProperty(delegate.fillProperty(), fill);
    
    shared Property<Cursor> cursorProperty = cursorWrappedProperty(delegate.cursorProperty(), cursor);
    
    shared ReadableProperty<Float> heightProperty = doubleReadOnlyWrappedProperty(delegate.heightProperty());
    
    shared ReadableProperty<Float> widthProperty = doubleReadOnlyWrappedProperty(delegate.widthProperty());
    
    shared Property<Parent> rootProperty = parentWrappedProperty(delegate.rootProperty());
    
}
