import 'dart:developer';

import 'package:amazon_clone/resourse/authanticationMethod.dart';
import 'package:amazon_clone/screens/home_screen.dart';

import 'package:amazon_clone/screens/sign_up_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/widget/custom_main_button.dart';
import 'package:amazon_clone/widget/text_field_widget.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? isLoading = false;
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.10,
                  ),
                  Container(
                    height: screenSize.height * 0.6,
                    width: screenSize.width * 0.8,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 33, fontWeight: FontWeight.w500),
                        ),
                        TextFieldWidget(
                          title: "Email",
                          controller: emailController,
                          obscureText: false,
                          hintText: "enter your email",
                          cursorColor: Colors.orange,
                        ),
                        TextFieldWidget(
                          title: "Password",
                          controller: passwordController,
                          obscureText: true,
                          hintText: "enter your password",
                          cursorColor: Colors.orange,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomMainButton(
                            color: yellowColor,
                            isLoading: isLoading!,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              String output =
                                  await AuthenticationMethod().singInUser(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              setState(() {
                                isLoading = false;
                              });

                              if (output == "seccuss") {
                                Utils().showSnackBar(
                                  context: context,
                                  content: output,
                                );
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ));
                              } else {
                                Utils().showSnackBar(
                                  context: context,
                                  content: output,
                                );
                              }
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "New Amazon Account?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  CustomMainButton(
                    color: Colors.grey,
                    isLoading: false,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Create Amazon Account",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
