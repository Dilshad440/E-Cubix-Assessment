import 'dart:async';

import 'package:e_cubox_assesment/core/constant/app_constant.dart';
import 'package:e_cubox_assesment/src/features/employee/models/entity/employee_entity.dart';
import 'package:e_cubox_assesment/src/features/employee/models/response/employee_response.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

mixin class SqfLiteService {
  Future<Database> _initializeDb({Details? data}) async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, AppConstant.databaseName),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE ${AppConstant.tableName}(${createColumns(data?.toJson() ?? Details().toJson())})",
        );
      },
      version: 1,
    );
  }

  Future<EmployeeEntity> insertIntoDb(EmployeeEntity data) async {
    for (Details v in data.employee ?? []) {
      final db = await _initializeDb(data: v);

      await db.insert(
        AppConstant.tableName,
        v.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return data;
  }

  Future<EmployeeEntity> getFromDb() async {
    final db = await _initializeDb();
    final data = await db.query(AppConstant.tableName);
    return EmployeeEntity(
      employee: data.map((e) => Details.fromJson(e)).toList(),
    );
  }

  Future<EmployeeEntity> onSearchInDb({String? val, String? colum}) async {
    final db = await _initializeDb();
    if (val == null || val.isEmpty) {
      return getFromDb();
    } else {
      final data = await db.query(
        AppConstant.tableName,
        where: 'varDrName LIKE ?',
        whereArgs: ['%$val%'],
      );

      return EmployeeEntity(
        employee: data.map((e) => Details.fromJson(e)).toList(),
      );
    }
  }

  Future<int> updateInDb({required Details newData}) async {
    final db = await _initializeDb();
    return await db.update(
      AppConstant.tableName,
      newData.toJson(),
      where: 'varEmpCode = ?',
      whereArgs: [newData.varEmpCode],
    );
  }

  Future<int> deleteInDb({required String id}) async {
    final db = await _initializeDb();
    return await db.delete(
      AppConstant.tableName,
      where: 'varEmpCode = ?',
      whereArgs: [id],
    );
  }

  String createColumns(Map<dynamic, dynamic> map) {
    String column = ' ';
    map.forEach((key, value) {
      column += '$key ${getType(value.runtimeType)},';
    });
    final result = column.endsWith(',') ? column.substring(0, column.length - 2) : column;
    return result;
  }

  String getType(Type type) {
    switch (type) {
      case int:
        return "INTEGER";
      case String:
        return "TEXT";
      case double:
        return "REAL";
      case num:
        return "NUMERIC";
      case bool:
        return "BOOLEAN";
      default:
        return "TEXT";
    }
  }
}
