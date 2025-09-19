class Room {
  
  String description;
  HashMap<String, Room> exits;
  ArrayList<Item> items;
  ArrayList<NPC> NPCs;
  
  Room(String description) {
    this.description = description;
  }
  
  void addExit(String direction, Room roomBehindDoor) {
    exits.put(direction, roomBehindDoor);
  }
  
  Room getExit(String direction) {
    return exits.get(direction);
  }
  
  void addItem(Item item) {
  }
  
  void addNPC(NPC npc) {
  }
  
}
