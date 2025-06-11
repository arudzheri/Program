import "dart:html";

void main() {
  window.onKeyDown.listen((KeyboardEvent k) {
    Move(k.key);
  });
  
  window.onKeyDown.listen((KeyboardEvent k) {
    querySelector("#box2").text = Cap(k.key);
  });
}

int x = 150;
int y = 150;
int z = 50;
int i = 0;

final context = (querySelector('#canvas') as CanvasElement).context2D;

// ArrowKeys Input

void Move(press) {
  if (press == "ArrowRight" || press == "d") {
    right();
  }
  if (press == "ArrowUp" || press == "w") {
    up();
  }
  if (press == "ArrowLeft" || press == "a") {
    left();
  }
  if (press == "ArrowDown" || press == "s") {
    down();
  }
  if (press == "Enter") {
    reset();
  };
}

void down() {
  y += z;
  if (y >= 350) {
    y = 0;
  }
  ;
  Draw();
}

void up() {
  y -= z;
  if (y < 0) {
    y = 350 - z;
  }
  ;
  Draw();
}

void right() {
  x += z;
  if (x >= 350) {
    x = 0;
  }
  ;
  Draw();
}

void left() {
  x -= z;
  if (x < 0) {
    x = 350 - z;
  }
  ;
  Draw();
}

void reset() {
  x = 150;
  y = 150;
  i = 0;
  Draw();
}

String Cap (String l) {
  if (l.length == 1) {
    return "Button pressed: ${l.toUpperCase()}";
  } else if (l == "Enter") {
    return "Canvas reset";
  } else {
    return "Button pressed: ${l.replaceAll("Arrow", "")}";
  }
}

// Drawing the square

void Draw() {
  context.clearRect(0, 0, 350, 350);
  context.fillStyle = 'cyan';
  context.fillRect(x, y, z, z);
  querySelector("#box1").text = "Steps moved: ${i++}";
}
