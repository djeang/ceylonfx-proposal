import ceylonfx.binding { JavaWrappedProperty, Unset, JObjectProp, Property }
import javafx.scene.text { JFontSmoothingType=FontSmoothingType }

shared abstract class FontSmoothingType(shared JFontSmoothingType type)
		of graySmoothing|lcdSmoothing|FontSmoothingGeneric {
	string=>type.string;
}
shared object lcdSmoothing extends FontSmoothingType(JFontSmoothingType.\iLCD) {}
shared object graySmoothing extends FontSmoothingType(JFontSmoothingType.\iGRAY) {}

class FontSmoothingGeneric(JFontSmoothingType delegate) extends FontSmoothingType(delegate) {}
shared Property<FontSmoothingType> fontSmoothingWrappedProperty(JObjectProp<JFontSmoothingType> jProp, FontSmoothingType|Unset init) {
	return JavaWrappedProperty(jProp, FontSmoothingType.type, FontSmoothingGeneric, init);
}
