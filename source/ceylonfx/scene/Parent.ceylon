import ceylonfx.binding {
	ReadableProperty,
	booleanReadOnlyWrappedProperty
}

import javafx.scene {
	JParent=Parent
}


shared abstract class Parent<out Delegate>(Delegate delegate) 
	extends Node<Delegate>(delegate)
	given Delegate satisfies JParent {

	shared ReadableProperty<Boolean> needsLayoutProperty = booleanReadOnlyWrappedProperty(delegate.needsLayoutProperty());

}