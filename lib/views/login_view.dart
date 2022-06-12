// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/managers/color_manager.dart';
import 'package:fitness_app/managers/font_manager.dart';
import 'package:fitness_app/managers/strings_manager.dart';
import 'package:fitness_app/managers/styles_manager.dart';
import 'package:fitness_app/managers/values_manager.dart';
import 'package:fitness_app/widgets/common_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

import '../managers/routes_manager.dart';
import '../models/users.dart';
import '../services/auth.dart';
import '../services/firestore_service.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passVisible = false;
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    AppStrings.loginText,
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
                        prefixIcon: const Icon(Icons.lock),
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
                      if (_formKey.currentState!.validate()) {
                        try {
                          await authService.loginWithMail(
                              _emailController.text, _passwordController.text);
                        } on FirebaseException catch (error) {
                          var errorMessage = _showError(errorCode: error.code);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(errorMessage),
                              duration: const Duration(seconds: 1)));
                        }
                      }
                    },
                    child: CommonButton(
                      buttonColor: ColorManager.primary,
                      buttonText: AppStrings.loginText,
                      fontSize: FontSize.s16,
                      height: AppSize.s40,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(AppStrings.forgotPassword,
                      style: getRegularStyle(color: ColorManager.primary)),
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
                    onPressed: () async {
                      AppUsers? user = await authService.loginWithGoogle();
                      AppUsers? registeredUser =
                          await FireStoreService().searchUser(user!.id);
                      if (registeredUser == null) {
                        await FireStoreService()
                            .createUser(user.id, user.email, user.userName);
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(AppStrings.dontHaveAccount,
                      style: getRegularStyle(color: ColorManager.primary)),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.registerRoute,
                      );
                    },
                    child: CommonButton(
                      buttonColor: ColorManager.darkPrimary,
                      buttonText: AppStrings.signUpText,
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

  _showError({required errorCode}) {
    String errorMessage = '';
    if (errorCode == 'invalid-email') {
      errorMessage = 'Invalid Mail';
    } else if (errorCode == 'wrong-password*') {
      errorMessage = 'Wrong Password';
    } else if (errorCode == 'too-many-requests') {
      errorMessage = 'You sent too many requests';
    }
    return errorMessage;
  }
}
