import 'package:flutter/material.dart';

import '../controller/login_controller.dart';

class Login extends StatefulWidget {

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textUsernameController = TextEditingController();
  final TextEditingController _textPasswordController = TextEditingController();
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFormField(
                  key: _formKey,
                  controller: _textUsernameController,
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
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFormField(
                  key: _formKey,
                  controller: _textPasswordController,
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
                  child: Text('click here'),
                  onPressed: () {
                    _controller.checkLogin(
                        _textUsernameController.value.text,
                        _textPasswordController.value.text);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}