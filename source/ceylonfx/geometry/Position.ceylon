import javafx.geometry {
	HPos,
	Pos,
	VPos
}
import ceylonfx.binding { JObjectProp, Unset, unset, JavaWrappedProperty, Property}



shared abstract class HorizontalPosition(shared HPos hpos)
		of horizontalCenter|horizontalLeft|horizontalRight|HorizontalPositionGeneric {
	string=>hpos.string;
}
shared object horizontalCenter 
		extends HorizontalPosition(HPos.\iCENTER) {}
shared object horizontalLeft
		extends HorizontalPosition(HPos.\iLEFT) {}
shared object horizontalRight
		extends HorizontalPosition(HPos.\iRIGHT) {}
class HorizontalPositionGeneric(HPos delegate) extends HorizontalPosition(delegate) {}
shared Property<HorizontalPosition> horizontalpositionWrappedProperty(JObjectProp<HPos> pos, HorizontalPosition|Unset init = unset) {
	return JavaWrappedProperty(pos, HorizontalPosition.hpos, HorizontalPositionGeneric, init);
}


shared abstract class VerticalPosition(shared VPos vpos)
		of verticalBaseline|verticalCenter|verticalBottom|verticalTop|VertivalPositionGeneric {
	string=>vpos.string;
}

shared object verticalBaseline
		extends VerticalPosition(VPos.\iBASELINE) {}
shared object verticalCenter 
		extends VerticalPosition(VPos.\iCENTER) {}
shared object verticalBottom
		extends VerticalPosition(VPos.\iBOTTOM) {}
shared object verticalTop
		extends VerticalPosition(VPos.\iTOP) {}
class VertivalPositionGeneric(VPos delegate) extends VerticalPosition(delegate) {}
shared Property<VerticalPosition> verticalpositionWrappedProperty(JObjectProp<VPos> pos, VerticalPosition|Unset init = unset) {
	return JavaWrappedProperty(pos, VerticalPosition.vpos, VertivalPositionGeneric, init);
}

shared abstract class Position(
	shared HorizontalPosition hPosition,
	shared VerticalPosition vPosition)
		of topLeft|topCenter|topRight|
		centerLeft|center|centerRight|
		bottomLeft|bottomCenter|bottomRight|Delegate {
	shared formal Pos pos;
}

shared object topLeft extends Position(horizontalLeft, verticalTop) {
	pos => Pos.\iTOP_LEFT;
}
shared object topCenter extends Position(horizontalCenter, verticalTop) {
	pos => Pos.\iTOP_CENTER;
}
shared object topRight extends Position(horizontalRight, verticalTop) {
	pos => Pos.\iTOP_RIGHT;
}
shared object centerLeft extends Position(horizontalLeft, verticalCenter) {
	pos => Pos.\iCENTER_LEFT;
}
shared object center extends Position(horizontalCenter, verticalCenter) {
	pos => Pos.\iCENTER;
}
shared object centerRight extends Position(horizontalRight, verticalCenter) {
	pos => Pos.\iCENTER_RIGHT;
}
shared object bottomLeft extends Position(horizontalLeft, verticalBottom) {
	pos => Pos.\iBOTTOM_LEFT;
}
shared object bottomCenter extends Position(horizontalCenter, verticalBottom) {
	pos => Pos.\iBOTTOM_CENTER;
}
shared object bottomRight extends Position(horizontalRight, verticalBottom) {
	pos => Pos.\iBOTTOM_RIGHT;
}
class Delegate(Pos jPos) extends Position(horizontalRight, verticalBottom) {
	pos => jPos;
} 

shared alias Location => [Float, Float];
shared alias Dimension => [Float, Float];

shared Property<Position> positionWrappedProperty(JObjectProp<Pos> jProp, Position|Unset initValue = unset) {
	Position j2c(Pos jPos) {
		return Delegate(jPos);
	}
	return JavaWrappedProperty(jProp, Position.pos, j2c, initValue);

}