import ceylonfx.application {
	CeylonFxAdapter
}

import javafx.scene.control {
	JTextInputControl=TextInputControl
}
import ceylonfx.binding { Unset, unset, ReadableProperty, integerReadOnlyWrappedProperty, Property, stringWrappedProperty, booleanWrappedProperty, stringReadOnlyWrappedProperty }

shared abstract class TextInputControl(
	JTextInputControl delegate,
	Boolean|Unset editable = unset,
	String|Unset promptText = unset,
	String|Unset text = unset
) extends CeylonFxAdapter<JTextInputControl>(delegate) {
	
	 
	shared Property<String> textProperty = stringWrappedProperty(delegate.textProperty(), text);
	
	shared Property<String> promptTextProperty = stringWrappedProperty(delegate.promptTextProperty(), promptText);

	shared Property<Boolean> editableProperty = booleanWrappedProperty(delegate.editableProperty(), editable);
	
	shared ReadableProperty<Integer> anchorProperty = integerReadOnlyWrappedProperty(delegate.anchorProperty());
	
	shared ReadableProperty<Integer> caretPositionProperty = integerReadOnlyWrappedProperty(delegate.caretPositionProperty());
 
 	shared ReadableProperty<Integer> lengthProperty = integerReadOnlyWrappedProperty(delegate.lengthProperty());

	// TODO indexRange
	
	shared ReadableProperty<String> selectedTextProperty = stringReadOnlyWrappedProperty(delegate.selectedTextProperty());

}