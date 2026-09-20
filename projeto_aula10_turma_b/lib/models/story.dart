class Story {
  int? id;
  String user;
  String text;
  bool vizualizado;

  Story({
    this.id,
    required this.user,
    required this.text,
    this.vizualizado = false,
  });

  void vizu() {
    vizualizado = true;
  }

  factory Story.fromMap(Map<String, dynamic> json) => Story(
    id: json['id'],
    user: json['user'],
    text: json['text'],
    vizualizado: json['vizualizado'] == 0 ? false : true,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'user': user,
    'text': text,
    'vizualizado': vizualizado ? 1 : 0,
  };
}
