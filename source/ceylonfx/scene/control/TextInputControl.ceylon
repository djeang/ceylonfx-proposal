import ceylonfx.application {
	CeylonFxAdapter
}

import javafx.scene.control {
	JTextInputControl=TextInputControl
}
import ceylonfx.binding { Unset, unset, ReadableProperty, integerReadOnlyWrappedProperty, Property, stringWrappedProperty, booleanWrappedProperty, stringReadOnlyWrappedProperty }
import ceylonfx.scene.effect { BlendMode, Effect }
import ceylonfx.scene { Node, CacheHint, Cursor, DepthTest }
import javafx.scene { JNode=Node }
import ceylonfx.geometry { Point3D, Location }

shared abstract class TextInputControl<out Delegate = JTextInputControl>(
	
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
	Tooltip|Unset tooltip = unset,
	
	// From TextInputControl
	Boolean|Unset editable = unset,
	String|Unset promptText = unset,
	String|Unset text = unset
	
) extends Control<JTextInputControl>(delegate, id, style,blendMode, cacheHint, clip, cursor,
		depthTest, effect, focusTraversable, location, managed, mouseTransparent,
		pickOnBounds, rotate, rotationAxis, scale, translate, visible, maxHeight, maxWidth, minHeight, minWidth,
		prefHeight, prefWidth, tooltip)
given Delegate satisfies JTextInputControl {
	
	
	shared Property<String> textProperty = stringWrappedProperty(delegate.textProperty(), text);
	
	shared Property<String> promptTextProperty = stringWrappedProperty(delegate.promptTextProperty(), promptText);

	shared Property<Boolean> editableProperty = booleanWrappedProperty(delegate.editableProperty(), editable);
	
	shared ReadableProperty<Integer> anchorProperty = integerReadOnlyWrappedProperty(delegate.anchorProperty());
	
	shared ReadableProperty<Integer> caretPositionProperty = integerReadOnlyWrappedProperty(delegate.caretPositionProperty());
 
 	shared ReadableProperty<Integer> lengthProperty = integerReadOnlyWrappedProperty(delegate.lengthProperty());

	// TODO indexRange
	
	shared ReadableProperty<String> selectedTextProperty = stringReadOnlyWrappedProperty(delegate.selectedTextProperty());

}