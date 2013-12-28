import ceylonfx.application {
	CeylonFxAdapter
}

import javafx.scene.control {
	JTextInputControl=TextInputControl
}
import ceylonfx.binding { Unset, unset, ReadableProperty, integerReadOnlyWrappedProperty, Property, stringWrappedProperty, booleanWrappedProperty, stringReadOnlyWrappedProperty }

shared abstract class TextInputControl(
	JTextInputControl jfxComponent,
	Boolean|Unset editable = unset,
	String|Unset promptText = unset,
	String|Unset text = unset
) extends CeylonFxAdapter<JTextInputControl>() {
	
	 
	shared Property<String> textProperty = stringWrappedProperty(jfxComponent.textProperty(), text);
	
	shared Property<String> promptTextProperty = stringWrappedProperty(jfxComponent.promptTextProperty(), promptText);

	shared Property<Boolean> editableProperty = booleanWrappedProperty(jfxComponent.editableProperty(), editable);
	
	shared ReadableProperty<Integer> anchorProperty = integerReadOnlyWrappedProperty(jfxComponent.anchorProperty());
	
	shared ReadableProperty<Integer> caretPositionProperty = integerReadOnlyWrappedProperty(jfxComponent.caretPositionProperty());
 
 	shared ReadableProperty<Integer> lengthProperty = integerReadOnlyWrappedProperty(jfxComponent.lengthProperty());

	// TODO indexRange
	
	shared ReadableProperty<String> selectedTextProperty = stringReadOnlyWrappedProperty(jfxComponent.selectedTextProperty());

}