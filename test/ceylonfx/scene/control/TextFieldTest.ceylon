import ceylon.test {
	...
}

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



