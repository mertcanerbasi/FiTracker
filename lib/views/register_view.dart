import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/models/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

import '../managers/font_manager.dart';
import '../managers/routes_manager.dart';
import '../managers/strings_manager.dart';
import '../managers/styles_manager.dart';
import '../managers/values_manager.dart';
import '../services/auth.dart';
import '../services/firestore_service.dart';
import '../widgets/common_buttons.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorManager.primary),
      ),
      backgroundColor: ColorManager.white,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.signUpText,
                    style: getBoldStyle(
                        color: Colors.black, fontSize: FontSize.s32),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: AppStrings.username,
                    ),
                    style: getRegularStyle(color: Colors.black),
                    validator: (value) {
                      // Check if this field is empty
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }

                      // using regular expression
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please enter a valid email address";
                      }

                      // the email is valid
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_passVisible,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: AppStrings.password,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passVisible = !_passVisible;
                              });
                            },
                            icon: Icon(
                              _passVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: ColorManager.primary,
                            ))),
                    style: getRegularStyle(color: Colors.black),
                    validator: (value) {
                      // Check if this field is empty
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }

                      // using regular expression
                      if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$')
                          .hasMatch(value)) {
                        return "Password should be minimum 6 characters and should contain\n at least one letter and one number";
                      }

                      // the email is valid
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () async {
                      _createAccount(provider: "Mail");
                    },
                    child: CommonButton(
                      buttonColor: ColorManager.primary,
                      buttonText: AppStrings.signUpText,
                      fontSize: FontSize.s16,
                      height: AppSize.s40,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: ColorManager.black,
                        height: 1,
                        width: 50,
                      ),
                      Text(" Or ",
                          style: getRegularStyle(color: ColorManager.black)),
                      Container(
                        color: ColorManager.black,
                        height: 1,
                        width: 50,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {
                      _createAccount(provider: "Google");
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(AppStrings.alreadyHaveAccount,
                      style: getRegularStyle(color: ColorManager.primary)),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.loginRoute,
                        (Route<dynamic> route) => true,
                      );
                    },
                    child: CommonButton(
                      buttonColor: ColorManager.darkPrimary,
                      buttonText: AppStrings.loginText,
                      fontSize: FontSize.s16,
                      height: AppSize.s40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _createAccount({required String provider}) async {
    final _authService = Provider.of<AuthService>(context, listen: false);

    if (provider == "Mail") {
      var _formState = _formKey.currentState;
      if (_formState!.validate()) {
        _formState.save();

        try {
          AppUsers? user = await _authService.signupWithMail(
              _emailController.text, _passwordController.text);
          if (user != null) {
            FireStoreService().createUser(user.id, user.email, user.userName);
          }
          Navigator.pop(context);
        } on FirebaseAuthException catch (error) {
          var errorMessage = _showError(errorCode: error.code);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(errorMessage),
            duration: const Duration(seconds: 1),
          ));
        }
      }
    } else if (provider == "Google") {
      AppUsers? user = await _authService.loginWithGoogle();
      if (FireStoreService().searchUser(user!.id) == null) {
        FireStoreService().createUser(user.id, user.email, user.userName);
      }

      Navigator.pop(context);
    }
  }

  _showError({required errorCode}) {
    String errorMessage = '';
    if (errorCode == 'invalid-email') {
      errorMessage = 'Invalid Mail';
    } else if (errorCode == 'weak-password') {
      errorMessage = 'Weak Password';
    } else if (errorCode == 'email-already-in-use') {
      errorMessage = 'Mail is already in use';
    }
    return errorMessage;
  }
}
