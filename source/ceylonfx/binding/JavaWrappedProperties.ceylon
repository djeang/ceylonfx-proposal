import ceylon.interop.java {
        javaString
}

import ceylonfx.application.java {
        TypeConverter,
        CeylonListener,
        ListenerBridge {
                convertChangeListener=convert
        },
        Converters {
                toIntegerObjectProperty,
                toIntegerReadOnlyObjectProperty,
                toDoubleObjectProperty,
                toDoubleReadOnlyObjectProperty
        }
}
import ceylonfx.utils {
        booleanC2J,
        booleanJ2C,
        floatC2J,
        floatJ2C,
        integerC2J,
        integerJ2C,
        stringJ2C,
        doubleJ2C,
        doubleC2J
}

import java.lang {
        JBoolean=Boolean,
        JFloat=Float,
        JInteger=Integer,
        JString=String,
        JDouble=Double
}

import javafx.beans.property {
        JIntegerProperty=IntegerProperty,
        JDoubleProperty=DoubleProperty,
        JReadOnlyIntegerProperty=ReadOnlyIntegerProperty,
        JReadOnlyDoubleProperty=ReadOnlyDoubleProperty
}
import javafx.beans.\ivalue {
        JWritableValue=WritableValue,
        JObservableValue=ObservableValue,
        JChangeListener=ChangeListener
}


see (`value unset`)
by ("Djeang") 
shared abstract class Unset() of unset {}

"The unset value. This value is used to mention that the property value should remains 
 the default one of the wrapped javafx property. This value has been introduce to disambiguate  
 with the null value, which can be a valid one."
by ("Djeang")
shared object unset extends Unset() {}


"A ReadableProperty back-ended by a Javafx property. The instances do not hold state in themselves
 but just provide a Ceylon view of the underlying Javafx property."
by("Djeang")
shared class JavaWrappedReadOnlyProperty<CeylonType, JavaType>(jProperty, j2c)
                satisfies ReadableProperty<CeylonType> {
        
        JObservableValue<JavaType> jProperty;
        CeylonType(JavaType) j2c;
        
        shared actual CeylonType get {
                JObservableValue<JavaType> observableValue = jProperty;
                JavaType val = observableValue.\ivalue;
                return j2c(val);
        }
        
        shared actual void onChange(Anything(CeylonType) runOnChange) {
                object ceylonListener satisfies CeylonListener<CeylonType?> {
                        
                        shared actual void onChange(CeylonType? old, CeylonType? newValue ) {
                                if (exists newValue) {
                                        runOnChange(newValue);
                                }
                        }
                }  
                object j2cConverter satisfies TypeConverter<JavaType, CeylonType?> {
                        
                        shared actual CeylonType? convert(JavaType? from) {
                                if (exists from) {
                                        return j2c(from);
                                }
                                return null;
                        }
                        
                }
                JChangeListener<JavaType> changeListener = convertChangeListener(ceylonListener, j2cConverter);  
                jProperty.addListener(changeListener);
        }
        
}


"A Property back-ended by a Javafx property. The instances do not hold state in themselves
 but just provide a Ceylon view of the underlying Javafx property."
by("Djeang")
shared class JavaWrappedProperty<CeylonType, JavaType>(jProperty, c2j, j2c, initValue = unset)
        satisfies Property<CeylonType> {
        
        JObjectProp<JavaType> jProperty;
        JavaType(CeylonType) c2j;
        CeylonType(JavaType) j2c;
        CeylonType|Unset initValue;

        // Should leverage of mixins to un-duplicate code


        shared actual CeylonType get {
                JObservableValue<JavaType> observableValue = jProperty;
                JavaType val = observableValue.\ivalue;
                return j2c(val);
        }
        
        shared actual void set(CeylonType prop) {
                JWritableValue<JavaType> writableValue = jProperty;
                writableValue.\ivalue = c2j(prop);
        }

    if (!is Unset initValue) {
                this.set(initValue);
        }
        
        shared actual void onChange(Anything(CeylonType) runOnChange) {
                object ceylonListener satisfies CeylonListener<CeylonType?> {

                        shared actual void onChange(CeylonType? old, CeylonType? newValue ) {
                                if (exists newValue) {
                                        runOnChange(newValue);
                                }
                        }
                }  
                object j2cConverter satisfies TypeConverter<JavaType, CeylonType?> {

                        shared actual CeylonType? convert(JavaType? from) {
                                if (exists from) {
                                        return j2c(from);
                                }
                                return null;
                        }
                        
                }
                JChangeListener<JavaType> changeListener = convertChangeListener(ceylonListener, j2cConverter);  
                jProperty.addListener(changeListener);
        }
        
}

shared class JavaOptionalWrappedProperty<CeylonType, JavaType>(jProperty, c2j, j2c, initValue = unset)
                satisfies Property<CeylonType?> {
        
        JObjectProp<JavaType> jProperty;
        JavaType(CeylonType) c2j;
        CeylonType(JavaType) j2c;
        CeylonType?|Unset initValue;
        
        // Should leverage of mixins to un-duplicate code
        
        
        shared actual CeylonType? get {
                JObservableValue<JavaType> observableValue = jProperty;
                JavaType? val = observableValue.\ivalue;
                if (exists val) {
                        return j2c(val);
                }
                return null;
        }
        
        shared actual void set(CeylonType? prop) {
                JWritableValue<JavaType> writableValue = jProperty;
                if (exists prop) {
                        writableValue.\ivalue = c2j(prop);
                } else {
                        writableValue.\ivalue = null;
                }
        }
        
        if (!is Unset initValue) {
                this.set(initValue);
        }
        
        shared actual void onChange(Anything(CeylonType?) runOnChange) {
                object ceylonListener satisfies CeylonListener<CeylonType?> {
                        
                        shared actual void onChange(CeylonType? old, CeylonType? newValue ) {
                                if (exists newValue) {
                                        runOnChange(newValue);
                                }
                        }
                }  
                object j2cConverter satisfies TypeConverter<JavaType, CeylonType?> {
                        
                        shared actual CeylonType? convert(JavaType? from) {
                                if (exists from) {
                                        return j2c(from);
                                }
                                return null;
                        }
                        
                }
                JChangeListener<JavaType> changeListener = convertChangeListener(ceylonListener, j2cConverter);  
                jProperty.addListener(changeListener);
        }
        
}


shared alias JObjectProp<JavaType> => JWritableValue<JavaType>&JObservableValue<JavaType>;

shared JavaWrappedProperty<Boolean, JBoolean> booleanWrappedProperty(JObjectProp<JBoolean> jProp, Boolean|Unset initValue = unset) {
        return  JavaWrappedProperty(jProp, booleanC2J.convert, booleanJ2C.convert, initValue);
}

shared JavaWrappedReadOnlyProperty<Boolean, JBoolean> booleanReadOnlyWrappedProperty(JObservableValue<JBoolean> jProp) {
        return  JavaWrappedReadOnlyProperty(jProp, booleanJ2C.convert);
}

shared JavaWrappedProperty<Float, JFloat> floatWrappedProperty(JObjectProp<JFloat> jProp, Float|Unset initValue = unset) {
        return  JavaWrappedProperty(jProp, floatC2J.convert, floatJ2C.convert, initValue);
}

shared JavaWrappedProperty<Integer, JInteger> integerWrappedProperty(JObjectProp<JInteger>|JIntegerProperty jProp, Integer|Unset initValue = unset) {
        JObjectProp<JInteger> prop;
        switch (jProp)
        case (is JIntegerProperty) {
                prop = toIntegerObjectProperty(jProp);
        }
        case (is JObjectProp<JInteger>) {
                prop = jProp;
        }
        return  JavaWrappedProperty(prop, integerC2J.convert, integerJ2C.convert, initValue);
}

shared JavaWrappedReadOnlyProperty<Integer, JInteger> integerReadOnlyWrappedProperty(JObservableValue<JInteger>|JReadOnlyIntegerProperty jProp) {
        JObservableValue<JInteger> prop;
        switch (jProp)
        case (is JReadOnlyIntegerProperty) {
                prop = toIntegerReadOnlyObjectProperty(jProp);
        }
        case (is JObservableValue<JInteger>) {
                prop = jProp;
        }
        return JavaWrappedReadOnlyProperty(prop, integerJ2C.convert);
}

shared JavaWrappedProperty<Float, JDouble> doubleWrappedProperty(JObjectProp<JDouble>|JDoubleProperty jProp, Float|Unset initValue = unset) {
        JObjectProp<JDouble> prop;
        switch (jProp)
        case (is JDoubleProperty) {
                prop = toDoubleObjectProperty(jProp);
        }
        case (is JObjectProp<JDouble>) {
                prop = jProp;
        }
        return  JavaWrappedProperty(prop, doubleC2J.convert, doubleJ2C.convert, initValue);
}

shared JavaWrappedReadOnlyProperty<Float, JDouble> doubleReadOnlyWrappedProperty(JObservableValue<JDouble>|JReadOnlyDoubleProperty jProp) {
        JObservableValue<JDouble> prop;
        switch (jProp)
        case (is JReadOnlyDoubleProperty) {
                prop = toDoubleReadOnlyObjectProperty(jProp);
        }
        case (is JObservableValue<JDouble>) {
                prop = jProp;
        }
        return JavaWrappedReadOnlyProperty(prop, doubleJ2C.convert);
}

shared JavaWrappedProperty<String, JString> stringWrappedProperty(JObjectProp<JString> jProp, String|Unset initValue = unset) {
        return  JavaWrappedProperty(jProp, javaString, stringJ2C.convert, initValue);
}

shared JavaWrappedReadOnlyProperty<String, JString> stringReadOnlyWrappedProperty(JObservableValue<JString> jProp) {
        return  JavaWrappedReadOnlyProperty(jProp, stringJ2C.convert);
}
