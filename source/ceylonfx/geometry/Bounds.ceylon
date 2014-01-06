import ceylon.language {
	shared,
	abstract,
	Float
}

import ceylonfx.application {
	CeylonFxAdapter
}
import ceylonfx.binding {
	JObjectProp,
	Unset,
	unset,
	Property,
	JavaWrappedProperty,
	JavaWrappedReadOnlyProperty,
	ReadableProperty
}
import javafx.beans.\ivalue {
	JObservableValue=ObservableValue
}
import javafx.geometry {
	JBounds=Bounds,
	JBBox=BoundingBox
}


"The base class for objects that are used to describe the bounds of a node or other scene graph object."
shared abstract class Bounds<out Delegate = JBounds>(
	Delegate delegate,
	shared [Float, Float, Float] minimumCoordinates = [0.0, 0.0, 0.0],
	shared [Float, Float, Float] dimension3d = [0.0, 0.0, 0.0])
		extends CeylonFxAdapter<Delegate>(delegate)
		given Delegate satisfies JBounds {
	
	"Tests if the interior of this Bounds entirely contains the specified Bounds,
	 or if the coordinates [x, y] or [[Point3D]] is inside this Bounds."
	shared formal Boolean contains(Bounds<JBounds>|[Float, Float]|Point3D bounds);
	
	"Tests if the interior of this Bounds intersects the interior of the specified Bounds."
	shared formal Boolean intersects(Bounds<JBounds> bounds);
	
	"Indicates whether any of the dimensions(width, height or depth) of this bounds is less than zero."
	shared default Boolean empty => any({ for (coordinate in dimension3d) coordinate < 0.0 });

}


"A rectangular bounding box which is used to describe the bounds of a node or other scene graph object."
shared class BoundingBox(
			Location|Point3D|Null location, 
			Dimension|[Float, Float, Float]|Null dimension,
			JBBox delegate = delegateBBox(location, dimension))
		extends Bounds<JBBox>(delegate) {
	
	shared actual Boolean contains(Bounds<JBounds>|[Float, Float]|Point3D bounds) {
		switch(bounds)
		case (is Bounds<JBounds>) {
			return delegate.contains(bounds.delegate);
		}
		case (is [Float, Float]) {
			return delegate.contains(bounds[0], bounds[1]);
		}
		case (is Point3D) {
			return delegate.contains(bounds.x, bounds.y, bounds.z);
		}
	}
	
	shared actual Boolean intersects(Bounds<JBounds> bounds) {
		return delegate.intersects(bounds.delegate);
	}
	
}

JBBox delegateBBox(Location|Point3D|Null location, Dimension|[Float, Float, Float]|Null dimension) {
	assert (exists location, exists dimension);   // Should be call only when location and dimension are set
	switch(location)
	case (is Location) {
		if (exists depth = dimension[2]) {
			return JBBox(location[0], location[1], 0.0, dimension[0], dimension[1], depth);
		} else {
			return JBBox(location[0], location[1], dimension[0], dimension[1]);
		}
	}
	case (is Point3D) {
		if (exists depth = dimension[2]) {
			return JBBox(location.x, location.y, location.z, dimension[0], dimension[1], depth);
		} else {
			return JBBox(location.x, location.y, location.z, dimension[0], dimension[1], 0.0);
		}
	}
}

Bounds fromJBounds(JBounds jBounds) {
	switch(jBounds)
	case (is JBBox) {
		return BoundingBox(null, null, jBounds);
	} else {
		throw Exception("Unknown Bounds implementation");
	}
}

shared Property<Bounds> boundsWrappedProperty(JObjectProp<JBounds> jProp, Bounds|Unset initValue = unset) {
	return JavaWrappedProperty(jProp, Bounds<JBounds>.delegate, fromJBounds, initValue);
}

shared ReadableProperty<Bounds> boundsReadOnlyWrappedProperty(JObservableValue<JBounds> jProp) {
	return JavaWrappedReadOnlyProperty(jProp, fromJBounds);
}