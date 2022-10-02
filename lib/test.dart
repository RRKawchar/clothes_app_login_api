import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Testtttt extends StatefulWidget {
  const Testtttt({Key? key}) : super(key: key);

  @override
  State<Testtttt> createState() => _TestttttState();
}

class _TestttttState extends State<Testtttt> {

  final formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  var isObSecure=true;


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

                  Container(
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
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: isObSecure,
                                  validator: (val)=>val==""?"Please enter password":null,
                                  decoration:InputDecoration(
                                      prefixIcon:const Icon(
                                        Icons.vpn_key_sharp,color: Colors.black,
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: (){


                                          setState(() {
                                            isObSecure=!isObSecure;
                                          });
                                        },
                                        child: Icon(
                                          isObSecure==true? Icons.visibility_off:Icons.visibility,
                                          color: Colors.black,

                                        ),
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
                                )




                              ],
                            )
                        )
                      ],
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
