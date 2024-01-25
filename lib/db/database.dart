import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../features/signup/model/user_data.dart';
import 'my_dao.dart';

part 'database.g.dart';

@Database(version: 3, entities: [
  UserData,
])
abstract class AppDatabase extends FloorDatabase {
  MyDao get myDao;
}