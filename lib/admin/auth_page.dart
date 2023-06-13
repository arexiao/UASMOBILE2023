// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart' as login;
import 'package:provider/provider.dart';
import 'package:progress1/option/auth.dart';
import 'admin_page.dart';
import 'landing.dart';

const users = {
  'farid@gmail.com': 'seokmatthew',
  'are@gmail.com': 'zerose',
  'adisha@gmail.com': 'adishaaa',
};

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUserSignUp(login.LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<Auth>(context, listen: false)
            .signup(data.name, data.password);
      } catch (err) {
        print(err);
        return err.toString();
      }
      return '';
    });
  }

  Future<String> _authUserLogin(login.LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<Auth>(context, listen: false)
            .login(data.name, data.password);
      } catch (err) {
        print(err);
        return err.toString();
      }
      return '';
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return login.FlutterLogin(
      title: 'NavUs',
      // logo: 'assets/images/ecorp-lightblue.png',
      onLogin: (loginData) => _authUserLogin(loginData),
      onSignup: (loginData) => _authUserSignUp(loginData as login.LoginData),
      onSubmitAnimationCompleted: () {
        Provider.of<Auth>(context, listen: false).tempData();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminLandingPage()),
        );
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
