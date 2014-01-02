import ceylonfx.application {
	CeylonFxAdapter
}
import ceylonfx.binding {
	ReadableProperty,
	Unset,
	unset,
	Property,
	stringWrappedProperty,
	JObjectProp,
	JavaWrappedProperty
}
import ceylonfx.geometry {
	Location,
	Point3D,
	Bounds,
	boundsReadOnlyWrappedProperty
}
import ceylonfx.scene.effect {
	BlendMode,
	Effect,
	blendModeWrappedProperty,
	effectWrappedProperty
}

import javafx.scene {
	JNode=Node
}

"Base class for scene graph nodes."
shared abstract class Node<out Delegate = JNode> (
	Delegate delegate,
	String|Unset id = unset,
	String|Unset style = unset,
	BlendMode|Unset blendMode = unset,
	CacheHint|Unset cacheHint = unset,
	Node<JNode>|Unset clip = unset,
	Cursor|Unset cursor = unset,
	DepthTest|Unset depthTest = unset,
	Effect|Unset effect = unset,
	Boolean|Unset focusTraversable = unset,
	Location|Unset location = unset,
	Boolean|Unset managed = unset,
	Boolean|Unset mouseTransparent = unset,
	Boolean|Unset pickOnBounds = unset,
	Float|Unset rotate = unset,
	Point3D|Unset rotationAxis = unset,
	[Float|Unset, Float, Float]|Unset scale = unset,
	[Float|Unset, Float, Float]|Unset translate = unset,
	Boolean|Unset visible = true)
		extends CeylonFxAdapter<Delegate>(delegate)
		given Delegate satisfies JNode {
	
	shared Property<String> idProperty = stringWrappedProperty(delegate.idProperty(), id);
	
	shared Property<String> styleProperty = stringWrappedProperty(delegate.styleProperty(), style);
	
	shared Property<BlendMode> blendModeProperty = blendModeWrappedProperty(delegate.blendModeProperty(), blendMode);
	
	shared Property<CacheHint> cacheHintProperty = cacheHintWrappedProperty(delegate.cacheHintProperty(), cacheHint);
	
	shared Property<Node> clipProperty = nodeWrappedProperty(delegate.clipProperty(), clip);
			
	shared Property<DepthTest> depthTestProperty = depthTestWrappedProperty(delegate.depthTestProperty(), depthTest);
			
	shared Property<Effect> effectProperty = effectWrappedProperty(delegate.effectProperty(), effect); 	
		
	shared ReadableProperty<Bounds> boundsInLocalProperty = boundsReadOnlyWrappedProperty(delegate.boundsInLocalProperty());
	
	shared ReadableProperty<Bounds> boundsInParentProperty = boundsReadOnlyWrappedProperty(delegate.boundsInParentProperty());
	
}

shared class GenericNode(JNode delegate) extends Node(delegate) {}

shared Property<Node> nodeWrappedProperty(JObjectProp<JNode> jProp, Node|Unset initValue = unset) {
	return JavaWrappedProperty(jProp, Node<JNode>.delegate, GenericNode, initValue);
}
