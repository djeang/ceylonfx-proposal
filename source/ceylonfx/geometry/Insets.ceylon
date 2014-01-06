import javafx.geometry { JInsets=Insets}
import ceylonfx.binding { JavaWrappedProperty, Unset, JObjectProp, unset, JavaWrappedReadOnlyProperty, Property, ReadableProperty }
import javafx.beans.\ivalue { JObservableValue=ObservableValue }

"A set of inside offsets for the 4 side of a rectangular area"
shared class Insets(
	shared Float top = 0.0,
	shared Float right = 0.0,
	shared Float bottom = 0.0,
	shared Float left = 0.0) {
	
	shared JInsets delegate => JInsets(top, right, bottom, left);
	
}


shared ReadableProperty<Insets> insetsWrappedReadOnlyProperty(JObservableValue<JInsets> jprop) {
	Insets fromJava(JInsets jInsets) {
		return Insets(jInsets.top, jInsets.right, jInsets.bottom, jInsets.left);
	}
	return JavaWrappedReadOnlyProperty(jprop, fromJava);
}

shared Property<Insets> insetsWrappedProperty(JObjectProp<JInsets> jprop, Insets|Unset initValue = unset) {
	Insets fromJava(JInsets jInsets) {
		return Insets(jInsets.top, jInsets.right, jInsets.bottom, jInsets.left);
	}
	return JavaWrappedProperty(jprop, Insets.delegate, fromJava, initValue);
}