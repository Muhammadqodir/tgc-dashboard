import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tgc_app/models/invoice.dart';
import 'package:tgc_app/models/product.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static const String invoiceTable = "invoices";
  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'invoice_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $invoiceTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name TEXT, 
            dateTime TEXT, 
            list TEXT
          )
          ''',
        );
      },
      version: 1,
    );
  }
  
  Future<void> insertInvoice(Invoice invoice) async {
    final db = await database;
    await db.insert(
      invoiceTable,
      invoice.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  
  Future<List<Invoice>> getInvoices() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(invoiceTable);

    return List.generate(maps.length, (i) {
      return Invoice.fromMap(maps[i]);
    });
  }
  
  Future<void> updateInvoice(Invoice invoice) async {
    final db = await database;
    await db.update(
      invoiceTable,
      invoice.toMap(),
      where: 'id = ?',
      whereArgs: [invoice.id],
    );
  }

  Future<void> deleteInvoice(int id) async {
    final db = await database;
    await db.delete(
      invoiceTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
