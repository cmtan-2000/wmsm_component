import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    required BuildContext context,
    Key? key,
    required bool isNumberOnly,
    required TextEditingController controller,
    String? hintText,
    IconData? icon,
  }) : super(
          key: key,
          controller: controller,
          keyboardType:
              isNumberOnly == true ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText ?? 'Default_Hint',
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            prefixIcon: icon?.codePoint != null ? Icon(icon) : null,
          ),
          inputFormatters: [
            isNumberOnly == true
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.singleLineFormatter
          ],
          cursorColor: Theme.of(context).primaryColor,
        );
}


// class CustomTextField extends TextFormField {
//   final String label;
//   final TextEditingController controller;
//   final IconData? icon;
//   final bool isNumberOnly;
//   final int maxLines;

//   CustomTextField(
//     this.maxLines, {
//     super.key,
//     required this.label,
//     required this.controller,
//     this.icon,
//     required this.isNumberOnly,
//   });

//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         border: Border.all(
//           color: Theme.of(context).primaryColor,
//           width: 2.0,
//         ),
//       ),
//       child: TextFormField(
//         controller: controller,
//         keyboardType:
//             isNumberOnly == true ? TextInputType.number : TextInputType.text,
//         decoration: InputDecoration(
//           labelText: label,
//           hintText: label,
//           filled: true,
//           fillColor: Colors.grey[200],
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide.none,
//           ),
//           icon: Icon(icon),
//         ),
//         maxLines: maxLines,
//         inputFormatters: [
//           isNumberOnly == true
//               ? FilteringTextInputFormatter.digitsOnly
//               : FilteringTextInputFormatter.singleLineFormatter
//         ],
//       ),
//     );
//   }
// }
