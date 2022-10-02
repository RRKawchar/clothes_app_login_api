import 'dart:convert';

import 'package:clothes_app_api/api_connection/api_connection.dart';
import 'package:clothes_app_api/users/authentication/login_screen.dart';
import 'package:clothes_app_api/users/model/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isObSecure = true.obs;

  validateUserEmail() async {
    try {
      var res = await http.post(Uri.parse(API.validateEmail), body: {
        "user_email": emailController.text.trim(),
      });

      if (res.statusCode == 200) {
        var resBodyOfValidateEmail = jsonDecode(res.body.toString());

        if (resBodyOfValidateEmail['emailFound'] == true) {
          Fluttertoast.showToast(
              msg: "This  email is already used. Try another email.");
        } else {
          registerAndSaveUserRecord();
        }
      }
    } catch (e) {

      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());

    }
  }

  registerAndSaveUserRecord() async {
    User userModel = User(
      1,
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    try {
      var res=await http.post(Uri.parse(API.signUp),

          body: userModel.toJson(),

      );

      if(res.statusCode==200){

       var resBodyOfSignUp=jsonDecode(res.body.toString());

       if(resBodyOfSignUp['succes']==true){

         Fluttertoast.showToast(msg: "Congratulations!!. You are Sign Up Successfully!");
       }else{

         Fluttertoast.showToast(msg: "Error Occurred. Try Again......");
       }
      }


    } catch (e) {

     print(e.toString());
     Fluttertoast.showToast(msg: e.toString());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, cons) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 285,
                    child: Image.asset('images/register.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                color: Colors.black26,
                                offset: Offset(0, -3))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                        child: Column(
                          children: [
                            Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: nameController,
                                      validator: (val) => val == ""
                                          ? "Please enter name"
                                          : null,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.person,
                                            color: Colors.black,
                                          ),
                                          hintText: "Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60)),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 14, vertical: 6),
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    TextFormField(
                                      controller: emailController,
                                      validator: (val) => val == ""
                                          ? "Please enter email"
                                          : null,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.email,
                                            color: Colors.black,
                                          ),
                                          hintText: "Email",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60)),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 14, vertical: 6),
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Obx(() => TextFormField(
                                          controller: passwordController,
                                          obscureText: isObSecure.value,
                                          validator: (val) => val == ""
                                              ? "Please enter password"
                                              : null,
                                          decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.vpn_key_sharp,
                                                color: Colors.black,
                                              ),
                                              suffixIcon:
                                                  Obx(() => GestureDetector(
                                                        onTap: () {
                                                          isObSecure.value =
                                                              !isObSecure.value;
                                                        },
                                                        child: Icon(
                                                          isObSecure.value
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons
                                                                  .visibility,
                                                          color: Colors.black,
                                                        ),
                                                      )),
                                              hintText: "Password",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white60)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white60)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white60)),
                                              disabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white60)),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 14,
                                                      vertical: 6),
                                              fillColor: Colors.white,
                                              filled: true),
                                        )),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Material(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30),
                                      child: InkWell(
                                        onTap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            validateUserEmail();
                                          }
                                        },
                                        borderRadius: BorderRadius.circular(30),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 28,
                                          ),
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account?"),
                                TextButton(
                                    onPressed: () {
                                      Get.to(LoginScreen());
                                    },
                                    child: const Text(
                                      "Login Here",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
