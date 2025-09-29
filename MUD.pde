Input input = new Input();
Command command;
Game game;

void setup() {
  size(400, 400);
  game=new Game();
  game.start();
  getInput().display();
}

void draw() {
  game.gameloop();
}


void keyPressed() {
    if(key == ENTER) {
      getInput().inputText = true;
    }
  if (key == ENTER) {
    getInput().inputText = true;
  }
}

Input getInput() {
  return input;
}
