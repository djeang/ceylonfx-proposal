import ceylonfx.binding {
	Property,
	Unset,
	unset,
	doubleWrappedProperty
}
import ceylonfx.geometry {
	Location,
	Point3D
}
import ceylonfx.scene {
	Node,
	Cursor,
	DepthTest,
	CacheHint
}
import ceylonfx.scene.effect {
	Effect,
	BlendMode
}
import ceylonfx.scene.paint {
	Paint
}

import javafx.scene {
	JNode=Node
}
import javafx.scene.shape {
	JRectangle=Rectangle
}

 

"The Rectangle class defines a rectangle with the specified size and location.
 By default the rectangle has sharp corners.
 Rounded corners can be specified using the arcWidth and arcHeight variables. "
shared class Rectangle(
	
	// From  CeylonFxAdapter
	JRectangle delegate,
	
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
	
	// From Shape
	Paint|Unset fill = unset,
	Boolean|Unset smooth = unset,
	Float|Unset strokeDashOffset = unset,
	StrokeLineCap|Unset strokeLineCap = unset,
	StrokeLineJoin|Unset strokeLineJoin = unset,
	Float|Unset strokeMiterLimit = unset,
	Paint?|Unset stroke = unset,
	StrokeType|Unset strokeType = unset,
	Float|Unset strokeWidth = unset,
	
	// From Rectangle
	Float|Unset arcHeight = unset,
	Float|Unset arcWidth = unset,
	Float|Unset height = unset,
	Float|Unset width = unset,
	Float|Unset x = unset,
	Float|Unset y = unset)
	
		extends Shape<JRectangle>(delegate, id, style,blendMode, cacheHint, clip, cursor,
		depthTest, effect, focusTraversable, location, managed, mouseTransparent,
		pickOnBounds, rotate, rotationAxis, scale, translate, visible, 
		fill, smooth, strokeDashOffset, strokeLineCap, strokeLineJoin, strokeMiterLimit, 
		stroke, strokeType, strokeWidth) {
	
	shared Property<Float> arcWidthProperty = doubleWrappedProperty(delegate.arcWidthProperty(), width);
	
	shared Property<Float> arcHeightProperty = doubleWrappedProperty(delegate.arcHeightProperty(), height);
	
	shared Property<Float> widthProperty = doubleWrappedProperty(delegate.widthProperty(), width);
	
	shared Property<Float> haightProperty = doubleWrappedProperty(delegate.heightProperty(), height);
	
	shared Property<Float> xProperty = doubleWrappedProperty(delegate.xProperty(), x);
	
	shared Property<Float> yProperty = doubleWrappedProperty(delegate.yProperty(), y);
	
}
