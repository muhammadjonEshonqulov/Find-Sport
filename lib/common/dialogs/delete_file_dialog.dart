import 'package:flutter/cupertino.dart';

Future<bool?> sShowDeleteFileDialog({required BuildContext context}) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('Диққат'),
        content: const Text('Файлни ўчиришни хоҳлайсизми?'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            isDestructiveAction: true,
            child: const Text('Ҳа'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            isDestructiveAction: false,
            child: const Text('Йўқ'),
          ),
        ],
      );
    },
  );
}
