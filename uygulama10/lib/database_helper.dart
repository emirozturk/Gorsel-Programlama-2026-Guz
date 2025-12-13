import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'kisi.dart';

class DbHelper {
  static Future<Database> open() async {
    var db = await databaseFactoryFfi.openDatabase("sozler.db");
    await db.execute(
      "CREATE TABLE if not exists kisiler(id INTEGER PRIMARY KEY AUTOINCREMENT,  ad TEXT NOT NULL, soz TEXT NOT NULL)",
    );
    return db;
  }

  static Future<int> ekle(Kisi eklenecek) async {
    var db = await open();
    //db.rawInsert("Insert into kisiler VALUES(${eklenecek.id},${eklenecek.ad},${eklenecek.soz})")
    return db.insert("kisiler", eklenecek.toMap());
  }

  static Future<void> sil(int id) async {
    var db = await open();
    //db.rawDelete("Delete from kisiler where id=${id}");
    db.delete("kisiler",where: "id=?",whereArgs: [id]);
  }

  static Future<int> update(Kisi kisi) async {
    var db = await open();
    //db.rawUpdate("Update kisiler Set ad = ${kisi.ad} and soz = ${kisi.soz} where id = ${kisi.id}");
    return db.update("kisiler",kisi.toMap(),  where: "id = ?",whereArgs: [kisi.id]);
  }

  static Future<List<Kisi>> getAll() async {
    var db = await open();
    //var kayitlar = await db.rawQuery("Select * from kisiler");
    var kayitlar = await db.query("kisiler");

    /*
    List<Kisi> kisiler=[];
    for(var kayit in kayitlar){
      var nesne = Kisi.fromMap(kayit);
      kisiler.add(nesne);
    }
    return kisiler;
    */
    return kayitlar.map((e) => Kisi.fromMap(e)).toList();
  }
}
