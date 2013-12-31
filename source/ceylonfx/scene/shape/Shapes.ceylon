import ceylonfx.geometry {
	Dimension
}
import ceylonfx.scene {
	Node
}
import ceylonfx.scene.paint {
	Paint,
	white,
	black, paintWrappedProperty
}
import ceylonfx.scene.shape.utils {
	transferProperties
}

import javafx.scene {
	JNode=Node
}
import javafx.scene.shape {
	JRect=Rectangle,
	JStrokeType=StrokeType,
	JStrokeLC=StrokeLineCap,
	JStrokeLJ=StrokeLineJoin,
	JShape=Shape
}
import ceylonfx.binding { Property, JObjectProp, Unset, unset, JavaWrappedProperty }

"Defines where to draw the stroke around the boundary of a Shape node."
shared abstract class StrokeType(JStrokeType strokeType)
		of centeredStroke|insideStroke|outsideStroke|StrokeTypeGeneric {
	shared JStrokeType delegate => strokeType;
}

class StrokeTypeGeneric(JStrokeType delegate) extends StrokeType(delegate) {}

shared Property<StrokeType> strokeTypeWrappedProperty(JObjectProp<JStrokeType> jProp, StrokeType|Unset initValue = unset) 
  => JavaWrappedProperty(jProp, StrokeType.delegate, StrokeTypeGeneric, initValue); 

"The stroke is applied by extending the boundary of the [[Shape]] node by a distance
 of half of the strokeWidth on either side (inside and outside) of the boundary."
shared object centeredStroke extends StrokeType(JStrokeType.\iCENTERED) {}

"The stroke is applied by extending the boundary of the [[Shape]] node into its interior
 by a distance specified by the strokeWidth."
shared object insideStroke extends StrokeType(JStrokeType.\iINSIDE) {}

"The stroke is applied by extending the boundary of the [[Shape]] node outside of its interior
 by a distance specified by the strokeWidth."
shared object outsideStroke extends StrokeType(JStrokeType.\iOUTSIDE) {}


"Defines the end cap style of a Shape."
shared abstract class StrokeLineCap(JStrokeLC strokeLineCap)
		of buttLineCap|roundLineCap|squareLineCap|StrokeLineCapGeneric {
	shared JStrokeLC delegate => strokeLineCap;
}

class StrokeLineCapGeneric(JStrokeLC delegate) extends StrokeLineCap(delegate) {}

shared Property<StrokeLineCap> strokeLineCapWrappedProperty(JObjectProp<JStrokeLC> jProp, StrokeLineCap|Unset initValue = unset) 
		=> JavaWrappedProperty(jProp, StrokeLineCap.delegate, StrokeLineCapGeneric, initValue); 


"Ends unclosed subpaths and dash segments with no added decoration."
shared object buttLineCap extends StrokeLineCap(JStrokeLC.\iBUTT) {}

"Ends unclosed subpaths and dash segments with a round decoration that has a radius equal to
 half of the width of the pen."
shared object roundLineCap extends StrokeLineCap(JStrokeLC.\iROUND) {}

"Ends unclosed subpaths and dash segments with a square projection that extends beyond the end
 of the segment to a distance equal to half of the line width."
shared object squareLineCap extends StrokeLineCap(JStrokeLC.\iSQUARE) {}


"Defines the line join style of a Shape."
shared abstract class StrokeLineJoin(JStrokeLJ strokeLineJoin)
		of bevelLineJoin|miterLineJoin|roundLineJoin|StrokeLineJoinGeneric {
	shared JStrokeLJ delegate => strokeLineJoin;
}

class StrokeLineJoinGeneric(JStrokeLJ delegate) extends StrokeLineJoin(delegate) {}

shared Property<StrokeLineJoin> strokeLineJoinWrappedProperty(JObjectProp<JStrokeLJ> jProp, StrokeLineJoin|Unset initValue = unset) 
		=> JavaWrappedProperty(jProp, StrokeLineJoin.delegate, StrokeLineJoinGeneric, initValue); 


"Joins path segments by connecting the outer corners of their wide outlines with a straight segment."
shared object bevelLineJoin extends StrokeLineJoin(JStrokeLJ.\iBEVEL) {}

"Joins path segments by extending their outside edges until they meet."
shared object miterLineJoin extends StrokeLineJoin(JStrokeLJ.\iMITER) {}

"Joins path segments by rounding off the corner at a radius of half the line width."
shared object roundLineJoin extends StrokeLineJoin(JStrokeLJ.\iROUND) {}


"The Shape class provides definitions of common properties for objects that represent some
 form of geometric shape."
shared abstract class Shape(
	JShape delegate,
	Paint|Unset fill = unset,
	Boolean|Unset smooth = unset,
	Float|Unset strokeDashOffset = unset,
	StrokeLineCap|Unset strokeLineCap = unset,
	StrokeLineJoin|Unset strokeLineJoin = unset,
	Float|Unset strokeMiterLimit = unset,
	Paint?|Unset stroke = unset,
	StrokeType|Unset strokeType = unset,
	Float|Unset strokeWidth = unset)
		extends Node(delegate) {
	
	shared Property<Paint> fillProperty = paintWrappedProperty(delegate.fillProperty(), fill);
	
	shared Property<Paint?> strokeProperty = paintWrappedProperty(delegate.strokeProperty(), stroke);


}

"The Rectangle class defines a rectangle with the specified size and location.
 By default the rectangle has sharp corners.
 Rounded corners can be specified using the arcWidth and arcHeight variables. "
shared class Rectangle(
	shared Dimension dimension = [0.0, 0.0],
	shared Float arcWidth = 0.0,
	shared Float arcHeight = 0.0,
	Paint fill = white,
	Boolean smooth = true,
	Float strokeDashOffset = 0.0,
	StrokeLineCap strokeLineCap = squareLineCap,
	StrokeLineJoin strokeLineJoin = miterLineJoin,
	Float strokeMiterLimit = 10.0,
	Paint? stroke = black,
	StrokeType strokeType = centeredStroke,
	Float strokeWidth = 1.0)
		extends Shape<JRect>(
		fill, smooth, strokeDashOffset, strokeLineCap, strokeLineJoin,
		strokeMiterLimit, stroke, strokeType, strokeWidth) {
	
	shared actual JRect delegate {
		value actual = JRect();
		actual.width = dimension[0];
		actual.height = dimension[1];
		actual.x = location[0];
		actual.y = location[1];
		actual.arcWidth = arcWidth;
		actual.arcHeight = arcHeight;
		transferProperties(this, actual);
		return actual;
	}
	
}
