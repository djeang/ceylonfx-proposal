import ceylonfx.binding {
	Unset,
	unset, Property, integerWrappedProperty
}
import ceylonfx.geometry {
	Position, positionWrappedProperty, Point3D, Location
}

import javafx.scene.control {
	JTextField=TextField
}
import ceylonfx.scene.effect { BlendMode, Effect }
import ceylonfx.scene { Node, CacheHint, Cursor, DepthTest }
import javafx.scene { JNode=Node }

shared class TextField (
	
	// From  CeylonFxAdapter
	JTextField delegate = JTextField(),
	
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
	Tooltip|Unset tooltip = unset,
	
	// From TextInputControl
	Boolean|Unset editable = unset,
	String|Unset promptText = unset,
	String|Unset text = unset,
	
	// From TextField
	Position|Unset alignement = unset,
	Anything(TextField)|Unset onAction = unset, 
	Integer|Unset prefColumCount = unset) 
		
		extends TextInputControl(delegate, id, style,blendMode, cacheHint, clip, cursor,
		depthTest, effect, focusTraversable, location, managed, mouseTransparent,
		pickOnBounds, rotate, rotationAxis, scale, translate, visible, maxHeight, maxWidth, minHeight, minWidth,
		prefHeight, prefWidth, tooltip, editable, promptText, text) {
		
	shared Property<Position> alignementProperty = positionWrappedProperty(delegate.alignmentProperty(), alignement);
		
	shared Property<Integer> prefColumnCountProperty = integerWrappedProperty(delegate.prefColumnCountProperty(), prefColumCount); 

	// TODO eventType implementation for onAction
	
}


