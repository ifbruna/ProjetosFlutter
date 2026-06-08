class Post {

  String title;
  String text;
  bool liked;

  Post({
    required this.title,
    required this.text,
    this.liked = false,
  });

  void like () {

    if(liked == false){
      liked = true;
    } else {
      liked = false;
    }

  }

}