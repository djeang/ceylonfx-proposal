import ceylonfx.binding {
	Unset,
	unset,
	Property,
	ReadableProperty,
	doubleReadOnlyWrappedProperty,
	doubleWrappedProperty
}
import ceylonfx.geometry {
	Point3D,
	Location
}
import ceylonfx.scene {
	Node,
	CacheHint,
	Cursor,
	DepthTest,
	Parent
}
import ceylonfx.scene.effect {
	BlendMode,
	Effect
}

import javafx.scene {
	JNode=Node
}
import javafx.scene.control {
	JControl=Control
}

shared abstract class Control<out Delegate = JControl>(
	
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
	Boolean|Unset visible = true,
		
	// Fromcontrol	
	// TODO ContextMenu
	Float|Unset maxHeight = unset,
	Float|Unset maxWidth = unset,
	Float|Unset minHeight = unset,
	Float|Unset minWidth = unset,
	Float|Unset prefHeight = unset,
	Float|Unset prefWidth = unset,
	// TODO skin
	Tooltip|Unset tooltip = unset
	
	) extends Parent<Delegate>(delegate, id, style,blendMode, cacheHint, clip, cursor,
		depthTest, effect, focusTraversable, location, managed, mouseTransparent,
		pickOnBounds, rotate, rotationAxis, scale, translate, visible)
 		given Delegate satisfies JControl {
	
	shared ReadableProperty<Float> heightProperty = doubleReadOnlyWrappedProperty(delegate.heightProperty()) ;
	
	shared Property<Float> maxHeightProperty = doubleWrappedProperty(delegate.maxHeightProperty(), maxHeight);
	
	shared Property<Float> maxWidthProperty = doubleWrappedProperty(delegate.maxWidthProperty(), maxWidth);
	
	shared Property<Float> minHeightProperty = doubleWrappedProperty(delegate.minHeightProperty(), minHeight);
	
	shared Property<Float> minWidthProperty = doubleWrappedProperty(delegate.minWidthProperty(), minWidth);
	
	shared Property<Float> prefHeightProperty = doubleWrappedProperty(delegate.prefHeightProperty(), prefHeight);
	
	shared Property<Float> prefWidthProperty = doubleWrappedProperty(delegate.prefWidthProperty(), prefWidth);
	
	// TODO skin
	
	shared Property<Tooltip> tooltipProperty = tooltipWrappedProperty(delegate.tooltipProperty(), tooltip);
	
	shared ReadableProperty<Float> widthProperty = doubleReadOnlyWrappedProperty(delegate.widthProperty()) ;
}