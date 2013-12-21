import ceylonfx.application.java {
	TypeConverter
}

import ceylonfx.utils {
	paintJ2C
}

import javafx.scene.paint {
	JPaint=Paint
}
import ceylonfx.binding{ JObjectProp, WrappedProperty, ObjectProp }

shared object paintC2J satisfies TypeConverter<Paint, JPaint> {

	shared actual JPaint convert(Paint from) => from.delegate;

}

shared ObjectProp<Paint> paintWrappedProperty(JObjectProp<JPaint> jProp, Paint? initValue = null) {
	value result = WrappedProperty(jProp, paintC2J, paintJ2C);
	if (exists initValue) {return result.init(initValue);}
	return result;
}

