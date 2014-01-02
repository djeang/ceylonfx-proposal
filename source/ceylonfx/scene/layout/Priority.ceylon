import javafx.scene.layout {
	JPriority=Priority
}
import ceylonfx.binding { JObjectProp, Unset, unset, Property, JavaWrappedProperty }

"Enumeration used to determine the grow (or shrink) priority of a given node's
 layout area when its region has more (or less) space available and multiple nodes are competing for that space."
shared abstract class Priority(shared JPriority delegate)
	of always|never|sometimes|PriorityGeneric {}

class PriorityGeneric(JPriority delegate) extends Priority(delegate) {}

shared Property<Priority> priorityWrappedProperty(JObjectProp<JPriority> jprop, Priority|Unset init = unset) {
	return JavaWrappedProperty(jprop, Priority.delegate, PriorityGeneric, init);
}

shared object always extends Priority(JPriority.\iALWAYS) {}
shared object never extends Priority(JPriority.\iNEVER) {}
shared object sometimes extends Priority(JPriority.\iSOMETIMES) {}
