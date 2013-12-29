import ceylonfx.utils { nullSafeEquals }


shared interface ReadableProperty<out Prop> {
	"Gets the value of this property."
	shared formal Prop get;
	
	"On change of the value of this property, the given function will be invoked."
	shared formal void onChange(Anything(Prop) runOnChange);
	
}


shared interface WritableValue<in Prop> {
	
	"Sets the value of this property."
	shared formal void set(Prop prop);
	
}

shared interface Property<Prop> satisfies ReadableProperty<Prop>&WritableValue<Prop> {}

"""A read/write property.
   It can be exposed as a read-only [[ReadableProperty]] or a write-only [[WritableValue]].
   """
shared class ObjectProperty<Prop>(Prop prop)
		satisfies Property<Prop> {

	variable Prop property = prop;
	variable {Anything(Prop)*} toNotify = {};
	
	get => property;
	
	shared actual void set(Prop prop) {
		if (nullSafeEquals(property, prop)) { return; }
		property = prop;
		for (notify in toNotify) {
			notify(prop);
		}
	}
	
	shared actual void onChange(Anything(Prop) runOnChange) {
		toNotify = toNotify.chain({ runOnChange });
		runOnChange(get);
	}
	
}

shared alias BooleanProperty => ObjectProperty<Boolean>;
shared alias StringProperty => ObjectProperty<String>;
shared alias FloatProperty => ObjectProperty<Float>;
shared alias IntegerProperty => ObjectProperty<Integer>;

"Bind a [[ReadableProperty]] to a [[WritableValue]], so that the value of the Writable will be
 updated every time the Property's value is changed."
shared void bind<Prop>(ReadableProperty<Prop> from, WritableValue<Prop> to) {
	from.onChange((Prop from) => to.set(from));
}

"Bind a [[ReadableProperty]] to a [[WritableValue]], so that the value of the Writable will be
 updated every time the Property's value is changed, using the given transform."
shared void bindConverting<From, To>(ReadableProperty<From> from, WritableValue<To> to, To(From) transform) {
	from.onChange((From from) => to.set(transform(from)));
}

"Bind a [[ObjectProperty]] to another ObjectProperty, so that the value of either property is
 modified, the other property will also be updated."
shared void bindBidirectional<Prop>(ObjectProperty<Prop> prop1, ObjectProperty<Prop> prop2) {
	prop1.onChange(prop2.set);
	prop2.onChange(prop1.set);
}

"Bind a [[ObjectProperty]] to another ObjectProperty, so that the value of either property is
 modified, the other property will also be updated using the given transforms."
shared void bindConvertingBidirectional<Prop1, Prop2>(ObjectProperty<Prop1> prop1, ObjectProperty<Prop2> prop2,
Prop1(Prop2) transform1, Prop2(Prop1) transform2) {
	prop1.onChange((Prop1 from) => prop2.set(transform2(from)));
	prop2.onChange((Prop2 to) => prop1.set(transform1(to)));
}

"Use this class to create a binding between an [[ObjectProperty]] and a [[WritableValue]] property
 which can be passed as a constructor argument to certain CeylonFX containers.
 
 For example:
     Scene {
         fill = Binding(checkBox.selectedProperty -> ((Boolean sel) => sel then white else black));
         checkBox
     };
 "
shared class Binding<out From, out To>
        (ObjectProperty<From> -> To(From) bindEntry) {
	
	"Provide the property to bind to."
	shared void bind(WritableValue<To> to) {
		bindConverting(bindEntry.key, to, bindEntry.item);
	}
	
	shared From bindeeValue() {
		return bindEntry.key.get;
	}
	
}
