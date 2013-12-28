import ceylon.test {
	...
}

import ceylonfx.binding {
	bindConverting
}
import ceylonfx.scene.paint { red }
import ceylonfx.scene.control { CheckBox2 }

shared test void selectedIsBounded() {
	value checkBox = CheckBox2(true);
	assertTrue(checkBox.selectedProperty.get);
	
	value checkBox2 = CheckBox2(false);
	assertFalse(checkBox2.selectedProperty.get);
	checkBox2.selectedProperty.set(true);
	assertTrue(checkBox2.selectedProperty.get);
	variable Boolean bool = false;
	Anything run(Boolean val) => bool = true;
	checkBox2.selectedProperty.onChange(run);
	checkBox2.selectedProperty.set(false);
	assertTrue(bool);
	
}



