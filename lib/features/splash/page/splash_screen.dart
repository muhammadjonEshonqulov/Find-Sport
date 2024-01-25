import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../app/router.dart';
import '../../../common/services/utils/utils.dart';
import '../../../generated/assets.dart';
import '../repository/me_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  @override
  void initState() {
    init();
    super.initState();
  }


  late AnimationController _animatedController;
  late CurvedAnimation _curvedAnimation;


  init() {
    _animatedController = AnimationController(duration: const Duration(seconds: 1), vsync: this)
      ..forward()
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          // if need check token is exist or not
          router.go(Routes.choose_language);
        }
      });
    _curvedAnimation = CurvedAnimation(parent: _animatedController, curve: Curves.elasticOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Container(width: 250, height: 75, child: Image.asset("assets/images/app_logo.png")
    )
    ,
    ));}
}
