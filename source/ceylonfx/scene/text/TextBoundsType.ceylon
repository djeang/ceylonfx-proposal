import ceylonfx.binding { JavaWrappedProperty, Unset, JObjectProp, Property }
import javafx.scene.text { JTextBoundsType=TextBoundsType }

shared abstract class TextBoundsType(shared JTextBoundsType type)
		of logicalBounds|visualBounds|TextBoundTypeGeneric {
	string=>type.string;
}

shared object logicalBounds extends TextBoundsType(JTextBoundsType.\iLOGICAL) {}

shared object visualBounds extends TextBoundsType(JTextBoundsType.\iVISUAL) {}

class TextBoundTypeGeneric(JTextBoundsType delegate) extends TextBoundsType(delegate) {}

shared Property<TextBoundsType> textBoundTypeWrappedProperty(JObjectProp<JTextBoundsType> jProp, TextBoundsType|Unset init) {
	return JavaWrappedProperty(jProp, TextBoundsType.type, TextBoundTypeGeneric, init);
}
