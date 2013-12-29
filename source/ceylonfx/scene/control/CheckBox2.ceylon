import ceylonfx.application {
	CeylonFxAdapter
}
import ceylonfx.binding {
	stringWrappedProperty,
	Property,
	booleanWrappedProperty,
	Unset,
	unset
}
import ceylonfx.scene.paint {
	Paint,
	paintWrappedProperty
}

import javafx.scene.control {
	JCheckBox=CheckBox
}

shared class CheckBox2 (
	Boolean|Unset selected = unset,
	String|Unset text = unset,
	Boolean|Unset allowIndeterminate = unset,
	Paint|Unset textFill = unset,
	Tooltip|Unset tooltip = unset,
	JCheckBox delegate = JCheckBox()) 
		extends CeylonFxAdapter<JCheckBox>(delegate) {
	
	//shared actual JCheckBox delegate = jcheckbox;
		
	shared Property<Boolean> selectedProperty = booleanWrappedProperty(delegate.selectedProperty(), selected);
	shared Property<Boolean> allowIndeterminateProperty = booleanWrappedProperty(delegate.allowIndeterminateProperty(), allowIndeterminate);
	shared Property<Paint> textFillProperty = paintWrappedProperty(delegate.textFillProperty(), textFill);
	shared Property<String> textProperty = stringWrappedProperty(delegate.textProperty(), text);
	shared Property<Tooltip> tooltipProperty = tooltipWrappedProperty(delegate.tooltipProperty(), tooltip);
		
}


