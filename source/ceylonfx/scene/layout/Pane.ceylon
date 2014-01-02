import ceylonfx.binding {
	Unset,
	unset
}
import ceylonfx.geometry {
	Insets
}

import javafx.scene.layout {
	JPane=Pane
}
shared abstract class Pane<out Delegate>(
	
	// From Region
	Delegate delegate,
	Float|Unset maxHeight = unset,
	Float|Unset minHeight = unset,
	Float|Unset prefHeight = unset,
	Float|Unset maxWidth = unset,
	Float|Unset minWidth = unset,
	Float|Unset prefWidth = unset,
	Insets|Unset padding = unset,
	Boolean|Unset snapToPixel = unset) 
		extends Region<Delegate>(delegate, maxHeight, minHeight, prefHeight, 
		maxWidth, minWidth, prefWidth, padding, snapToPixel)
		given Delegate satisfies JPane {
	
}