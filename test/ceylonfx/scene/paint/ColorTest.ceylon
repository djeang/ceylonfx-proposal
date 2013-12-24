import ceylon.test { ... }

test void colorCanBeCreatedUsingHexaDecimal() {
	variable Color color = rgbHexa(#00_00_00);
	
	assertFloatsEqual(color.delegate.red, 0.0);
	assertFloatsEqual(color.delegate.green, 0.0);
	assertFloatsEqual(color.delegate.blue, 0.0);
	
	color = rgbHexa(#99_66_33);
	
	assertFloatsEqual(color.delegate.red, 0.6);
	assertFloatsEqual(color.delegate.green, 0.4);
	assertFloatsEqual(color.delegate.blue, 0.2);
	
	color = rgbHexa(#FF_FF_FF);
	
	assertFloatsEqual(color.delegate.red, 1.0);
	assertFloatsEqual(color.delegate.green, 1.0);
	assertFloatsEqual(color.delegate.blue, 1.0);
}

void assertFloatsEqual(Float actualValue, Float expectedValue, Float tolerance = 1.0u) {
	if ((actualValue - expectedValue).magnitude > tolerance) {
		throw AssertionComparisonException(
			"``actualValue`` is not equal to ``expectedValue``",
			actualValue.string, expectedValue.string);
	}
}


