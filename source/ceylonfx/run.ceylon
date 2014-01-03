import ceylonfx.application {
	CeylonFX
}
import ceylonfx.geometry {
	center,
	Insets
}
import ceylonfx.scene {
	Scene
}
import ceylonfx.scene.layout {
	VBox
}
import ceylonfx.scene.paint {
	LinearGradient,
	black,
	blue,
	cyan,
	white
}
import ceylonfx.scene.text {
	Text,
	font
}
import ceylonfx.stage {
	Stage
}
import ceylonfx.binding { Unset }

shared void run() 
		=> CeylonFX {
	args = process.arguments;
	Stage {
		title = "CeylonFX Demo Application";
		() => Scene {
			fill = black;
			dimension = [600.0, 150.0];
			root = VBox {
				spacing = 20.0;
				
				insets = Insets { top = 15.0; };
				minimumSize = [600.0, 0.0];
				alignment = center;
				Text {
					text = "Welcome to CeylonFX";
					underline = true;
					font = font("Arial", 48.0);
					fill = LinearGradient { [0.0, blue], [0.75, cyan], [1.0, white] };
				},
				Text {
					text = "Under construction...";
					font = font("Arial", 12.0);
					fill = white;
				}   
			};
		};
	};
};
