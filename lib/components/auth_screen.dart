// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mops_dapp/components/custom_button.dart';
import 'package:mops_dapp/components/custom_textField.dart';
import 'package:mops_dapp/service/auth_service.dart';

enum Auth { signIn, signUp }

class AuthScreen extends StatefulWidget {
  static const String routeName = './auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUp() {
    authService.signUpUser(
      context: context,
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  void signIn() {
    authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              ListTile(
                tileColor:
                    _auth == Auth.signUp ? Colors.white : Colors.grey[100],
                title: Text(
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    activeColor: Colors.amber[600],
                    value: Auth.signUp,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.signUp)
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: nameController,
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            onPressed: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUp();
                              }
                            },
                            text: 'Sign Up'),
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor:
                    _auth == Auth.signIn ? Colors.white : Colors.grey[100],
                title: Text(
                  'Sign In',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    activeColor: Colors.amber[600],
                    value: Auth.signIn,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.signIn)
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            onPressed: () {
                              if (_signInFormKey.currentState!.validate()) {}
                              signIn();
                            },
                            text: 'Sign In'),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
