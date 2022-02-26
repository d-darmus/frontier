import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class Note{
  static const databaseName = 'note';
  final int recId;
  final String content;

  Note({
    required this.recId,
    required this.content,
  }); 
  
  Map<String, dynamic> toMap(){
    return {
      'content':content
    };
  }

  static Future<Database> get database async {
    final Future<Database> _database = openDatabase(
      join(await getDatabasesPath(),'note.db'),
      onCreate: (db,version){
        return db.execute(
          "CREATE TABLE note(recId INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT)",
        );
      },
      version: 1,
    );
    return _database;
  }

  /// 全てのデータ取得
  static Future<List<Note>> getDatas() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(databaseName);
    return List.generate(maps.length,(i){
      return Note(
        recId: maps[i]['recId'],
        content: maps[i]['content'],
      );
    });
  }

  /// データ挿入
  /// @param Note データモデル
  static Future<void> insertData(Note data) async {
    final Database db = await database;
    await db.insert(
      databaseName,
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// データ更新
  /// @param recId レコードID
  /// @param data データモデル
  static void update(int recId,Note data) async{
    final Database db = await database;
    await db.update(
      databaseName,
      data.toMap(),
      where:"recId=?",
      whereArgs: [recId],
    );
  }

  /// データ削除
  /// @param recId レコードID
  static Future<void> deleteData(int recId) async {
    final db = await database;
    await db.delete(
      databaseName,
      where: "recId = ?",
      whereArgs: [recId],
    );
  }
}
