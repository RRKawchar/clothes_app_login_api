import 'package:clothes_app_api/users/authentication/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  var isObSecure=true.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context,cons){
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
                    child: Image.asset('images/login.jpg'),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration:const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(

                          Radius.circular(60),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset:Offset(0, -3)

                          )
                        ]

                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                        child: Column(
                          children: [
                            Form(
                              key: formKey,
                                child: Column(
                                  children: [
                                   TextFormField(
                                     controller: emailController,
                                     validator: (val)=>val==""?"Please enter email":null,
                                     decoration:InputDecoration(
                                       prefixIcon:const Icon(
                                         Icons.email,color: Colors.black,
                                       ),
                                       hintText: "Email",
                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(30),
                                         borderSide:const BorderSide(
                                           color: Colors.white60
                                         )
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(30),
                                           borderSide:const BorderSide(
                                               color: Colors.white60
                                           )
                                       ),
                                       focusedBorder: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(30),
                                           borderSide:const BorderSide(
                                               color: Colors.white60
                                           )
                                       ),
                                       disabledBorder: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(30),
                                           borderSide:const BorderSide(
                                               color: Colors.white60
                                           )
                                       ),
                                       contentPadding:const EdgeInsets.symmetric(
                                         horizontal: 14,
                                         vertical: 6
                                       ),
                                       fillColor: Colors.white,
                                       filled: true
                                     ),
                                   ),
                                    const SizedBox(height: 18,),

                                    Obx(() => TextFormField(
                                      controller: passwordController,
                                      obscureText: isObSecure.value,
                                      validator: (val)=>val==""?"Please enter password":null,
                                      decoration:InputDecoration(
                                          prefixIcon:const Icon(
                                            Icons.vpn_key_sharp,color: Colors.black,
                                          ),
                                          suffixIcon: Obx(
                                                  ()=>GestureDetector(
                                                onTap: (){
                                                  isObSecure.value=!isObSecure.value;
                                                },
                                                child: Icon(
                                                  isObSecure.value? Icons.visibility_off:Icons.visibility,
                                                  color: Colors.black,

                                                ),
                                              )
                                          ),
                                          hintText: "Password",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          contentPadding:const EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 6
                                          ),
                                          fillColor: Colors.white,
                                          filled: true
                                      ),
                                    )),
                                    const SizedBox(height: 18,),
                                    Material(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30),
                                      child: InkWell(
                                        onTap: (){

                                        },
                                        borderRadius: BorderRadius.circular(30),
                                        child:const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 28,
                                          ),
                                          child: Text("Login",style: TextStyle(fontSize: 16,color: Colors.white),),
                                        ),
                                      ),
                                    )


                                  ],
                                )
                            ),

                            const SizedBox(height:16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               const Text("Don't have an account?"),
                                TextButton(
                                    onPressed: (){

                                      Get.to( SignUpScreen());
                                    },
                                    child:const Text("SignUp Here",style: TextStyle(color: Colors.black,fontSize: 16),)
                                )
                              ],
                            ),
                            const Text("Or",style: TextStyle(fontSize: 16,color: Colors.grey,letterSpacing: 3),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Are you an admin?"),
                                TextButton(
                                    onPressed: (){},
                                    child:const Text("Click Here",style: TextStyle(color: Colors.black,fontSize: 16),)
                                )
                              ],
                            )
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
