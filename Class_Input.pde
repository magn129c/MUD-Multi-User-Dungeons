class Input {
boolean inputText = false;
String text;
  
  void reset() {
    text = "";
    textarea1.setText("");
  
  }
  
  void display() {
    createGUI();
  }
  
  String getText() {
  
    return text;
  }
}
