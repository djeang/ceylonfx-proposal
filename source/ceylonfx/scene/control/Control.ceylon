import javafx.scene.control { JControl = Control }

import ceylonfx.application { CeylonFxAdapter }
import ceylonfx.binding { Unset, unset, Property, ReadableProperty, doubleReadOnlyWrappedProperty }

shared abstract class Control(
	// TODO ContextMenu
	Float|Unset maxHeight = unset,
	Float|Unset maxWidth = unset,
	Float|Unset minHeight = unset,
	Float|Unset minWidth = unset,
	Float|Unset prefHeight = unset,
	Float|Unset prefWidth = unset,
	// TODO skin
	Tooltip|Unset tooltip = unset 

) extends CeylonFxAdapter<JControl>() {
	
	//shared ReadableProperty<Float> heightProperty = doubleReadOnlyWrappedProperty(jProp) 

}