import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _loginForm(),
                _buttonWidget(),
                _registerPageLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: _deviceHeight! * 0.20,
      child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_emailTextField(), _passwordTextField()],
          )),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Email.."),
      onSaved: (_value) {
        setState(() {
          email = _value;
        });
      },
      validator: (_value) {
        bool _result = _value!.contains(RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"));
        return _result ? null : "Please Enter email";
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
        obscureText: true,
        decoration: const InputDecoration(hintText: "Password.."),
        onSaved: (_value) {
          setState(() {
            password = _value;
          });
        },
        validator: (_value) =>
            _value!.length > 6 ? null : "Please Enter Password ");
  }

  Widget _titleWidget() {
    return const Text(
      "Ahmmed",
      style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
    );
  }
  /* @todo */

  Widget _buttonWidget() {
    return MaterialButton(
      onPressed: _loginUser,
      minWidth: _deviceHeight! * 0.70,
      height: _deviceHeight! * 0.06,
      color: Colors.red,
      child: const Text(
        "Login",
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _registerPageLink() {
    return GestureDetector(
      child: const Text(
        "don't have an account ?",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 15,
          fontWeight: FontWeight.w200,
        ),
      ),
      onTap: () => Navigator.pushNamed(context, 'register'),
    );
  }

  void _loginUser() {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
    }
  }
}
