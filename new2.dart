import "dart:html";

void main() {
  window.onKeyDown.listen((KeyboardEvent k) {
    querySelector("#box3").text = Cap(k.key);
    Move(k.key);
  });
}



// Declaring variables



var c1 = 'cyan';				// Colour of Arrow Keys box
var c2 = 'yellow';				// Colour of WASD box
const int z = 50;				// Size of boxes
const int j = 70;				// Step size
int i1 = 0;					// Arrow Keys step counter
int i2 = 0;					// WASD step counter
bool d1 = true; bool d2 = true;			// d1 and d2 are flags used in step counting
int b = 3;					// Border size when hollow
int x1 = (s - z) ~/ 3;				// Arow Keys x-coordinate
int y1 = (s - z) ~/ 2;				// Arow Keys y-coordinate
int x2 = ((s - z) ~/ 3) * 2;			// WASD x-coordinate
int y2 = (s - z) ~/ 2;				// WASD y-coordinate
int h = 0;					// Hollow counter


// Canvas syntax

final context = (querySelector('#canvas') as CanvasElement).context2D;
int s = querySelector('#canvas').clientWidth;



// Keyboard Input



void Move(press) {
  
  // Arrow Key Input
  
  if (press == "ArrowRight") {
    right1();
  }
  if (press == "ArrowUp") {
    up1();
  }
  if (press == "ArrowLeft") {
    left1();
  }
  if (press == "ArrowDown") {
    down1();
  }
  
  // WASD input
  
  if (press == "d") {
    right2();
  }
  if (press == "w") {
    up2();
  }
  if (press == "a") {
    left2();
  }
  if (press == "s") {
    down2();
  }
  
  // Reset and Hollow events
  
  if (press == "h") {
    h++;
    Draw();
  }
  if (press == "Enter") {
    reset();
  }
  ;
}



// Directional movement of blue square. 
// The large if statements are for collision detection.



void down1() {
  if (((y1 <= (y2 - z) && (y1 + z + j) > y2) ||
          (y1 <= (y2 - s - z) && (y1 + z + j) > (y2 - s)) ||
          (y1 <= (y2 + s - z) && (y1 + z + j) > (y2 + s))) &&
      ((x1 < (x2 + z) && x1 > (x2 - z)) ||
          (x1 < (x2 - s + z) && x1 > (x2 - s - z)) ||
          (x1 < (x2 + s + z) && x1 > (x2 + s - z)))) {
    y1 = y2 - z;
    if (d1 == true ) {
      i1++;
    }
    d1 = false;
  } else {
    y1 += j;
    if (d1 == false) {
      y1--;
    }
    i1++;
    d1 = true;
  }
  if (y1 > s) {
    y1 -= s;
  }
  ;
  Draw();
}

void up1() {
  if (((y1 >= (y2 + z) && (y1 - z - j) < y2) ||
          (y1 >= (y2 - s + z) && (y1 - z - j) < (y2 - s)) ||
          (y1 >= (y2 + s + z) && (y1 - z - j) < (y2 + s))) &&
      ((x1 < (x2 + z) && x1 > (x2 - z)) ||
          (x1 < (x2 - s + z) && x1 > (x2 - s - z)) ||
          (x1 < (x2 + s + z) && x1 > (x2 + s - z)))) {
    y1 = y2 + z;
    if (d1 == true ) {
      i1++;
    }
    d1 = false;
  } else {
    y1 -= j;
    if (d1 == false) {
      y1++;
    }
    i1++;
    d1 = true;
  }
  if (y1 < 0) {
    y1 += s;
  }
  ;
  Draw();
}

void right1() {
  if (((x1 <= (x2 - z) && (x1 + z + j) > x2) ||
          (x1 <= ((x2 - s) - z) && (x1 + z + j) > (x2 - s)) ||
          (x1 <= ((x2 + s) - z) && (x1 + z + j) > (x2 + s))) &&
      ((y1 < (y2 + z) && y1 > (y2 - z)) ||
          (y1 < ((y2 - s) + z) && y1 > ((y2 - s) - z)) ||
          (y1 < ((y2 + s) + z) && y1 > ((y2 + s) - z)))) {
    x1 = x2 - z;
    if (d1 == true ) {
      i1++;
    }
    d1 = false;
  } else {
    x1 += j;
    if (d1 == false) {
      x1--;
    }
    i1++;
    d1 = true;
  }
  if (x1 > s) {
    x1 -= s;
  }
  ;
  Draw();
}

void left1() {
  if (((x1 >= (x2 + z) && (x1 - z - j) < x2) ||
          (x1 >= ((x2 - s) + z) && (x1 - z - j) < (x2 - s)) ||
          (x1 >= ((x2 + s) + z) && (x1 - z - j) < (x2 + s))) &&
      ((y1 < (y2 + z) && y1 > (y2 - z)) ||
          (y1 < ((y2 - s) + z) && y1 > ((y2 - s) - z)) ||
          (y1 < ((y2 + s) + z) && y1 > ((y2 + s) - z)))) {
    x1 = x2 + z;
    if (d1 == true ) {
      i1++;
    }
    d1 = false;
  } else {
    x1 -= j;
    if (d1 == false) {
      x1++;
    }
    i1++;
    d1 = true;
  }
  if (x1 < 0) {
    x1 += s;
  }
  ;
  Draw();
}



// Directional movement of yellow square.



void down2() {
  if (((y2 <= (y1 - z) && (y2 + z + j) > y1) ||
          (y2 <= ((y1 - s) - z) && (y2 + z + j) > (y1 - s)) ||
          (y2 <= ((y1 + s) - z) && (y2 + z + j) > (y1 + s))) &&
      ((x2 < (x1 + z) && x2 > (x1 - z)) ||
          (x2 < ((x1 - s) + z) && x2 > ((x1 - s) - z)) ||
          (x2 < ((x1 + s) + z) && x2 > ((x1 + s) - z)))) {
    y2 = y1 - z;
    if (d2 == true ) {
      i2++;
    }
    d2 = false;
  } else {
    y2 += j;
    if (d2 == false) {
      y2--;
    }
    i2++;
    d2 = true;
  }
  if (y2 > s) {
    y2 -= s;
  }
  ;
  Draw();
}

void up2() {
  if (((y2 >= (y1 + z) && (y2 - z - j) < y1) ||
          (y2 >= (y1 - s + z) && (y2 - z - j) < (y1 - s)) ||
          (y2 >= (y1 + s + z) && (y2 - z - j) < (y1 + s))) &&
      ((x2 < (x1 + z) && x2 > (x1 - z)) ||
          (x2 < (x1 - s + z) && x2 > (x1 - s - z)) ||
          (x2 < (x1 + s + z) && x2 > (x1 + s - z)))) {
    y2 = y1 + z;
    if (d2 == true ) {
      i2++;
    }
    d2 = false;
  } else {
    y2 -= j;
    if (d2 == false) {
      y2++;
    }
    i2++;
    d2 = true;
  }
  if (y2 < 0) {
    y2 += s;
  }
  ;
  Draw();
}

void right2() {
  if (((x2 <= (x1 - z) && (x2 + z + j) > x1) ||
          (x2 <= (x1 - s - z) && (x2 + z + j) > (x1 - s)) ||
          (x2 <= (x1 + s - z) && (x2 + z + j) > (x1 + s))) &&
      ((y2 < (y1 + z) && y2 > (y1 - z)) ||
          (y2 < (y1 - s + z) && y2 > (y1 - s - z)) ||
          (y2 < (y1 + s + z) && y2 > (y1 + s - z)))) {
    x2 = x1 - z;
    if (d2 == true ) {
      i2++;
    }
    d2 = false;
  } else {
    x2 += j;
    if (d2 == false) {
      x2--;
    }
    i2++;
    d2 = true;
  }
  if (x2 > s) {
    x2 -= s;
  }
  ;
  Draw();
}

void left2() {
  if (((x2 >= (x1 + z) && (x2 - z - j) < x1) ||
          (x2 >= (x1 - s + z) && (x2 - z - j) < (x1 - s)) ||
          (x2 >= (x1 + s + z) && (x2 - z - j) < (x1 + s))) &&
      ((y2 < (y1 + z) && y2 > (y1 - z)) ||
          (y2 < (y1 - s + z) && y2 > (y1 - s - z)) ||
          (y2 < (y1 + s + z) && y2 > (y1 + s - z)))) {
    x2 = x1 + z;
    if (d2 == true ) {
      i2++;
    }
    d2 = false;
  } else {
    x2 -= j;
    if (d2 == false) {
      x2++;
    }
    i2++;
    d2 = true;
  }
  if (x2 < 0) {
    x2 += s;
  }
  ;
  Draw();
}


// This function resets the canvas

void reset() {
  x1 = (s - z) ~/ 3;
  y1 = (s - z) ~/ 2;
  x2 = ((s - z) ~/ 3) * 2;
  y2 = (s - z) ~/ 2;
  i1 = 0;
  i2 = 0;
	d1 = true;
	d2 = true;
  Draw();
}


// This function stylises the 'Button pressed' display

String Cap(String l) {
  if (l == " ") {
    return "Button pressed: Space";
  } else if (l == "Enter") {
    return "Canvas reset";
  } else if (l.length == 1) {
    return "Button pressed: ${l.toUpperCase()}";
  } else {
    return "Button pressed: ${l.replaceAll("Arrow", "")}";
  }
}


// Drawing the squares

void Draw() {
  context.clearRect(0, 0, s, s);
	
  
  // Drawing the blue square
  
  context.fillStyle = c1;
  context.fillRect(x1, y1, z, z);
  context.fillStyle = c1;
  context.fillRect(x1 - s, y1, z, z);
  context.fillStyle = c1;
  context.fillRect(x1, y1 - s, z, z);
  context.fillStyle = c1;
  context.fillRect(x1 - s, y1 - s, z, z);
	
  
  // Drawing the yellow square
  
  context.fillStyle = c2;
  context.fillRect(x2, y2, z, z);
  context.fillStyle = c2;
  context.fillRect(x2 - s, y2, z, z);
  context.fillStyle = c2;
  context.fillRect(x2, y2 - s, z, z);
  context.fillStyle = c2;
  context.fillRect(x2 - s, y2 - s, z, z);
	
  
  // Hollowing out the squares

  if ((h % 2) == 1) {
  context.clearRect(x1 + b, y1 + b, z - (2 * b), z - (2 * b));
  context.clearRect(x1 - s + b, y1 + b, z - (2 * b), z - (2 * b));
  context.clearRect(x1 + b, y1 - s + b, z - (2 * b), z - (2 * b)); 
  context.clearRect(x1 - s + b, y1 + b - s, z - (2 * b), z - (2 * b));
  context.clearRect(x2 + b, y2 + b, z - (2 * b), z - (2 * b));
  context.clearRect(x2 - s + b, y2 + b, z - (2 * b), z - (2 * b));
  context.clearRect(x2 + b, y2 - s + b, z - (2 * b), z - (2 * b)); 
  context.clearRect(x2 - s + b, y2 + b - s, z - (2 * b), z - (2 * b));
  }
  
  
  // 'Steps moved' display
  
  querySelector("#box1").text = "Steps moved: ${i1}";
  querySelector("#box2").text = "Steps moved: ${i2}";
}
