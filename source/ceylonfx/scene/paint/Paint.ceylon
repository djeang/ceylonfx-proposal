import ceylonfx.application {
	CeylonFxAdapter
}
import ceylonfx.binding {
	Unset,
	JObjectProp,
	JavaWrappedProperty,
	unset,
	Property
}
import ceylonfx.geometry {
	Location,
	Dimension
}
import ceylonfx.utils {
	paintJ2C
}

import javafx.scene.image {
	Image
}
import javafx.scene.paint {
	JCycleMethod=CycleMethod,
	JStop=Stop,
	JLinearGrad=LinearGradient,
	JRadialGrad=RadialGradient,
	JImagePattern=ImagePattern,
	JPaint=Paint
}

shared alias Stop => [Float, Color];

shared abstract class Paint(JPaint delegate) 
		extends CeylonFxAdapter<JPaint>(delegate) {}

shared abstract class CycleMethod(shared JCycleMethod type)
        of noCycle|reflectCycle|repeatCycle {
    string=>type.string;
}
shared object noCycle extends CycleMethod(JCycleMethod.\iNO_CYCLE) {}
shared object repeatCycle extends CycleMethod(JCycleMethod.\iREPEAT) {}
shared object reflectCycle extends CycleMethod(JCycleMethod.\iREFLECT) {}

{JStop*} jStops({Stop*} stops)
		=> { for (elem in stops) JStop(elem[0], elem[1].delegate) };

JPaint jDelegate(Location start, Location end, Boolean proportional, CycleMethod cycleMethod,{Stop*} stops ) {
 return JLinearGrad(
	start[0], start[1],
	end[0], end[1], 
	proportional, 
	cycleMethod.type, 
	*jStops(stops));
 }

shared class LinearGradient(
	Location start = [0.0, 0.0],
	Location end = [1.0, 0.0], 
	Boolean proportional = true,
	CycleMethod cycleMethod = noCycle, 
	{Stop*} stops = 
			{[0.0, white], [1.0, yellow]})
		extends Paint(delegate) {
	
	
	
	
}

shared class RadialGradient(
	Float focusAngle = 0.0, 
	Float focusDistance = 0.0, 
	Location center = [0.0, 0.0], 
	Float radius = 1.0, 
	Boolean proportional = true,
	CycleMethod cycleMethod = noCycle, 
	{Stop*} stops = 
			{[0.0, white], [1.0, yellow]}) 
		extends Paint() {
	
	delegate => JRadialGrad(
		focusAngle, focusDistance,
		center[0], center[1], radius,
		proportional,
		cycleMethod.type, 
		*jStops(stops));
	
}

shared class ImagePattern(
	Image image, 
	Location anchorLocation = [0.0, 0.0],
	Dimension anchorDimension = [1.0, 1.0],
	Boolean proportional = true)
		extends Paint() {
	
	delegate => JImagePattern(
		image,
		anchorLocation[0], anchorLocation[1],
		anchorDimension[0], anchorDimension[1],
		proportional);
	
}

shared Property<Paint> paintWrappedProperty(JObjectProp<JPaint> jProp, Paint|Unset initValue = unset) {
	return JavaWrappedProperty(jProp, Paint.delegate, paintJ2C.convert, initValue);
}
