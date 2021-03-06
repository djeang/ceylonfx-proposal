import ceylon.interop.java {
	javaString
}

import ceylonfx.application.java {
	TypeConverter
}

import java.lang {
	Runnable,
	Bool=Boolean,
	JString=String,
	JFloat=Float,
	JInt=Integer,
	JDouble=Double
}
import java.util.concurrent {
	CountDownLatch
}

import javafx.application {
	Platform
}

shared object booleanC2J satisfies TypeConverter<Boolean, Bool> {
	shared actual Bool convert(Boolean from) => from then Bool.\iTRUE else Bool.\iFALSE;
}

shared object booleanJ2C satisfies TypeConverter<Bool, Boolean> {
	shared actual Boolean convert(Bool from) => from === Bool.\iTRUE then true else false;
}

shared object stringC2J satisfies TypeConverter<String, JString> {
	shared actual JString convert(String from) => javaString(from);
}

shared object stringJ2C satisfies TypeConverter<JString, String> {
	shared actual String convert(JString from) => from.string;
}

shared object integerC2J satisfies TypeConverter<Integer, JInt> {
	shared actual JInt convert(Integer from) => JInt(from);
}

shared object integerJ2C satisfies TypeConverter<JInt, Integer> {
	shared actual Integer convert(JInt from) => from.intValue();
}

shared object floatC2J satisfies TypeConverter<Float, JFloat> {
	shared actual JFloat convert(Float from) => JFloat(from);
}

shared object floatJ2C satisfies TypeConverter<JFloat, Float> {
	shared actual Float convert(JFloat from) => from.floatValue();
}

shared object doubleC2J satisfies TypeConverter<Float, JDouble> {
	shared actual JDouble convert(Float from) => JDouble(from);
}

shared object doubleJ2C satisfies TypeConverter<JDouble, Float> {
	shared actual Float convert(JDouble from) => from.doubleValue();
}



shared TypeConverter<JavaType, CeylonType> asTypeConverter<JavaType, CeylonType>(
	CeylonType transform(JavaType? from)) {
	object converter satisfies TypeConverter<JavaType, CeylonType> { 
		shared actual CeylonType convert(JavaType? from) => transform(from);
	}
	return converter;
}

shared Value? doInFxThread<Value>(Value toRun(Object* args)) {
	variable Value? result = null;
	CountDownLatch latch = CountDownLatch(1);
	object runnable satisfies Runnable {
		shared actual void run() {
			result = toRun();
			latch.countDown();
		}
	}
	Platform.runLater(runnable);
	latch.await();
	return result;
}

shared Runnable asRunnable(Anything toRun(Object* args)) {
	object runnable satisfies Runnable {
		shared actual void run() { toRun(); }
	}
	return runnable;
}

shared Boolean nullSafeEquals(Anything item1, Anything item2) {
	if (exists item1, exists item2) {
		return item1 == item2;
	} else {
		return (item1 exists) == (item2 exists);
	}
}

shared class LazyValue<Type>(Type() provider, variable Type? cache = null) {
	
	
	shared Type get() {
		value candidate = cache; 
		if (exists candidate) {
			return candidate;
		}
		value result = provider();
		cache = result; 
		return result;
	}

}