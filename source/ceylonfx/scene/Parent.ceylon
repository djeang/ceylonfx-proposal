import ceylonfx.binding {
	ReadableProperty,
	booleanReadOnlyWrappedProperty
}

import javafx.scene {
	JParent=Parent
}


shared abstract class Parent(JParent delegate) 
	extends Node(delegate) {

	shared ReadableProperty<Boolean> needsLayoutProperty = booleanReadOnlyWrappedProperty(delegate.needsLayoutProperty());

}