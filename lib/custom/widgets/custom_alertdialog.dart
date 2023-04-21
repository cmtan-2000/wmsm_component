// ignore_for_file: empty_constructor_bodies, prefer_const_constructors, overridden_fields, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:wmsm_component/custom/widgets/custom_button.dart';
import 'package:wmsm_component/custom/widgets/custom_elevatedbutton.dart';
class CustomAlertDialog extends AlertDialog {
  final BuildContext context;
  final double maxWidthDialog;
  final void Function() onConfirm;
  final void Function() onCancel;
  final bool toColumn;
  final bool toExpanded;
  @override
  final EdgeInsets? iconPadding, titlePadding, contentPadding, actionPadding;
  @override
  final TextStyle? titleTextStyle, contentTextStyle;
  @override
  final Widget? title, icon, contentBody;
  @override
  final Color? iconColor;

  CustomAlertDialog({
    Key? key,
    required this.context,
    required this.maxWidthDialog,
    this.icon,
    this.iconColor,
    this.iconPadding,
    required this.title,
    this.titlePadding,
    this.titleTextStyle,
    required this.contentBody,
    this.contentPadding,
    this.contentTextStyle,
    this.actionPadding,
    required this.toColumn,
    required this.toExpanded,
    required this.onConfirm,
    required this.onCancel,
  }) : super(
          key: key,
          icon: icon,
          iconColor: iconColor ?? Colors.orange,
          iconPadding: iconPadding ?? EdgeInsets.all(10),
          title: title,
          titlePadding: titlePadding,
          titleTextStyle: titleTextStyle,
          content: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * maxWidthDialog,
              ),
              child: contentBody),
          contentPadding: contentPadding ?? EdgeInsets.all(10),
          contentTextStyle: contentTextStyle,
          actions: [
            if (toColumn)
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 0,
                ),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                                context: context,
                                onPressed: onConfirm,
                                child: const Text('Confirm')),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextButton(
                              onPressed: onCancel,
                              child: Text('Cancel'),
                            ),
                          ),
                        ],
                      ),
                    ]),
              )
            else if (toExpanded)
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextButton(
                        onPressed: onCancel,
                        child: Text('Cancel'),
                      ),
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        context: context,
                        onPressed: onConfirm,
                        child: Text('Confirm'),
                      ),
                    )
                  ],
                ),
              )
            else
              Wrap(
                children: [
                  CustomTextButton(
                    onPressed: onCancel,
                    child: Text('Cancel'),
                  ),
                  CustomElevatedButton(
                    context: context,
                    onPressed: onConfirm,
                    child: Text('Confirm'),
                  )
                ],
              ),
          ],
          actionsPadding: actionPadding ?? EdgeInsets.all(10),
        );
}
