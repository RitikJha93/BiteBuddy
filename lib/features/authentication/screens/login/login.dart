import 'package:bitebuddy/common/styles/spacing_styles.dart';
import 'package:bitebuddy/features/authentication/screens/login/widgets/login_form.dart';
import 'package:bitebuddy/features/authentication/screens/login/widgets/login_header.dart';
import 'package:bitebuddy/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: TSpacingStyles.paddingWithAppbarheight,
            child: Column(
              children: [
                //Header
                LoginHeader(isDark: isDark),
                //Form Design
                const LoginForm()
              ],
            )),
      ),
    );
  }
}
