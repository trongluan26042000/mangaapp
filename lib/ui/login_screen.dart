import 'package:flutter/material.dart';
import 'package:mangaapp/common/theme_helper.dart';
import 'package:mangaapp/widgets/header_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final double _headerHeight = 250;
  final Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight,true,Icons.login_rounded),
            ),
            SafeArea(
              child: Container(
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: [
                             TextField(
                              decoration: ThemeHelper().textInputDecoration('User Name','Enter your user name'),
                            ),
                            const SizedBox(height: 30.0),
                            TextField(
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration( 'Password', 'Enter your password'),
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              child: const Text('Forgot your password'),
                            ),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: const Text('Sign in'),
                            ),
                            Container(
                              child: const Text('Don\'t account? Create'),
                            ),
                          ],

                        ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
