import ceylonfx.binding {
	doubleReadOnlyWrappedProperty,
	ReadableProperty,
	doubleWrappedProperty,
	unset,
	Unset,
	Property,
	booleanWrappedProperty
}
import ceylonfx.geometry {
	Insets,
	insetsWrappedProperty
}
import ceylonfx.scene {
	Parent
}

import javafx.scene.layout {
	JRegion=Region {\iUSE_COMPUTED_SIZE, \iUSE_PREF_SIZE}
}

shared Float useComputedSize = \iUSE_COMPUTED_SIZE;

shared Float usePrefSize = \iUSE_PREF_SIZE;

shared abstract class Region<out Delegate>(
	Delegate delegate,
	Float|Unset maxHeight = unset,
	Float|Unset minHeight = unset,
	Float|Unset prefHeight = unset,
	Float|Unset maxWidth = unset,
	Float|Unset minWidth = unset,
	Float|Unset prefWidth = unset,
	Insets|Unset padding = unset,
	Boolean|Unset snapToPixel = unset) 
		extends Parent<Delegate>(delegate)
		given Delegate satisfies JRegion {
	
	
	shared ReadableProperty<Float> heightProperty = doubleReadOnlyWrappedProperty(delegate.heightProperty());
	
	shared ReadableProperty<Float> widthProperty = doubleReadOnlyWrappedProperty(delegate.widthProperty());
	
	shared Property<Float> maxHeightProperty = doubleWrappedProperty(delegate.maxHeightProperty(), maxHeight);

	shared Property<Float> minHeightProperty = doubleWrappedProperty(delegate.minHeightProperty(), minHeight);

	shared Property<Float> maxWidthProperty = doubleWrappedProperty(delegate.maxWidthProperty(), maxWidth);

	shared Property<Float> minWidthProperty = doubleWrappedProperty(delegate.minWidthProperty(), minWidth);
	
	shared Property<Insets> paddingProperty = insetsWrappedProperty(delegate.paddingProperty(), padding);

	shared Property<Boolean> snapToPixelProperty = booleanWrappedProperty(delegate.snapToPixelProperty(), snapToPixel);


}