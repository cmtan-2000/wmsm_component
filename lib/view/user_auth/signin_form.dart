// ignore_for_file: deprecated_member_use, camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:wmsm_component/view/user_auth/signup_form.dart';

import '../../viewmodel/user_auth/authentication_model.dart';
import '../custom/widgets/custom_button.dart';
import '../custom/widgets/custom_elevatedbutton.dart';
import '../custom/widgets/custom_textformfield.dart';
import '../shared/passcode_field.dart';
import '../shared/phone_number_field.dart';

class WidgetSignIn extends StatefulWidget {
  const WidgetSignIn({super.key});

  @override
  State<WidgetSignIn> createState() => _WidgetSignInState();
}

class _WidgetSignInState extends State<WidgetSignIn> {
  final AuthenticationViewModel auth = AuthenticationViewModel();
  final TextEditingController _phoneController = TextEditingController();
  final AuthenticationViewModel authfunc = AuthenticationViewModel();

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Sign In',
            style: Theme.of(context).textTheme.headline1,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PHONE NUMBER',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 10,
                ),
                phoneNumberField(
                  phoneController: _phoneController,
                ),
              ],
            ),
          ),
          Container(
            // padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PASSCODE',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const passCodeField(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextButton(
                onPressed: () => print('Rest Password'),
                child: const Text('Reset Password'),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  context: context,
                  onPressed: () => authfunc.login(),
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
          const WidgetSignUp()
        ]);
  }
}

class _buildPhoneInputField extends StatelessWidget {
  const _buildPhoneInputField({required TextEditingController phoneController})
      : _phoneController = phoneController;

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30,
          height: 30,
          child: Image.network(
            'https://flagsapi.com/MY/flat/64.png',
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset("assets/images/64.png");
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: CustomTextFormField(
            context: context,
            isNumberOnly: true,
            controller: _phoneController,
            icon: Icons.phone,
          ),
        )
      ],
    );
  }
}

// class _buildPhoneInputField extends StatelessWidget {
//   const _buildPhoneInputField({required TextEditingController phoneController})
//       : _phoneController = phoneController;

//   final TextEditingController _phoneController;

//   @override
//   Widget build(BuildContext context) {
//     return CustomTextField(
//       label: 'Phone No',
//       controller: _phoneController,
//       isNumberOnly: true,
//     );
//   }
// }

class _buildCountryCodeSelector extends StatelessWidget {
  const _buildCountryCodeSelector();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 30,
        height: 30,
        child: Image.network(
          'https://flagsapi.com/MY/flat/64.png',
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset('assets/images/64.png');
          },
        ));
  }
}
