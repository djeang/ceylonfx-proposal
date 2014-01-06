import ceylonfx.binding {
	Unset,
	unset
}
import ceylonfx.collections {
	ObservableList, WrappedObservableList
}
import ceylonfx.geometry {
	Insets,
	Point3D,
	Location
}
import ceylonfx.scene {
	Node,
	CacheHint,
	Cursor,
	DepthTest,
	GenericNode
}
import ceylonfx.scene.effect {
	BlendMode,
	Effect
}

import javafx.scene {
	JNode=Node
}
import javafx.scene.layout {
	JPane=Pane
}
shared abstract class Pane<out Delegate>(
	
	// From  CeylonFxAdapter
	Delegate delegate,
	
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
	{Node*}|Unset children = unset) 

		extends Region<Delegate>(delegate, id, style,blendMode, cacheHint, clip, cursor,
		depthTest, effect, focusTraversable, location, managed, mouseTransparent,
		pickOnBounds, rotate, rotationAxis, scale, translate, visible, maxHeight, minHeight, prefHeight, 
		maxWidth, minWidth, prefWidth, padding, snapToPixel)
		
		given Delegate satisfies JPane {
	
	shared ObservableList<Node> childList = WrappedObservableList<Node, JNode>(delegate.children, Node<JNode>.delegate, GenericNode);
	
	if (is {Node*} children) {
		childList.setAll(children);
	}
	
	
}