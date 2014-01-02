import ceylonfx.application {
	CeylonFxAdapter,
	CeylonNode,
	asNodes
}
import ceylonfx.geometry {
	Position,
	topLeft,
	Insets,
	Dimension
}

import javafx.scene {
	Node
}
import javafx.scene.layout {
	JVBox=VBox
}
import ceylonfx.binding { Unset, unset }

"VBox lays out its children in a single vertical column."
shared class VBox<Delegate = JVBox>(
	Delegate delegate,
	Position|Unset alignement = unset,
	Boolean|Unset fillWidth = unset,
	Float|Unset spacing = unset,
	Boolean|Unset vGrow = unset)
		extends Pane<Delegate>(delegate)
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

"A Node which can be added to the children of a [[VBox]] with a vgrow constraint."
shared class VGrowNode(shared Node node, shared Priority vgrow) {}
