import javafx.scene.text {
    JFont=Font,
    JFontPosture=FontPosture,
    JFontWeight=FontWeight
}
import ceylonfx.binding { Property, JObjectProp, Unset, unset, JavaWrappedProperty }

shared class Font(shared JFont delegate) {
   
   shared String name => delegate.name;
   
   shared Float size => delegate.size; 
   
   shared String familly => delegate.family;
    
}

shared Property<Font> fontWrappedProperty(JObjectProp<JFont> jProp, Font|Unset init = unset) {
	return JavaWrappedProperty(jProp, Font.delegate, Font, init);
}

shared Font font(
    String family = "System",
    Float size = 12.0,
    FontWeight weight = normal,
    FontPosture posture = regular
)
        => Font(JFont.font(family, 
                JFontWeight.findByWeight(weight.integer), 
                posture.italicized
                    then JFontPosture.\iITALIC 
                    else JFontPosture.\iREGULAR, 
                size));

shared Font defaultFont => Font(JFont.default);

shared class FontWeight(shared Integer integer) {
    string => integer.string;
}
shared FontWeight thin => FontWeight(100);
shared FontWeight extraLight => FontWeight(200);
shared FontWeight light => FontWeight(300);
shared FontWeight normal => FontWeight(400);
shared FontWeight medium => FontWeight(500);
shared FontWeight semiBold => FontWeight(600);
shared FontWeight bold => FontWeight(700);
shared FontWeight extraBold => FontWeight(800);
//shared FontWeight black => FontWeight(900);


shared abstract class FontPosture(shared Boolean italicized) of regular|italic {}
shared object regular extends FontPosture(false) {
    string => "regular";
}
shared object italic extends FontPosture(true) {
    string => "italic";
}
