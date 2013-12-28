import ceylon.test {
	...
}

import ceylonfx.binding {
	bindConverting
}
import ceylonfx.scene.paint { red }
import ceylonfx.scene.control { CheckBox2 }

shared test void propertiesAreBounded() {
	TextField textField = TextField{
		prefColumCount = 8;
		text = "toto";
	};
	assertEquals(8, textField.prefColumnCountProperty.get);
	assertEquals("toto", textField.textProperty.get);
	textField.textProperty.set("uu");
	assertEquals("uu", textField.textProperty.get);	
}



