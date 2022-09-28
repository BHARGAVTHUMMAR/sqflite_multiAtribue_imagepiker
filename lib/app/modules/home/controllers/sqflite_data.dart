import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class dbclass {
  static Future<Database> dbcreate() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'product.db');
    print(path);

    Database database = await openDatabase(
      path,
      version: 2,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute('create table product(id integer primary key,'
            'a1 text,'
            'a2 text,'
            'a3 text,'
            'a4 text,'
            'color text,'
            'size text,'
            'model text,'
            'height text,'
            'width text,'
            'weight text,'
            'mfg text,'
            'other text,'
            'image text,'
            'fav integer)');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await db
            .execute('alter table product add column fav integer default 0');
      },
    );
    return database;
  }
}
