// ChrisBruhn på GitHub (https://github.com/ChrisBruhn/MUD)
class Game {
  Player player;
  Command command;
  HashMap<String, Room> roomMap = new HashMap<String, Room>();

  Game() {
    player = new Player("Hero");
    command = new Command();

    // Rum, NPCer og Items genereret af min goat ChatGPT (og r1 og r2 af ChrisBruhn på GitHub (https://github.com/ChrisBruhn/MUD))
    fileLoader("gameData.txt", this);
  }

  void start() {
    println("Game started!");
    println(player.currentRoom.description);
  }

  void gameloop() {
    // her kunne du opdatere input/output og game state

    if (getInput().inputText) {
      handleInput(input.getText());
      getInput().inputText=false;
      getInput().reset();
    }
  }

  void handleInput(String input) {
    command.parseInput(input, this);
  }

  void fileLoader(String filename, Game game) {
    String[] lines = loadStrings(filename);

    for (String line : lines) {
      if (line.trim().isEmpty()) continue;

      String[] parts = split(line, '|');
      if (line.startsWith("ROOM:")) {
        String id = parts[0].substring(5).trim();
        String description = parts[1];
        Room r = new Room(description);
        roomMap.put(id, r);
      } else if (line.startsWith("EXIT:")) {
        String from = parts[0].substring(5).trim();
        String direction = parts[1];
        String to = parts[2];
        Room rFrom = roomMap.get(from);
        Room rTo = roomMap.get(to);
        if (rFrom != null && rTo != null) {
          rFrom.addExit(direction, rTo);
        }
      } else if (line.startsWith("ITEM:")) {
        String id = parts[0].substring(5).trim();
        String name = parts[1];
        String description = parts[2];
        String effect = parts[3];
        String location = parts[4];
        Item item = new Item(name, description, effect);
        Room r = roomMap.get(location);
        if (r != null) r.addItem(item);
      } else if (line.startsWith("NPC:")) {
        String id = parts[0].substring(4).trim();
        String name = parts[1];
        int health = int(parts[2]);
        int strength = int(parts[3]);
        int hostility = int(parts[4]);
        String location = parts[5];
        NPC npc = new NPC(name, health, strength, hostility);
        Room r = roomMap.get(location);
        if (r != null) r.addNPC(npc);
      }
    }

    if (!game.roomMap.isEmpty()) {
      game.player.setLocation(game.roomMap.get("r1"));
    }
  }
}
