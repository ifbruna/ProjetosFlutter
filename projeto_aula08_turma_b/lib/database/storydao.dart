import 'package:projeto_aula08_turma_b/database/database_helper.dart';
import 'package:projeto_aula08_turma_b/models/story.dart';
import 'package:sqflite/sqflite.dart';

class Storydao {
  Storydao._();
  static final Storydao instance = Storydao._();

  // read
  Future<List<Story>> getStorys() async {
    Database db = await DatabaseHelper.instance.database;
    var storys = await db.query('storys', orderBy: 'id ASC');
    List<Story> storyList = storys.isNotEmpty
        ? storys.map((item) => Story.fromMap(item)).toList()
        : [];
    return storyList;
  }

  // create
  Future<int> add(Story newStory) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('storys', newStory.toMap());
  }

  // delete
  Future<int> remove(Story story) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete('storys', where: 'id=?', whereArgs: [story.id]);
  }

  // update
  Future<int> update(Story story) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.update(
      'storys',
      story.toMap(),
      where: 'id=?',
      whereArgs: [story.id],
    );
  }
}
