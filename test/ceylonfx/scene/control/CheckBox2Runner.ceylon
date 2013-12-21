import ceylonfx.application {
	CeylonFX
}
import ceylonfx.scene {
	Scene
}
import ceylonfx.scene.layout {
	VBox
}
import ceylonfx.scene.paint {
	red
}
import ceylonfx.stage {
	Stage
}

shared void run() 
		=> CeylonFX {
	args = process.arguments;
	Stage {
		Scene {
			dimension = [50.0, 50.0];
			VBox {
				CheckBox2(true,"My init text", true, red)
			}
		};
	};
};
