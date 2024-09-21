import 'package:mizan_app/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  Database? database;
  //----------------------------------------------------------------------------
  getDataBase() async {
    if (database != null) {
      return database;
    } else {
      database = await initialDB();
      return database;
    }
  }

//------------------------------------------------------------------------------
  initialDB() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) {
        Batch batch = database.batch();
        batch.execute('''
          CREATE TABLE notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT
          );
        ''');
        batch.commit();
      },
    );
  }

  insertNote(NoteModel note) async {
    Database db = await getDataBase();
    Batch batch = db.batch();
    batch.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    batch.commit();
  }

  loadNote() async {
    Database db = await getDataBase();
    List<Map> maps = await db.query('notes');
    return List.generate(maps.length, (index) {
      return NoteModel(
        id: maps[index]['id'],
        title: maps[index]['title'],
        description: maps[index]['description'],
      );
    });
  }

  updateNote(NoteModel note) async {
    Database db = await getDataBase();
    Batch batch = db.batch();
    batch.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
    batch.commit();
  }

  deleteNote(int id) async {
    Database db = await getDataBase();
    Batch batch = db.batch();
    batch.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
    batch.commit();
  }

  deleteAllNotes() async {
    Database db = await getDataBase();
    Batch batch = db.batch();
    batch.delete(
      'notes',
    );
    batch.commit();
  }
}
