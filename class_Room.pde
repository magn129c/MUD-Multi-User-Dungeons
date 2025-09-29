class Room {
  String description;
  HashMap <String, Room> exits = new HashMap<String, Room>();
  ArrayList<Item> items = new ArrayList<Item>();
  ArrayList<NPC> NPCs = new ArrayList<NPC>();

  Room(String description) {

    this.description=description;
  }


  Room getExit(String direction) {
    return exits.get(direction);
  }
  void addExit(String direction, Room room) {
    exits.put(direction, room);
  }

  void addItem(Item item) {
    items.add(item);
  }
  void addNPC(NPC npc) {
    NPCs.add(npc);
  }
}
