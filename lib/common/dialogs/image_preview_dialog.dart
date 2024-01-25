import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

Future<bool?> sShowImagePreviewDialog({
  required BuildContext context,
  required Uint8List bytes,
}) async {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('Расм'),
        content: Image.memory(bytes),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            isDestructiveAction: false,
            child: const Text('Сақлаш'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            isDestructiveAction: false,
            child: const Text('Бекор қилиш'),
          ),
        ],
      );
    },
  );
}
