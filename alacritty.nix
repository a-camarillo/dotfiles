{...}: {
	programs.alacritty = {
		enable = true;
		settings = {
			window = {
				opacity = 0.9;
				startup_mode = "Maximized";
				title = "Alactitty";
				blur = "true";
			};
			font = {
				normal = {
					family = "JetBrainsMonoNerdFont";
					style = "regular";
				};
				size = 12.0;
			};
			cursor = {
				style = {
					shape = "Beam";
					blinking = "On";
				};
			};
		};
	};
}
