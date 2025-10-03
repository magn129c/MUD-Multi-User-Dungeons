class Item {
  String name;
  String description;
  String ability;
  
  Item(String name, String description, String ability) {
    this.name = name;
    this.description = description;
    this.ability = ability;
  }
  
  void use() {
    String[] abilitySplit = this.ability.split(" ");
    if(abilitySplit[1].equals("health")) {
      if(abilitySplit[0].equals("Restore")) {
        if((game.player.health + Integer.valueOf(abilitySplit[2])) != game.player.maxHealth) {
          game.player.health += Integer.valueOf(abilitySplit[2]);
        } else {
          game.player.health = game.player.maxHealth;
        }
      } else if(abilitySplit[0].equals("Increase")) {
        game.player.maxHealth += Integer.valueOf(abilitySplit[2]);
        game.player.health += Integer.valueOf(abilitySplit[2]);
      }
    } else if(abilitySplit[1].equals("attack")) {
      if(abilitySplit[0].equals("Increase")) {
        game.player.strength += Integer.valueOf(abilitySplit[2]);
      }
    } else {
      // Do nothing for now
    }
  }
}
