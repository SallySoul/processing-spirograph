/* Spirograph.pde
By Russell Bentley

*/


import java.util.*;

//calculate on the fly
float xcenter;
float ycenter;
float radiusMax;
float rad;

//for menu control
float spiroAngle;
float angleMod;
float radiusOne;
float radiusTwo;
float radiusThree;
float drad;
float redf = 0;
float greenf = 0;
float bluef = 0; 
float transf = 0;
boolean drawCircles;
boolean spiroDraw;

//Here are the things concerned with actually displaying the results. 
GUI spiroGUI;
PGraphics spiroBuffer;
PImage spiroImage;

void setup() {
	size(800,800);
	background(255,255,255);
	fill(0);
	ellipseMode(CENTER);

	spiroAngle = 0;
	angleMod = 0.001;
	radiusOne = 0;
	radiusTwo = 0;
	radiusThree = 0;
	drawCircles = false;
	spiroDraw = false;
	drad = 1;
	redf = 0;
   	greenf = 0;
    	bluef = 0; 
    	transf = 0;

	spiroGUI = constructGUI();
	spiroBuffer = createGraphics(800,800);

	background(0);
}

void draw() {
	float elapsedTime = constrain(1f/frameRate, 16f/1000f, 32f/1000f);

	background(0);

	
	xcenter = width/2;
	ycenter = height/2;
	radiusMax = width/2 - 100;

	spiroBuffer.beginDraw();

	if(spiroDraw)
		for(int i = 0; i < 100; i++){
			spiroBuffer.ellipse(spiroFunctionX(spiroAngle) + xcenter, spiroFunctionY(spiroAngle) + ycenter, drad, drad);
			spiroAngle += angleMod;
		};
		

	spiroBuffer.endDraw();
	spiroImage = spiroBuffer.get(0, 0, spiroBuffer.width, spiroBuffer.height);
	image(spiroImage, 0, 0);

	if(drawCircles) {
		float xcentert = xcenter + (radiusOne + radiusTwo)*cos(spiroAngle);
		float ycentert = ycenter + (radiusOne + radiusTwo)*sin(spiroAngle);

		pushStyle();
			fill(color(230,0,0,50));
			stroke(255,255,255);
			ellipse(xcenter,ycenter,2*radiusOne + radiusTwo ,2*radiusOne + radiusTwo);
			ellipse(xcentert, ycentert, radiusTwo, radiusTwo);
			line(xcenter, ycenter, xcentert, ycentert);
			line(xcentert, ycentert, spiroFunctionX(spiroAngle) + xcenter, spiroFunctionY(spiroAngle) + ycenter);
		popStyle();
	}

	spiroGUI.update(elapsedTime);
	spiroGUI.draw();
}


float spiroFunctionX(float angle) {
	return (radiusOne + radiusTwo)*cos(angle) - radiusThree*cos(((radiusOne + radiusTwo)/radiusTwo)*angle);
}

float spiroFunctionY(float angle) {
	return (radiusOne + radiusTwo)*sin(angle) - radiusThree*sin(((radiusOne + radiusTwo)/radiusTwo)*angle);
}


