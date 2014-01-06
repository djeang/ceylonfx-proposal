import ceylon.test {
	...
}

shared test void selectedIsBounded() {
	value checkBox = CheckBox{selected = true;};
	assertTrue(checkBox.selectedProperty.get);
	
	value checkBox2 = CheckBox{selected = false;};
	assertFalse(checkBox2.selectedProperty.get);
	checkBox2.selectedProperty.set(true);
	assertTrue(checkBox2.selectedProperty.get);
	variable Boolean bool = false;
	Anything run(Boolean val) => bool = true;
	checkBox2.selectedProperty.onChange(run);
	checkBox2.selectedProperty.set(false);
	assertTrue(bool);
	
}



