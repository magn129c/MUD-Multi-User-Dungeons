class Player {
  
  String name = "";
  int maxHealth = 100;
  int health = 100;
  int strength = 5;
  
  ArrayList<Item> inventory = new ArrayList<Item>();
  Room currentRoom;
  Item lastItem;
  
  Player(String name) {
    this.name = name;
  }
  
  void setLocation(Room room) {
    currentRoom = room;
  }
  
  Item getLastItem() {
    return lastItem;
  }
  
  void take(Item item) {
    lastItem = item;
    inventory.add(item);
  }
  
  void attack(NPC npc) {
    npc.takeDamage(this.strength);  
  }
}
