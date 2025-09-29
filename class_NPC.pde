class NPC {
  String name;
  int health;
  int strength;
  
  int hostility;
  
  NPC(String name, int health, int strength, int hostility) {
    this.name = name;
    this.health = health;
    this.strength = strength;
    this.hostility = hostility;
  }
  
  void attack(Player player) {
    player.health-=this.strength;
  }

  void takeDamage(int dmg) {
    this.health-=dmg;
  }
}
