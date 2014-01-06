import ceylonfx.binding {
	Unset,
	unset,
	Property,
	stringWrappedProperty,
	doubleWrappedProperty,
	ReadableProperty,
	booleanWrappedProperty
}
import ceylonfx.geometry {
	Point3D,
	Location,
	Position,
	Insets,
	positionWrappedProperty,
	insetsWrappedReadOnlyProperty
}
import ceylonfx.scene {
	Node,
	CacheHint,
	Cursor,
	DepthTest,
	nodeWrappedProperty
}
import ceylonfx.scene.effect {
	BlendMode,
	Effect
}
import ceylonfx.scene.paint {
	Paint,
	paintWrappedProperty
}
import ceylonfx.scene.text {
	Font,
	TextAlignment,
	fontWrappedProperty,
	textAlignementWrappedProperty
}

import javafx.scene {
	JNode=Node
}
import javafx.scene.control {
	JLabeled=Labeled
}

shared abstract class Labeled<out Delegate = JLabeled> (
	
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
	
	// From control	
	// TODO ContextMenu
	Float|Unset maxHeight = unset,
	Float|Unset maxWidth = unset,
	Float|Unset minHeight = unset,
	Float|Unset minWidth = unset,
	Float|Unset prefHeight = unset,
	Float|Unset prefWidth = unset,
	// TODO skin
	Tooltip|Unset tooltip = unset,
	
	// From Labeled
	Position|Unset alignment = unset,
	// TODO ContentDisplay
	String|Unset elipsisString = unset,
	Font|Unset font = unset,
	Node|Unset graphic = unset,
	Float|Unset graphicTextGap = unset,
	Boolean|Unset mnemonicParsing = unset,
	TextAlignment|Unset textAlignment = unset,
	Paint|Unset textFill = unset,
	// TODO textOverrun
	String|Unset text = unset,
	Boolean|Unset underline = unset,
	Boolean|Unset wrapText = unset 
	
) extends Control(delegate, id, style,blendMode, cacheHint, clip, cursor,
		depthTest, effect, focusTraversable, location, managed, mouseTransparent,
		pickOnBounds, rotate, rotationAxis, scale, translate, visible, maxHeight, maxWidth, minHeight, minWidth,
		prefHeight, prefWidth, tooltip)
	given Delegate satisfies JLabeled {
	
	shared Property<Position> alignmentProperty = positionWrappedProperty(delegate.alignmentProperty(), alignment);
	
	shared Property<String> elipsisStringProperty = stringWrappedProperty(delegate.ellipsisStringProperty(), elipsisString);
	
	shared Property<Font> fontProperty = fontWrappedProperty(delegate.fontProperty(), font);
	
	shared Property<Node> graphicProperty = nodeWrappedProperty(delegate.graphicProperty(), graphic);
	
	shared Property<Float> graphicTextGapProperty = doubleWrappedProperty(delegate.graphicTextGapProperty(), graphicTextGap);
	
	shared ReadableProperty<Insets> labelPaddingProperty = insetsWrappedReadOnlyProperty(delegate.labelPaddingProperty());
	
	shared Property<Boolean> mnemonicParsingProperty = booleanWrappedProperty(delegate.mnemonicParsingProperty(), mnemonicParsing);
	
	shared Property<TextAlignment> textAlignmentProperty = textAlignementWrappedProperty(delegate.textAlignmentProperty(), textAlignment);
	
	shared Property<Paint> textFillProperty = paintWrappedProperty(delegate.textFillProperty(), textFill);
	
	shared Property<String> textProperty = stringWrappedProperty(delegate.textProperty(), text);
	
	shared Property<Boolean> underlineProperty = booleanWrappedProperty(delegate.underlineProperty(), underline);
	
	shared Property<Boolean> wrapTextProperty = booleanWrappedProperty(delegate.wrapTextProperty(), wrapText);

}