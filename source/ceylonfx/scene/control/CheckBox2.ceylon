import ceylonfx.scene.paint {
	Paint,
	paintWrappedProperty,
	black
}

import javafx.scene.control {
	JCheckBox=CheckBox
}
import ceylonfx.binding { stringWrappedProperty, ObjectProp, booleanWrappedProperty }
import ceylonfx.application { CeylonFxAdapter }

shared class CheckBox2 (
	Boolean selected = false,
	String initialText = "",
	Boolean allowIndeterminate = false,
	Paint textFill = black,
	Tooltip? tooltip = null) 
		extends CeylonFxAdapter<JCheckBox>() {
	
	value jCheckBox = JCheckBox(initialText);
	shared actual JCheckBox delegate => jCheckBox;
		
	shared ObjectProp<Boolean> selectedProperty = booleanWrappedProperty(jCheckBox.selectedProperty(), selected);
	shared ObjectProp<Boolean> allowIndeterminateProperty = booleanWrappedProperty(jCheckBox.allowIndeterminateProperty(), allowIndeterminate);
	shared ObjectProp<Paint> textFillProperty = paintWrappedProperty(jCheckBox.textFillProperty(), textFill);
	shared ObjectProp<String> textProperty = stringWrappedProperty(jCheckBox.textProperty());
	shared ObjectProp<Tooltip> tooltipProperty = tooltipWrappedProperty(jCheckBox.tooltipProperty(), tooltip);
		
}


