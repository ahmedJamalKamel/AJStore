
import 'package:scound_project_elancer/model/city.dart';
import 'package:scound_project_elancer/model/model_city_todata.dart';
import 'package:sqflite/sqflite.dart';
import '../db_controller.dart';
import '../db_operations.dart';
class CityDbController implements DbOperations<CityData> {
  final Database _database = DbController().database;

  @override
  Future<int> create(CityData object) async {
    // INSERT INTO contact (name, phone) VALUES ('Name','1234');
    return await _database.insert('cities', object.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    //DELETE FROM contacts;
    //DELETE FROM contacts WHERE id = 1;
    int numberOfDeletedRows = await _database.delete(
      'cities',
      where: 'id = ?',
      whereArgs: [id],
    );
    return numberOfDeletedRows > 0;
  }

  @override
  Future<List<CityData>> read() async {
    // TODO: implement read
    // SELECT * FROM contacts;
    List<Map<String, dynamic>> rowsMap = await _database.query('cities');
    return rowsMap.map((Map<String, dynamic> rowMap) => CityData.fromMap(rowMap)).toList();
  }

  @override
  Future<CityData?> show(int id) async {
    // SELECT * FROM contacts WHERE id = ?;
    List<Map<String, dynamic>> rows =
        await _database.query('cities', where: 'id = ?', whereArgs: [id]);
    return rows.isNotEmpty ? CityData.fromMap(rows.first) : null;
  }

  @override
  Future<bool> update(CityData object) async {
    //UPDATE contacts SET name = 'NAME', phone = '1234';
    //UPDATE contacts SET name = 'NAME', phone = '1234' WHERE id = ?;
    int numberOfUpdatedRows = await _database.update(
      'cities',
      object.toMap(),
      where: 'id = ?',
      whereArgs: [object.id],
    );
    return numberOfUpdatedRows > 0;
  }

  @override
  Future<bool> deleteDateToUser(int id) {
    // TODO: implement deleteDateToUser
    throw UnimplementedError();
  }
}
