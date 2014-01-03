import ceylonfx.binding {
	Unset,
	unset
}
import ceylonfx.geometry {
	Position,
	Insets,
	Point3D,
	Location
}
import ceylonfx.scene {
	CacheHint,
	Cursor,
	DepthTest, Node
}
import ceylonfx.scene.effect {
	BlendMode,
	Effect
}


import javafx.scene.layout {
	JVBox=VBox
}

"VBox lays out its children in a single vertical column."
shared class VBox (
	
	// From  CeylonFxAdapter
	Delegate delegate = JVBox(),
	
	// From Node
	String|Unset id = unset,
	String|Unset style = unset,
	BlendMode|Unset blendMode = unset,
	CacheHint|Unset cacheHint = unset,
	Node|Unset clip = unset,
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
	Boolean|Unset snapToPixel = unset, 
	
	// From Pane
	{Node*}|Unset children = unset,
	
	// From VBox
	Position|Unset alignement = unset,
	Boolean|Unset fillWidth = unset,
	Float|Unset spacing = unset,
	Boolean|Unset vGrow = unset)

		extends Pane<Delegate>(delegate, id, style,blendMode, cacheHint, clip, cursor,
		depthTest, effect, focusTraversable, location, managed, mouseTransparent,
		pickOnBounds, rotate, rotationAxis, scale, translate, visible, maxHeight, minHeight, prefHeight, 
		maxWidth, minWidth, prefWidth, padding, snapToPixel, children)
		
		given Delegate satisfies JVBox {
	
	
	//shared actual JVBox delegate {
	//	value jvbox = JVBox();
	//	jvbox.spacing = spacing.float;
	//	jvbox.alignment = alignment.pos;
	//	if (exists minimumSize) { jvbox.setMinSize(*minimumSize); }
	//	if (exists preferredSize) { jvbox.setPrefSize(*preferredSize); }
	//	if (exists maximumSize) { jvbox.setMaxSize(*maximumSize); }
	//	jvbox.children.setAll(*transform(children));
	//	if (exists insets, !children.empty) {
	//		jvbox.setMargin(jvbox.children.get(0), insets.delegate);
	//	}
	//	return jvbox;
	//}
	//
	//{Node*} transform({Node*} children) {
	//	Node process(Node|VGrowNode child) {
	//		switch (child)
	//		case (is Node) { return child; }
	//		case (is VGrowNode) {
	//			JVBox.setVgrow( child.node.delegate, child.vgrow.delegate );
	//			return child.node.delegate;
	//		}
	//	}
	//	return asNodes(children.map(process));
	//}
	
}

//"A Node which can be added to the children of a [[VBox]] with a vgrow constraint."
//shared class VGrowNode(shared Node node, shared Priority vgrow) {}
