import 'package:flutter/material.dart';

class CustomCard extends Card {
  final String customTitle;
  final List<Widget> content;

  CustomCard({
    required this.customTitle,
    required this.content,
    Key? key,
    Widget? child,
    Color? color,
    double elevation = 1.0,
    ShapeBorder? shape,
    BorderRadius? borderRadius,
    Border? border,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    bool semanticContainer = true,
    bool? shadowColorFilled,
    bool? colorFilled,
    GestureTapCallback? onTap,
    GestureTapCallback? onLongPress,
  }) : super(
          key: key,
          color: color,
          elevation: elevation,
          // shape: shape ?? const RoundedRectangleBorder(),
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
          margin: margin,
          clipBehavior: clipBehavior ?? Clip.none,
          semanticContainer: semanticContainer,
          shadowColor: shadowColorFilled ?? true
              ? null
              : const Color.fromRGBO(0, 0, 0, 0.2),
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      // content
                      [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                      child: Text(
                        customTitle,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (content.isNotEmpty) ...content
                  ]),
            ),
          ),
        ) {}
}
