import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'common/services/language/lang_json.dart';
import 'db/database.dart';
import 'db/my_dao.dart';

late MyDao myDao;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  AppDatabase appDatabase = (await $FloorAppDatabase.databaseBuilder('app_database.db').build());
  myDao = appDatabase.myDao;


  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('ru'),
      Locale('uz'),
      Locale('ky'),
    ],
    path: 'assets/lang',
    assetLoader: JsonAssetLoader(),
    fallbackLocale: const Locale('uz'),
    child: const App(),
  ));
}
