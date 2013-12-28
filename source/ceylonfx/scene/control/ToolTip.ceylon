import javafx.scene.control { JTooltip = Tooltip}
import ceylonfx.binding { Property, JObjectProp, JavaWrappedProperty, stringWrappedProperty, Unset, unset }
import ceylonfx.application.java { TypeConverter }

shared class Tooltip(
	JTooltip? wrapped = null, 
	String|Unset text = unset) {

	shared JTooltip delegate;
	if (exists wrapped) {
		delegate = wrapped;
	} else {
		delegate = JTooltip();
	}

	shared Property<String> textProperty = stringWrappedProperty(delegate.textProperty(), text);
	
}

shared object tooltipJ2C satisfies TypeConverter<JTooltip, Tooltip> {
	shared actual Tooltip convert(JTooltip from) => Tooltip(from);
} 

shared JavaWrappedProperty<Tooltip, JTooltip> tooltipWrappedProperty(JObjectProp<JTooltip> jProp, Tooltip|Unset initValue) {
	return  JavaWrappedProperty(jProp, Tooltip.delegate, tooltipJ2C.convert, initValue);
}