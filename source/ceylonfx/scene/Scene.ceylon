import ceylonfx.application {
    CeylonFxAdapter,
    asNodes,
    CeylonNode,
    asType
}
import ceylonfx.scene.paint {
    white
}

import javafx.scene {
    Node,
    JScene=Scene,
    Group
}
import javafx.scene.paint {
    Paint
}

shared class Scene(
    dimension = [600.0, 400.0], 
    depthBuffer = false,
	fill = white, 
	children = [])
		extends CeylonFxAdapter<JScene>() {
	
	shared [Float, Float] dimension;
	shared Float width = dimension[0];
	shared Float height = dimension[1];
	shared Boolean depthBuffer;
	shared Paint|CeylonFxAdapter<Paint> fill;
	shared {Node|CeylonNode*} children;
	
	Group root = Group();
	root.children.setAll(*asNodes(children));
	
	shared actual JScene createDelegate() {
		value actualScene = JScene(root, width, height, depthBuffer);
		actualScene.fill = asType<Paint>(fill);
		return actualScene;
	}
}
