import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../controller/login_controller.dart';
import '../components/login_components.dart';

class Login extends StatefulWidget {

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _textUsernameController = TextEditingController();
  final TextEditingController _textPasswordController = TextEditingController();

  final LoginController _controller = LoginController();

  final EdgeInsets _textFormFieldPadding = const EdgeInsets.only(left: 32.0, right: 32.0);
  final String _usernameInitialValue = 'Username';
  final String _passwordInitialValue = 'Password';
  final int _maxLines = 1;
  final int _maxLength = 20;

  Future _checkLogin() async {
    _controller.checkLogin(
        _textUsernameController.text,
        _textPasswordController.text,
            (bool isValid) {
              if (isValid) {
                context.goNamed('home');
              }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: _textFormFieldPadding,
                      child: customTextFormField(
                        controller: _textUsernameController,
                        initialValue: _usernameInitialValue,
                        maxLines: _maxLines,
                        maxLength: _maxLength,
                        validator: (String? value) {
                          if (value == null && value != '') {
                            return 'Cannot user this value';
                          }
                          else {
                            return null;
                          }
                        },
                      )
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 32.0
                    ),
                    Container(
                      padding: _textFormFieldPadding  ,
                      child: customTextFormField(
                        controller: _textPasswordController,
                        initialValue: _passwordInitialValue,
                        maxLines: _maxLines,
                        maxLength: _maxLength,
                        validator: (String? value) {
                          if (value == null && value != '') {
                            return 'Cannot user this value';
                          }
                          else {
                            return null;
                          }
                        },
                      )
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 8.0
                    ),
                    Container(
                      child: TextButton(
                        onPressed: _checkLogin,
                        child: const Text('click here'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}