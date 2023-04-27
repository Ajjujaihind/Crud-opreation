import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  var note_table = "note";
  var columnId = "note_id";
  var columnTitle = "note_title";
  var columnDesc = "note_Desc";
  Future<Database> openDB() async {
    var director = await getApplicationDocumentsDirectory();
    // we use recursive true because we create directory only first time
    await director.create(recursive: true);
    var path = director.path + "note_db.db";
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "create table $note_table ( $columnId integer primary key  autoincrement ,"
            " $columnTitle text, $columnDesc text )");
      },
    );
  }

  void adddata(String title, String desc) async {
    var mydb = await openDB();
    mydb.insert(note_table, {columnTitle: title, columnDesc: desc});
  }

  Future<List<Map<String, dynamic>>> fetchdata() async {
    var myDb = await openDB();
    return myDb.query(note_table);
  }

  void updatData(int id, String title, String desc) async {
    var myDB = await openDB();
    // myDB.update(note_table, {columnTitle: title, columnDesc: desc}, where: "$columnId = ?", whereArgs: ['$id']);
    myDB.update(note_table, {columnTitle: title, columnDesc: desc},
        where: "$columnId = $id");
  }

  void deletenote(int id) async {
    var myDB = await openDB();
    myDB.delete(note_table, where: '$columnId=?', whereArgs: ['$id']);
  }
}
