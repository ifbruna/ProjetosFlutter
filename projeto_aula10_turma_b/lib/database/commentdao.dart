import 'package:projeto_aula08_turma_b/database/database_helper.dart';
import 'package:projeto_aula08_turma_b/models/comment.dart';
import 'package:sqflite/sqflite.dart';

class Commentdao {
  Commentdao();

  // read
  Future<List<Comment>> getCommentsByPost(int postId) async {
    Database db = await DatabaseHelper.instance.database;
    var comments = await db.rawQuery(
      'SELECT * FROM comments WHERE post_id = ? ORDER BY id DESC',
      [postId],
    );
    return comments.isNotEmpty
        ? comments.map((item) => Comment.fromMap(item)).toList()
        : [];
  }

  // create
  Future<int> add(Comment newComment) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('comments', newComment.toMap());
  }
}
