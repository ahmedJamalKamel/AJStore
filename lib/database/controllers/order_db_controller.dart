
import 'package:scound_project_elancer/model/city.dart';
import 'package:scound_project_elancer/model/model_cart_database.dart';
import 'package:scound_project_elancer/model/model_city_todata.dart';
import 'package:sqflite/sqflite.dart';
import '../db_controller.dart';
import '../db_operations.dart';
class OrderDbController implements DbOperations<OrderData> {
  final Database _database = DbController().database;

  @override
  Future<int> create(OrderData object) async {
    // INSERT INTO contact (name, phone) VALUES ('Name','1234');
    return await _database.insert('cart', object.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    //DELETE FROM contacts;
    //DELETE FROM contacts WHERE id = 1;
    int numberOfDeletedRows = await _database.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
    return numberOfDeletedRows > 0;
  }

  @override
  Future<List<OrderData>> read() async {
    // TODO: implement read
    // SELECT * FROM contacts;
    List<Map<String, dynamic>> rowsMap = await _database.query('cart');
    return rowsMap.map((Map<String, dynamic> rowMap) => OrderData.fromMap(rowMap)).toList();
  }

  @override
  Future<OrderData?> show(int id) async {
    // SELECT * FROM contacts WHERE id = ?;
    List<Map<String, dynamic>> rows =
        await _database.query('cart', where: 'id = ?', whereArgs: [id]);
    return rows.isNotEmpty ? OrderData.fromMap(rows.first) : null;
  }

  @override
  Future<bool> update(OrderData object) async {
    //UPDATE contacts SET name = 'NAME', phone = '1234';
    //UPDATE contacts SET name = 'NAME', phone = '1234' WHERE id = ?;
    int numberOfUpdatedRows = await _database.update(
      'cart',
      object.toMap(),
      where: 'id = ?',
      whereArgs: [object.id],
    );
    return numberOfUpdatedRows > 0;
  }

  @override
  Future<bool> deleteDateToUser(int id) async{
    int numberOfDeletedRows = await _database.delete(
      'cart',
      where: 'userId = ?',
      whereArgs: [id],
    );
    return numberOfDeletedRows > 0;
  }
}
