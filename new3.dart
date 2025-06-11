import 'dart:html';

void main() {
  draw();
  window.onKeyDown.listen((KeyboardEvent input) {
    querySelector('#textBox2').text = 'Button Pressed: ${button(input.key)}';
    move(input.key);
  });
  print(canvasSize);
}


// Declaring variables

int boxSize = 75;
int stepSize = 29;
int canvasSize = querySelector('#canvas').clientWidth;
int x = (canvasSize - boxSize) ~/ 2;
int y = (canvasSize - boxSize) ~/ 2;
int stepCounter = 0;
int hollowFlag = 1;
int hollowBorder = 3;

final context = (querySelector('#canvas') as CanvasElement).context2D;


// Button pressed display

String button(keyPressed) {
  if (keyPressed == " ") {
    return "Space";
  } else if (keyPressed.length == 1) {
    return keyPressed.toUpperCase();
  } else {
    return keyPressed.replaceAll("Arrow", "");
  }
}


// Input for movements and flags

void move(input) {
  input == "ArrowUp" || input == "w" ? y -= stepSize:
  input == "ArrowDown" || input == "s" ? y += stepSize:
  input == "ArrowLeft" || input == "a" ? x -= stepSize:
  input == "ArrowRight" || input == "d" ? x += stepSize: stepCounter--;

  input == "Enter" ? reset() : input == "h" ? hollowFlag++ : null;
  stepCounter++;
  draw();
  querySelector('#textBox1').text = 'Steps moved: $stepCounter';
}


// Erasing the canvas

void reset() {
  x = (canvasSize - boxSize) ~/ 2;
  y = (canvasSize - boxSize) ~/ 2;
  stepCounter = 0;
  querySelector('#textBox2').text = 'Canvas Erased';
}


// Drawing the box

void draw() {
  
  int b = hollowBorder;
  int s = boxSize;
  int c = canvasSize;
	
  // These IF statements create the looping effect
  
  x >= c ? x -= c : x < 0 ? x += c : null;
  y >= c ? y -= c : y < 0 ? y += c : null;
  
  context
    ..clearRect(0, 0, c, c)
    ..fillStyle = "cyan"
    ..fillRect(x, y, s, s)
    ..fillRect(x - c, y, s, s)
    ..fillRect(x, y - c, s, s)
    ..fillRect(x - c, y - c, s, s);

  if (hollowFlag % 2 == 0) {
    context
      ..clearRect(x + b, y + b, s - (b * 2), s - (b * 2))
      ..clearRect(x + b - c, y + b, s - (b * 2), s - (b * 2))
      ..clearRect(x + b, y + b - c, s - (b * 2), s - (b * 2))
      ..clearRect(x + b - c, y + b - c, s - (b * 2), s - (b * 2));
  }
}
