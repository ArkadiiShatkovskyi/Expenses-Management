import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Expense.dart';

class DBProvider{

  static String _dbName = "expenses";
  Future<Database> database;

  DBProvider(){
    _getInstance();
  }

  Future<Database> _getInstance(){
    if(database == null){
      database = _database();
    }
    return database;
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

  Future<Map<String, double>> expensesByGroup() async {

    Map<String, double> dataMap = {
      "Food": 0.0,
      "Electronic": 0.0,
      "Food delivery": 0.0,
      "Clothes": 0.0,
      "Vape": 0.0,
      "Other": 0.0,
    };

    List<Expense> listOfElements = await expenses();

    //print("LIST: " + listOfElements.toString());

    for(Expense e in listOfElements){
      dataMap.forEach((key, value) { if(key == e.category) dataMap.update(key, (dynamic val) => val + e.price);});
    }

    return dataMap;
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

  Future<void> clearDataBase() async {
    final db = await database;

    // Remove the Expense from the Database.
    await db.delete(_dbName);
  }

  Future<void> insertExpense(Expense expense) async {
    final Database db = await database;

    await db.insert(
      _dbName,
      expense.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void closeDBConnection() async {
    final Database db = await database;
    db.close();
  }
}