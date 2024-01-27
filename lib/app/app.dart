import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/app/router.dart';
import 'package:find_sport/features/signup/repository/signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/add_new/repository/add_new_repository.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {


    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => SignupRepository()),
        RepositoryProvider(create: (_) => AddNewRepository()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: false,
        ),
        routerConfig: router,
      ),
    );
  }
}

void snack(BuildContext context, String mes) {
  final snackBar = SnackBar(content: Text(mes), duration: const Duration(seconds: 1));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

BuildContext? _dialogContext;

void showLoading(context) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      _dialogContext = context;
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void hideLoading() {
  if (_dialogContext != null) {
    Navigator.of(_dialogContext!).pop();
    _dialogContext = null;
  }
}
