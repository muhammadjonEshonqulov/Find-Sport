import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/app/router.dart';
import 'package:find_sport/db/cache.dart';
import 'package:flutter/material.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> with TickerProviderStateMixin {
  List<Map> json = [
    {'id': "0", 'name': 'Russian', 'icon': 'assets/images/ic_ru.png'},
    {'id': "1", 'name': 'Uzbek', 'icon': 'assets/images/ic_uz.png'},
    {'id': "2", 'name': 'Kiril', 'icon': 'assets/images/ic_uz.png'},
  ];
  String _selectedValue = '';

  @override
  void initState()  {
    // int currentLanguage = await cache.getInt(cache.language) ?? 0;
    // if (currentLanguage == 0) {
    //   context.setLocale(Locale('ru'));
    // } else {
    //   context.setLocale(Locale('ru'));
    // }
    // context.setLocale(Locale('ru'));
    _selectedValue = json[0]['id'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.bottomCenter, children: [
      Center(
        child: Container(width: 250, height: 75, child: Image.asset("assets/images/app_logo.png")),
      ),
      Container(
          width: 260,
          height: 135,
          margin: EdgeInsets.only(bottom: 150),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("languages".tr(), style: TextStyle(color: Colors.black, fontFamily: "Mulish", fontWeight: FontWeight.w400)),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Border color
                  borderRadius: BorderRadius.circular(8.0), // Border radius
                ),
                padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.only(top: 10),
                child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    onChanged: (newValue) {
                      setState(() {
                        _selectedValue = newValue.toString();
                      });
                      switch (newValue) {
                        case "0":
                          context.setLocale(Locale('ru'));
                          cache.setInt(cache.language, 0);
                          break;
                        case "1":
                          context.setLocale(Locale('uz'));
                          cache.setInt(cache.language, 1);
                          break;
                        case "2":
                          context.setLocale(Locale('ky'));
                          cache.setInt(cache.language, 2);
                          break;
                      }
                    },
                    value: _selectedValue,
                    items: json.map((value) {
                      return DropdownMenuItem(
                        value: value['id'].toString(),
                        child: Row(
                          children: [
                            Image.asset(
                              value['icon'],
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              value['name'],
                              style: TextStyle(color: Colors.black, fontFamily: "Mulish", fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ))),
          ])),
      InkWell(
        onTap: () => {
          // router.go(Routes.signup) // may be go
          router.push(Routes.signup)
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 110),
          child: Image.asset(
            'assets/images/start_btn.png',
            width: 70,
            height: 70,
          ),
        ),
      ),
    ]));
  }
}
