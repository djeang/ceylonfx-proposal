import javafx.scene.control { JControl = Control }

import ceylonfx.application { CeylonFxAdapter }
import ceylonfx.binding { Unset, unset, Property, ReadableProperty, doubleReadOnlyWrappedProperty, doubleWrappedProperty }

shared abstract class Control(
	JControl delegate,
		
	// TODO ContextMenu
	Float|Unset maxHeight = unset,
	Float|Unset maxWidth = unset,
	Float|Unset minHeight = unset,
	Float|Unset minWidth = unset,
	Float|Unset prefHeight = unset,
	Float|Unset prefWidth = unset,
	// TODO skin
	Tooltip|Unset tooltip = unset
	
) extends CeylonFxAdapter<JControl>(delegate) {
	
	shared ReadableProperty<Float> heightProperty = doubleReadOnlyWrappedProperty(delegate.heightProperty()) ;
	shared Property<Float> maxHeightProperty = doubleWrappedProperty(delegate.maxHeightProperty(), maxHeight);
	shared Property<Float> maxWidthProperty = doubleWrappedProperty(delegate.maxWidthProperty(), maxWidth);
	shared Property<Float> minHeightProperty = doubleWrappedProperty(delegate.minHeightProperty(), minHeight);
	shared Property<Float> minWidthProperty = doubleWrappedProperty(delegate.minWidthProperty(), minWidth);
	shared Property<Float> prefHeightProperty = doubleWrappedProperty(delegate.prefHeightProperty(), prefHeight);
	shared Property<Float> prefWidthProperty = doubleWrappedProperty(delegate.prefWidthProperty(), prefWidth);
	// TODO skin
	shared Property<Tooltip> tooltipProperty = tooltipWrappedProperty(delegate.tooltipProperty(), tooltip);
	shared ReadableProperty<Float> widthProperty = doubleReadOnlyWrappedProperty(delegate.widthProperty()) ;
}