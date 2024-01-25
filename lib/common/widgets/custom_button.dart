import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool enabled;
  final void Function() onPressed;
  final String title;
  final Color color;
  final Color? titleColor;
  final Color? iconColor;
  final IconData? firstIcon;
  final double? height;
  final double? width;

  const CustomButton({
    super.key,
    this.enabled = true,
    required this.onPressed,
    required this.title,
    required this.color,
    this.height,
    this.width,
    this.firstIcon,
    this.titleColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 0.0;
              return 0.0;
            },
          ),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        onPressed: enabled ? onPressed : null,
        child: enabled
            ? MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    firstIcon != null
                        ? Icon(
                            firstIcon,
                            color:
                                (iconColor != null) ? iconColor : Colors.white,
                          )
                        : Container(),
                    Text(title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: titleColor != null
                                ? titleColor
                                : Colors.white)),
                  ],
                ),
              )
            : CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}
