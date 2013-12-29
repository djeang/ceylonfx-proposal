import ceylonfx.binding {
	Unset,
	unset, Property, integerWrappedProperty
}
import ceylonfx.geometry {
	Position, positionWrappedProperty
}

import javafx.scene.control {
	JTextField=TextField
}

shared class TextField (
	
	// From TextInputControl
	Boolean|Unset editable = unset,
	String|Unset promptText = unset,
	// TODO index range
	String|Unset text = unset,
	JTextField jfxComponent = JTextField(),
	
	// From TextField
	Position|Unset alignement = unset,
	Anything(TextField)|Unset onAction = unset, 
	Integer|Unset prefColumCount = unset,
	JTextField delegate = JTextField()) 
		extends TextInputControl(delegate, editable, promptText, text) {
		
	shared Property<Position> alignementProperty = positionWrappedProperty(delegate.alignmentProperty(), alignement);
	shared Property<Integer> prefColumnCountProperty = integerWrappedProperty(delegate.prefColumnCountProperty(), prefColumCount); 

	// TODO eventType implementation for onAction
	
}


