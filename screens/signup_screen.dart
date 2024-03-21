
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_app/controllers/auth_controller.dart';
import 'package:instagram_clone_app/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool ishow = false;
  void clear() {
    emailController.clear();
    nameController.clear();
    passwordController.clear();
    controller.setImage();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'SignUp',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Center(
                      child: Stack(
                        children: [
                          GetBuilder<AuthController>(
                            builder: (_) {
                              if (controller.profileImage != null) {
                                return CircleAvatar(
                                  radius: 80,
                                  backgroundImage:
                                      FileImage(controller.profileImage!),
                                );
                              } 
                              else 
                              {
                                return const CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Colors.blue,
                                    backgroundImage:
                                        AssetImage('assets/images/pro.png'));
                              }
                            },
                          ),
                          Positioned(
                              bottom: 10,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  controller.selectProfile();
                                },
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Input Email";
                        }
                        if (!GetUtils.isEmail(value) || !value.contains("@")) {
                          return 'Please Enter a Valid Emial';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: const Text('Email'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Input Name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: const Text('Name'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Input Password";
                        }
                        if (value.length < 6) {
                          return 'password must be at least 6 charector ';
                        }
                        return null;
                      },
                      obscureText: ishow == false ? true : false,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  ishow = !ishow;
                                });
                              },
                              icon: ishow == true
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          label: const Text('Password'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  // requet to call api
                                  final email = emailController.text;
                                  final name = nameController.text;
                                  final password = passwordController.text;
                               
                                  controller.signup(
                                      email: email,
                                      name: name,
                                      password: password,
                                      );
                                    setState(() {
                                        clear();
                                    });
                                }
                              },
                              icon: const Icon(Icons.logout),
                              label: const Text('SignUp')),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                            onPressed: () {
                              // Get.back();
                            
                              Get.to(()=>LoginScreen(),
                                  transition: Transition.leftToRight,
                                  duration: const Duration(seconds: 1));
                            },
                            child: const Text('Login'))
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
