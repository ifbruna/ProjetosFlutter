class Story {
  String user;
  String text;
  bool vizualizado;

  Story({required this.user, required this.text, this.vizualizado = false});

  void vizu() {
    vizualizado = true;
  }
}
