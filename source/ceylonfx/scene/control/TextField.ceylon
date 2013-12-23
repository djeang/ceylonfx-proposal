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

shared class TextField (
	Boolean selected = false,
	String initialText = "",
	Boolean allowIndeterminate = false,
	Paint textFill = black) 
		extends CeylonFxAdapter<JCheckBox>() {
	
	value delegate = JCheckBox(initialText);
		
	shared ObjectProp<Boolean> selectedProperty = booleanWrappedProperty(delegate.selectedProperty(), selected);
	shared ObjectProp<Boolean> allowIndeterminateProperty = booleanWrappedProperty(delegate.allowIndeterminateProperty(), allowIndeterminate);
	shared ObjectProp<Paint> textFillProperty = paintWrappedProperty(delegate.textFillProperty(), textFill);
	shared ObjectProp<String> textProperty = stringWrappedProperty(delegate.textProperty());

    // Here semantic is getDelegate
	shared actual JCheckBox createDelegate() => delegate;
		
}


