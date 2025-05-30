import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/meeting_item.dart';

class MeetingDbService {
  static Database? _db;

  static Future<Database> getDatabase() async {
    if (_db != null) return _db!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'meeting_summaries.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE meetings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            filePath TEXT,
            transcript TEXT,
            summary TEXT
          )
        ''');
      },
    );

    return _db!;
  }

  static Future<void> insertMeeting(MeetingItem item) async {
    final db = await getDatabase();
    await db.insert(
      'meetings',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<MeetingItem>> getAllMeetings() async {
    final db = await getDatabase();
    final data = await db.query('meetings');
    return data.map((e) => MeetingItem.fromMap(e)).toList();
  }

  static Future<void> deleteMeeting(int id) async {
    final db = await getDatabase();
    await db.delete('meetings', where: 'id = ?', whereArgs: [id]);
  }
}
