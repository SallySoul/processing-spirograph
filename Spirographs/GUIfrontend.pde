/*GUIfrontend.pde 
by Russell Bentley

This is the GUI we use for the spirograph program. 
It continas all the handlers specific to this program */

public GUI constructGUI() {
	GUI spiroGUI = new GUI();
	GUISlideMenu menu = new GUISlideMenu(240, 800, color(128,128,128,150), color(135,67,186));
	spiroGUI.add(menu);

	color fillcolor = color(90,90,90);   
	color selectcolor = color(200,200,200);

	menu.add(new GUItext("Red", 50, 20, color(255,0,0), 16));
	menu.add(new GUItext("Green", 50, 70, color(0,255,0), 16));
	menu.add(new GUItext("Blue", 50, 120, color(0,0,255), 16));
	menu.add(new GUItext("Alpha", 50, 170, color(0,0,0), 16));
	menu.add(new GUItext("Brush Radius", 50, 220, selectcolor, 16));
	menu.add(new GUItext("Brush Preview", 50, 270, selectcolor, 16));
	menu.add(new brushPreview(200, 265));


	menu.add(new GUItext("Clear", 50, 300, selectcolor, 16));
	menu.add(new GUItext("Save", 50, 330, selectcolor, 16));
	menu.add(new GUItext("Draw Circles?", 50, 360, selectcolor, 16));
	menu.add(new GUItext("Draw Spiro.?", 50, 390, selectcolor, 16));
	menu.add(new GUItext("Radius One", 50, 440, selectcolor, 16));
	menu.add(new GUItext("Radius Two", 50, 490, selectcolor, 16));
	menu.add(new GUItext("Radius Three", 50, 540, selectcolor, 16));


	menu.add(new GUIslider(20, 30, 200, 20,fillcolor, color(255,0,0), selectcolor, new redSH()));
	menu.add(new GUIslider(20, 80, 200, 20,fillcolor, color(0,255,0), selectcolor, new greenSH()));
	menu.add(new GUIslider(20, 130, 200, 20,fillcolor, color(0,0,255), selectcolor, new blueSH()));
	menu.add(new GUIslider(20, 180, 200, 20,fillcolor, color(0,0,0), selectcolor, new transSH()));
	menu.add(new GUIslider(20, 230, 200, 20,fillcolor, selectcolor, selectcolor, new dradSH()));


	menu.add(new GUIslider(20, 450, 200, 20,fillcolor, selectcolor, selectcolor, new radoneSH()));
	menu.add(new GUIslider(20, 500, 200, 20,fillcolor, selectcolor, selectcolor, new radtwoSH()));
	menu.add(new GUIslider(20, 550, 200, 20,fillcolor, selectcolor, selectcolor, new radthreeSH()));

	menu.add(new GUIpushbutton(120, 295, 20, fillcolor, color(0,0,0), selectcolor, new clearPH()));
	menu.add(new GUIpushbutton(120, 325, 20, fillcolor, color(0,0,0), selectcolor, new savePH()));
	menu.add(new GUItogglebutton(170, 355, 20, fillcolor, color(0,0,0), selectcolor, new circlesTH()));
	menu.add(new GUItogglebutton(170, 385, 20, fillcolor, color(0,0,0), selectcolor, new drawTH()));

	return spiroGUI;
}

public class brushPreview implements GUIelement {
	float x, y;

	public brushPreview(float x0, float y0) {
		x = x0;
		y = y0;
	}

	public void draw() {draw(0,0);};
	public void draw(float tranX, float tranY) {
		pushStyle();
		fill(0,0,0,130);
		stroke(0,0,0,130);
		rect(x + tranX - 16, y + tranY - 16, 32, 32);
		popStyle();

		pushStyle();
		fill(redf, greenf, bluef, transf);
		stroke(redf, greenf, bluef, transf);
		ellipse(x + tranX, y + tranY, drad, drad);
		popStyle();
	}
	public void update(float elapsedTime){}
	public void mouseReleased(){}
}

public class redSH implements sliderHandler {
	public void update(float ratio) { 
		redf = ratio*255;
		spiroBuffer.stroke(redf, greenf, bluef, transf);
		spiroBuffer.fill(redf, greenf, bluef, transf);
	}
}

public class greenSH implements sliderHandler {
	public void update(float ratio) { 
		greenf = ratio*255;
		spiroBuffer.stroke(redf, greenf, bluef, transf);
		spiroBuffer.fill(redf, greenf, bluef, transf);
	}
}

public class blueSH implements sliderHandler {
	public void update(float ratio) { 
		bluef = ratio*255;
		spiroBuffer.stroke(redf, greenf, bluef, transf);
		spiroBuffer.fill(redf, greenf, bluef, transf);
	}
}

public class transSH implements sliderHandler {
	public void update(float ratio) { 
		transf = ratio*255;
		spiroBuffer.stroke(redf, greenf, bluef, transf);
		spiroBuffer.fill(redf, greenf, bluef, transf);
	}
}

public class dradSH implements sliderHandler {
	public void update(float ratio) { 
		drad = ratio*20;
	}
}

public class radoneSH implements sliderHandler {
	public void update(float ratio) { 
		radiusOne = ratio * radiusMax;
	}
}

public class radtwoSH implements sliderHandler {
	public void update(float ratio) { 
		radiusTwo = ratio * radiusMax;
	}
}

public class radthreeSH implements sliderHandler {
	public void update(float ratio) { 
		radiusThree = ratio * radiusMax;
	}
}

public class clearPH implements pushHandler {
	public void update() {
		spiroBuffer.background(0);
	}
}

public class savePH implements pushHandler {
	public void update() {
		String title = "is" + year() + month() + day() + hour() + minute() + second();
		title = "screenshots/date" + title + ".jpg";
		spiroImage.save(title);
	}
}

public class circlesTH implements toggleHandler {
	public void update(boolean state) {
		drawCircles = state;
	}
}

public class drawTH implements toggleHandler {
	public void update(boolean state) {
		spiroDraw = state;
	}
}


