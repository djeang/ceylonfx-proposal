import javafx.scene.control { JTooltip = Tooltip}
import ceylonfx.binding { ObjectProp, JObjectProp, WrappedProperty, stringWrappedProperty }
import ceylonfx.application.java { TypeConverter }
import ceylonfx.utils { stringC2J, stringJ2C }


shared class Tooltip(JTooltip? wrapped = null, String text = "") {

	shared JTooltip delegate;
	if (exists wrapped) {
		delegate = wrapped;
	} else {
		delegate = JTooltip();
	}

	shared ObjectProp<String> textProperty = stringWrappedProperty(delegate.textProperty(), text);
	
}

shared object tooltipJ2C satisfies TypeConverter<JTooltip, Tooltip> {

	shared actual Tooltip convert(JTooltip from) => Tooltip(from);
	
} 

shared object tooltipC2C satisfies TypeConverter<Tooltip, JTooltip> {

	shared actual JTooltip convert(Tooltip from) => from.delegate;
	
}

shared WrappedProperty<Tooltip, JTooltip> tooltipWrappedProperty(JObjectProp<JTooltip> jProp, Tooltip? initValue) {
	value result =  WrappedProperty(jProp, tooltipC2C, tooltipJ2C);
	if (exists initValue) {return result.init(initValue);}
	return result;
 
}