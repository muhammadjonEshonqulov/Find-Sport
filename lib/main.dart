import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'app/app.dart';
import 'common/services/language/lang_json.dart';
import 'db/database.dart';
import 'db/my_dao.dart';

late MyDao myDao;
void main() async {
  AndroidYandexMap.useAndroidViewSurface = false;
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
    fallbackLocale: const Locale('ru'),
    child:  App(),
  ));
}


// import 'package:flutter/material.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';
//
//
// void main() {
//   runApp( MainPage());
// }
//
// class MainPage extends StatelessWidget {
//   const MainPage({ Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('YandexMap examples')),
//         body: Column(
//             children: <Widget>[
//               Expanded(
//                   child: Container(
//                       padding: const EdgeInsets.all(8),
//                       child: const Text("data")
//                   )
//               ),
//             ]
//         )
//     );
//   }
// }