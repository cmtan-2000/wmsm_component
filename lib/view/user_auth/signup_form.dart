import 'package:flutter/material.dart';

import '../../viewmodel/user_auth/authentication_model.dart';
import '../custom/widgets/custom_button.dart';

class WidgetSignUp extends StatefulWidget {
  const WidgetSignUp({super.key});

  @override
  State<WidgetSignUp> createState() => _WidgetSignUpState();
}

class _WidgetSignUpState extends State<WidgetSignUp> {
  final AuthenticationViewModel auth = AuthenticationViewModel();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        CustomTextButton(
          onPressed: () {},
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
