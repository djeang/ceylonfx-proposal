import ceylonfx.binding {
	Unset,
	unset,
	ReadableProperty,
	booleanReadOnlyWrappedProperty
}
import ceylonfx.geometry {
	Location,
	Point3D,
	Position
}
import ceylonfx.scene {
	Cursor,
	DepthTest,
	Node,
	CacheHint
}
import ceylonfx.scene.effect {
	Effect,
	BlendMode
}
import ceylonfx.scene.paint {
	Paint
}
import ceylonfx.scene.text {
	TextAlignment,
	Font
}

import javafx.scene {
	JNode=Node
}
import javafx.scene.control {
	JButtonBase=ButtonBase
}

shared abstract class ButtonBase<out Delegate = JButtonBase> (
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
	
	// From ButtonBase
	// TODO onaction
	 
) extends Labeled<Delegate>(delegate, id, style,blendMode, cacheHint, clip, cursor,
		depthTest, effect, focusTraversable, location, managed, mouseTransparent,
		pickOnBounds, rotate, rotationAxis, scale, translate, visible, maxHeight, maxWidth, minHeight, minWidth,
		prefHeight, prefWidth, tooltip, alignment, elipsisString, font, graphic, graphicTextGap, mnemonicParsing, 
		textAlignment, textFill, text, underline, wrapText) 
	given Delegate satisfies JButtonBase {
	
	shared ReadableProperty<Boolean> armedProperty = booleanReadOnlyWrappedProperty(delegate.armedProperty());

}