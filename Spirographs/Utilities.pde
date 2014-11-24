/*Utilities.pde
By Russell Bentley

This file contains a few groupings of useful functions. These include:
	-mouseDist(float x, float y)

*/

public float mouseDist(float x, float y) {
	float diffX = mouseX - x;
	float diffY = mouseY - y;
	return sqrt(diffX*diffX + diffY*diffY);
}

public boolean mouseOnRect(float a, float b, float c, float d) {
	float mx = mouseX;
	float my = mouseY;
	boolean result = false;

	if(mx >= a && mx <= a+c && my >= b && my <= b+d) {
		result = true;
	}	

	return result;
}

