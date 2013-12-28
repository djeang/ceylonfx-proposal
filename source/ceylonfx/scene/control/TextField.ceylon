import ceylonfx.binding {
	Unset,
	unset
}
import ceylonfx.geometry {
	Position
}

import javafx.scene.control {
	JTextField=TextField
}

shared class TextField (
	Position|Unset position = unset,
	Anything(TextField)|Unset onAction = unset, 
	Integer|Unset prefColumCount = unset) 
		extends TextInputControl() {
	
	
	shared actual JTextField delegate = JTextField();
		
	//shared ObjectProp<Position> alignementProperty;
	//shared ObjectProperty<Integer> prefColumnCount = integerP 
	
}


