import ceylonfx.application.java { TypeConverter, CeylonListener, 
	ListenerBridge {
		convert
	} 
}
import javafx.beans.\ivalue { 
	JWritableValue = WritableValue,
	JObservableValue = ObservableValue, 
	JChangeListener = ChangeListener
}
import java.lang { 
	JBoolean = Boolean, JFloat=Float, JInteger=Integer, JString = String }
	
import ceylonfx.utils { booleanC2J, booleanJ2C, floatC2J, floatJ2C, integerC2J, integerJ2C, stringC2J, stringJ2C }
import ceylonfx.binding { Property, Writable }


shared class WrappedProperty<CeylonType, JavaType>(jProperty, c2j, j2c)
	satisfies Property<CeylonType>&Writable<CeylonType> {
	
	JObjectProp<JavaType> jProperty;
	TypeConverter<CeylonType, JavaType> c2j;
	TypeConverter<JavaType, CeylonType> j2c;
	
	CeylonType getValue() {
		JWritableValue<JavaType> writableValue = jProperty;
		return j2c.convert(writableValue.\ivalue);
	}

	shared actual CeylonType get => getValue();
	
	shared actual void set(CeylonType prop) {
		JWritableValue<JavaType> writableValue = jProperty;
		writableValue.\ivalue = c2j.convert(prop);
	}
	
	shared actual void onChange(Anything(CeylonType) runOnChange) {
		object ceylonListener satisfies CeylonListener<CeylonType> {

			shared actual void onChange(CeylonType? old, CeylonType? newValue ) {
				if (exists newValue) {
					runOnChange(newValue);
				}
			}
		}  
		JChangeListener<JavaType> changeListener = convert(ceylonListener, j2c);  
		jProperty.addListener(changeListener);
	}
	
	shared WrappedProperty<CeylonType, JavaType> init(CeylonType initValue) {
		this.set(initValue);
		return this;
	}
	
}

shared alias ObjectProp<Prop> => Property<Prop>&Writable<Prop>;

shared alias JObjectProp<JavaType> => JWritableValue<JavaType>&JObservableValue<JavaType>;

shared WrappedProperty<Boolean, JBoolean> booleanWrappedProperty(JObjectProp<JBoolean> jProp, Boolean? initValue = null) {
	value result = WrappedProperty(jProp, booleanC2J, booleanJ2C);
	if (exists initValue) {return result.init(initValue);}
	return result;
} 

shared WrappedProperty<Float, JFloat> floatWrappedProperty(JObjectProp<JFloat> jProp, Float? initValue = null) {
	value result =  WrappedProperty(jProp, floatC2J, floatJ2C);
	if (exists initValue) {return result.init(initValue);}
	return result;
}

shared WrappedProperty<Integer, JInteger> integerWrappedProperty(JObjectProp<JInteger> jProp, Integer? initValue = null) {
	value result =  WrappedProperty(jProp, integerC2J, integerJ2C);
	if (exists initValue) {return result.init(initValue);}
	return result;
}

shared WrappedProperty<String, JString> stringWrappedProperty(JObjectProp<JString> jProp, String? initValue = null) {
	value result =  WrappedProperty(jProp, stringC2J, stringJ2C);
	if (exists initValue) {return result.init(initValue);}
	return result;
}
