import ceylonfx.binding {
	ReadableProperty,
	booleanReadOnlyWrappedProperty, Unset, unset
}
import ceylonfx.collections { ObservableList }

import javafx.scene {
	JParent=Parent, JNode=Node
}
import ceylonfx.scene.effect { BlendMode, Effect }
import ceylonfx.geometry { Point3D, Location }


shared abstract class Parent<out Delegate>(
	
	// From  CeylonFxAdapter
	Delegate delegate,
	
	// From Node
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
	[Float, Float, Float]|Unset scale = unset,
	[Float, Float, Float]|Unset translate = unset,
	Boolean|Unset visible = true)

	extends Node<Delegate>(delegate, id, style,blendMode, cacheHint, clip, cursor,
		depthTest, effect, focusTraversable, location, managed, mouseTransparent,
		pickOnBounds, rotate, rotationAxis, scale, translate, visible)
	given Delegate satisfies JParent {
	
	shared ReadableProperty<Boolean> needsLayoutProperty = booleanReadOnlyWrappedProperty(delegate.needsLayoutProperty());

}