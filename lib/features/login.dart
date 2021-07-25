import 'package:flutter/material.dart';

import 'package:cuit/widgets/logo.dart';
import 'package:cuit/widgets/text_input.dart';
import 'package:cuit/widgets/password_input.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: IntrinsicHeight(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        margin:
                            EdgeInsets.only(top: 16.0, right: 20.0, left: 20.0),
                        child: Logo()),
                    Expanded(
                        child: Container(
                      margin:
                          EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masuk",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color:
                                    Theme.of(context).textTheme.headline1.color,
                                fontSize: 28.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Hai! selamat datang kembali.",
                            style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextInput(
                              hintText: "Email", controller: _emailController),
                          SizedBox(
                            height: 14.0,
                          ),
                          PasswordInput(
                            hintText: "Password",
                            controller: _passwordController,
                          )
                        ],
                      ),
                    )),
                    Container(
                        margin: EdgeInsets.only(
                            right: 20.0, bottom: 30.0, left: 20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Belum punya akun?',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color,
                                      fontSize: 15.0),
                                ),
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pushNamed(context, '/signup'),
                                    child: Text("Daftar",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                .color,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0))),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                    onPressed: () {
                                      print(_emailController.text);
                                      print(_passwordController.text);
                                    },
                                    child: Text(
                                      "Masuk",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    )))
                          ],
                        ))
                  ],
                ))));
      },
    )));
  }
}
