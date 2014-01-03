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
	insetsWrappedProperty, Point3D, Location
}
import ceylonfx.scene {
	Parent, Node, CacheHint, Cursor, DepthTest
}

import javafx.scene.layout {
	JRegion=Region {\iUSE_COMPUTED_SIZE, \iUSE_PREF_SIZE}
}
import ceylonfx.scene.effect { BlendMode, Effect }
import javafx.scene { JNode=Node }

shared Float useComputedSize = \iUSE_COMPUTED_SIZE;

shared Float usePrefSize = \iUSE_PREF_SIZE;

shared abstract class Region<out Delegate>(
	
	// From  CeylonFxAdapter
	Delegate delegate,
	
	// From Node
	String|Unset id = unset,
	String|Unset style = unset,
	BlendMode|Unset blendMode = unset,
	CacheHint|Unset cacheHint = unset,
	Node<JNode>|Unset clip = unset,
	Cursor|Unset cursor = unset,
	DepthTest|Unset depthTest = unset,
	Effect|Unset effect = unset,
	Boolean|Unset focusTraversable = unset,
	Location|Unset location = unset,
	Boolean|Unset managed = unset,
	Boolean|Unset mouseTransparent = unset,
	Boolean|Unset pickOnBounds = unset,
	Float|Unset rotate = unset,
	Point3D|Unset rotationAxis = unset,
	[Float, Float, Float]|Unset scale = unset,
	[Float, Float, Float]|Unset translate = unset,
	Boolean|Unset visible = true,
	
	// From Region
	Float|Unset maxHeight = unset,
	Float|Unset minHeight = unset,
	Float|Unset prefHeight = unset,
	Float|Unset maxWidth = unset,
	Float|Unset minWidth = unset,
	Float|Unset prefWidth = unset,
	Insets|Unset padding = unset,
	Boolean|Unset snapToPixel = unset) 
		
		extends Parent<Delegate>(delegate, id, style,blendMode, cacheHint, clip, cursor,
		depthTest, effect, focusTraversable, location, managed, mouseTransparent,
		pickOnBounds, rotate, rotationAxis, scale, translate, visible)

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