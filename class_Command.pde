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
    } else if (input.contains("north") && game.player.currentRoom.exits.containsKey("north")) {
      game.player.setLocation(game.player.currentRoom.exits.get("north"));
      println("You moved north to: " + game.player.currentRoom.description);
    } else if (input.contains("south") && game.player.currentRoom.exits.containsKey("south")) {
      game.player.setLocation(game.player.currentRoom.exits.get("south"));
      println("You moved south to: " + game.player.currentRoom.description);
    } else if (input.contains("west") && game.player.currentRoom.exits.containsKey("north")) {
      game.player.setLocation(game.player.currentRoom.exits.get("west"));
      println("You moved west to: " + game.player.currentRoom.description);
    } else if (input.contains("east") && game.player.currentRoom.exits.containsKey("south")) {
      game.player.setLocation(game.player.currentRoom.exits.get("east"));
      println("You moved east to: " + game.player.currentRoom.description);
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
}
