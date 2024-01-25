import 'package:flutter/cupertino.dart';

Future<bool?> sShowDeleteDataDialog({required BuildContext context}) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('Диққат'),
        content: const Text('Маълумотни ўчирмоқчимисиз?'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            isDestructiveAction: true,
            child: const Text('Ўчириш'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            isDestructiveAction: false,
            child: const Text('Чиқиш'),
          ),
        ],
      );
    },
  );
}
