import 'package:clothes_app_api/utility/validator.dart';
import 'package:flutter/material.dart';

class LoginProvider extends StatefulWidget {
  const LoginProvider({Key? key}) : super(key: key);

  @override
  State<LoginProvider> createState() => _LoginProviderState();
}

class _LoginProviderState extends State<LoginProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 15.0,),
                Text("Email"),
                const SizedBox(height: 5.0,),
                TextFormField(
                  autofocus: false,
                  validator: validateEmail,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
