import 'package:flutter/material.dart';

class CustomElevatedButton extends ElevatedButton {
  CustomElevatedButton({
    required BuildContext context,
    Key? key,
    required VoidCallback onPressed,
    required Widget child,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip? clipBehavior,
  }) : super(
          key: key,
          onPressed: onPressed,
          style:
              ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior ?? Clip.none,
          child: child,
        );
}
