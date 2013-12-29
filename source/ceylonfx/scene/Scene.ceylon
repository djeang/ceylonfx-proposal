import ceylon.language {
	Boolean
}

import ceylonfx.application {
	CeylonFxAdapter,
	CeylonNode,
	asNodes
}
import ceylonfx.binding {
	Binding,
	ObjectProperty,
	Unset,
	unset, Property, doubleReadOnlyWrappedProperty, ReadableProperty
}
import ceylonfx.geometry {
	Dimension
}

import ceylonfx.scene.paint {
	Paint,
	white, paintWrappedProperty
}

import javafx.scene {
	Node,
	JScene=Scene,
	Group
}
import java.lang { Double }

// Don't need to use constructors with 'fill' parameter as a fillProperty exists.
JScene createDelegate(Dimension|Unset dimension, {Node|CeylonNode*} children, Boolean|Unset depthBuffer) {
	Group root = Group();
	root.children.setAll(*asNodes(children));
	JScene jScene;
    switch(dimension)
	case (is Unset) {
		jScene = JScene(root);
	} 
	case (is Dimension) {
		switch(depthBuffer)
		case (is Boolean) {
			jScene = JScene(root, dimension[0], dimension[1], depthBuffer);
		} else {
			jScene = JScene(root, dimension[0], dimension[1]);
		}
	}
	return jScene;
}

shared class Scene(dimension = unset, fill = unset, depthBuffer = unset,
	children = [], cursor = unset,
	delegate = createDelegate(dimension, children, depthBuffer))
        extends CeylonFxAdapter<JScene>(delegate) {

	Dimension|Unset dimension ;
	Paint|Unset fill;
	Boolean|Unset depthBuffer;
	{Node|CeylonNode*} children;
	Cursor|Unset cursor;
	JScene delegate;
    
    shared Property<Paint> fillProperty = paintWrappedProperty(delegate.fillProperty(), fill);
    
    shared Property<Cursor> cursorProperty = cursorWrappedProperty(delegate.cursorProperty(), cursor);
    
    shared ReadableProperty<Float> heightProperty = doubleReadOnlyWrappedProperty(delegate.heightProperty());
    
    shared ReadableProperty<Float> widthProperty = doubleReadOnlyWrappedProperty(delegate.widthProperty());
    
}
