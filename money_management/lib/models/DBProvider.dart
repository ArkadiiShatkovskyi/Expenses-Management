import 'dart:async';

import 'package:money_menagment/models/Expense.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{

  static String _dbName = "expenses";
  Future<Database> database;

  DBProvider(){
    if(database == null){
      database = _database();
    }
  }

  Future<Database> _database() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE expenses(date TEXT PRIMARY KEY, category TEXT, place TEXT, price REAL)",
        );
      },
      version: 1,
    );
  }

  // A method that retrieves all the expenses from the expenses table.
  Future<List<Expense>> expenses() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query(_dbName);

    return List.generate(maps.length, (i) {
      return Expense(
        category: maps[i]['category'],
        place: maps[i]['place'],
        price: maps[i]['price'],
        date: DateTime.parse(maps[i]['date']),
      );
    });
  }

  Future<void> deleteExpense(String date) async {
    final db = await database;

    // Remove the Expense from the Database.
    await db.delete(
      _dbName,
      where: "date = ?",
      whereArgs: [date],
    );
  }
}