import ceylonfx.binding { JavaWrappedProperty, Unset, JObjectProp, unset, Property }
import javafx.scene.text { JTextAlignment=TextAlignment }

shared abstract class TextAlignment(shared JTextAlignment type)
		of center|justify|left|right|TextAlignmentGeneric {
	string=>type.string;
}
shared object center extends TextAlignment(JTextAlignment.\iCENTER) {}
shared object justify extends TextAlignment(JTextAlignment.\iJUSTIFY) {}
shared object left extends TextAlignment(JTextAlignment.\iLEFT) {}
shared object right extends TextAlignment(JTextAlignment.\iRIGHT) {}

class TextAlignmentGeneric(JTextAlignment delegate) extends TextAlignment(delegate) {}
shared Property<TextAlignment> textAlignementWrappedProperty(JObjectProp<JTextAlignment> jProp, TextAlignment|Unset init = unset) {
	return JavaWrappedProperty(jProp, TextAlignment.type, TextAlignmentGeneric, init);
}