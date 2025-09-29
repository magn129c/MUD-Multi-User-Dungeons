// ChrisBruhn på GitHub (https://github.com/ChrisBruhn/MUD)
class Command {


  void parseInput(String input, Game game) {
    // Meget simpel input parser
    if (input == null) {
      input = "thiscommanddoesnotexist";
    } else if (input.contains("look")) {
      println(game.player.currentRoom.description);

      if (game.player.currentRoom.NPCs.size()>0) {
        for (NPC npc : game.player.currentRoom.NPCs) {
          println("Enemy: " + npc.name + " - " + npc.name);
        }
      }
    } else if (input.equals("items")) {

      if (game.player.currentRoom.items.size()>0) {
        for (Item it : game.player.currentRoom.items) {
          println("Item: " + it.name + " - " + it.description);
        }
      }
    } else if (input.contains("inventory")) {

      if (game.player.inventory.size()>0) {
        for (Item it : game.player.inventory) {
          println("Item: " + it.name + " - " + it.description);
        }
      }
    } else if (input.contains("exits")) {
      if (game.player.currentRoom.exits.size() > 0) {
        println("Exits:");
        for (String direction : game.player.currentRoom.exits.keySet()) {
          Room destination = game.player.currentRoom.exits.get(direction);
          println(" - " + direction + " -> " + destination.description);
        }
      } else {
        println("There are no exits from here.");
      }
    } else if (input.contains("north")) {
      moveCheck("north", game);
    } else if (input.contains("south")) {
      moveCheck("south", game);
    } else if (input.contains("west")) {
      moveCheck("west", game);
    } else if (input.contains("east")) {
      moveCheck("east", game);
    } else if (input.contains("up")) {
      moveCheck("up", game);
    } else if (input.contains("down")) {
      moveCheck("down", game);
    } else if (input.contains("take") && game.player.currentRoom.items.size()>0) {
      game.player.take(game.player.currentRoom.items.get(0));
      println("You picked up a: " + game.player.getLastItem());
    } else if (input.contains("stats")) {
      println(game.player.health + " HP");
      println(game.player.strength + " ATK");
    } else if (input.contains("attack")) {
      String[] split = input.split(" ");
      String[] split2 = split[1].split("");
      int index = Integer.valueOf(split2[0]);

      // Credit til min goat, ChatGPT
      if (index >= 0 && index < game.player.currentRoom.NPCs.size()) {
        NPC npc = game.player.currentRoom.NPCs.get(index);
        if (npc != null) {
          game.player.attack(npc);
          npc.attack(game.player);
          println("Enemy: " + npc.name + " - " + npc.health + " HP");
          println("Player: " + game.player.name + " - " + game.player.health + " HP");
        }
      } else {
        println("enemy doesn't exist");
      }
    } else {
      println("Command not recognized.");
    }
  }
  
  void moveCheck(String direction, Game game) {
    if (game.player.currentRoom.exits.containsKey(direction)) {
      game.player.setLocation(game.player.currentRoom.exits.get(direction));
      println("You moved " + direction + " to: " + game.player.currentRoom.description);
    } else {
      println("You can't go " + direction + " from here.");
    }    
  }
}
