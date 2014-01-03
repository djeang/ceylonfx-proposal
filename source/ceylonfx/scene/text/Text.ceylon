import ceylonfx.binding {
	Unset,
	unset,
	Property,
	doubleReadOnlyWrappedProperty,
	ReadableProperty,
	booleanWrappedProperty,
	stringWrappedProperty,
	doubleWrappedProperty
}
import ceylonfx.geometry {
	Location,
	Point3D,
	VerticalPosition,
	verticalpositionWrappedProperty
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
import ceylonfx.scene.shape {
	Shape,
	StrokeType,
	StrokeLineCap,
	StrokeLineJoin
}

import javafx.scene {
	JNode=Node
}
import javafx.scene.text {
	JText=Text
}


shared class Text(
	
	// From  CeylonFxAdapter
	JText delegate,
	
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
	
	// From Text
	TextBoundsType|Unset boundsType = unset,
	Font|Unset font = unset,
	FontSmoothingType|Unset fontSmoothingType = unset,
	Boolean|Unset strikeThrough = unset,
	TextAlignment|Unset textAlignment = unset,
	VerticalPosition|Unset textOrigin = unset,
	String|Unset text = unset,
	Boolean|Unset underline = unset,
	Float|Unset wrappingWidth = unset,
	Float|Unset x = unset,
	Float|Unset y = unset)

		extends Shape<JText>(delegate, id, style,blendMode, cacheHint, clip, cursor,
	depthTest, effect, focusTraversable, location, managed, mouseTransparent,
	pickOnBounds, rotate, rotationAxis, scale, translate, visible, 
	fill, smooth, strokeDashOffset, strokeLineCap, strokeLineJoin, strokeMiterLimit, 
	stroke, strokeType, strokeWidth) {
	
	shared ReadableProperty<Float> baseLineOffsetProperty = doubleReadOnlyWrappedProperty(delegate.baselineOffsetProperty());
	
	shared Property<TextBoundsType> textBoundsTypeProperty = textBoundTypeWrappedProperty(delegate.boundsTypeProperty(), boundsType);
	
	shared Property<Font> fontProperty = fontWrappedProperty(delegate.fontProperty(), font); 
	
	shared Property<FontSmoothingType> fontSmoothingTypeProperty = fontSmoothingWrappedProperty(delegate.fontSmoothingTypeProperty(), fontSmoothingType);
	
	shared Property<Boolean> strikeThroughProperty = booleanWrappedProperty(delegate.strikethroughProperty(), strikeThrough);
	
	shared Property<TextAlignment> textAlignmentProperty = textAlignementWrappedProperty(delegate.textAlignmentProperty(), textAlignment);
	
	shared Property<VerticalPosition> textOriginPProperty = verticalpositionWrappedProperty(delegate.textOriginProperty(), textOrigin);
	
	shared Property<String> textProperty = stringWrappedProperty(delegate.textProperty(), text);
	
	shared Property<Boolean> underlineProperty = booleanWrappedProperty(delegate.underlineProperty(), underline);

	shared Property<Float> wrappingWidthProperty = doubleWrappedProperty(delegate.wrappingWidthProperty(), wrappingWidth);

	shared Property<Float> xProperty = doubleWrappedProperty(delegate.xProperty(), x);
	
	shared Property<Float> yProperty = doubleWrappedProperty(delegate.yProperty(), wrappingWidth);


}




