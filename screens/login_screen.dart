import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_app/controllers/auth_controller.dart';
import 'package:instagram_clone_app/screens/signup_screen.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool ishow = false;
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
            'Login',
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
                    Center(
                        child: Image.asset(
                      'assets/images/in.jpg',
                      width: 150,
                      height: 150,
                    )),
                    const Text(
                      'Welcome Back',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Input Data";
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
                                if(formkey.currentState!.validate()) {
                                  authController.login(email: emailController.text, password: passwordController.text);
                                }
                              },
                              icon: const Icon(Icons.login),
                              label: const Text('Login')),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have and account?"),
                        TextButton(
                            onPressed: () {
                              Get.to(SignUpScreen(),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(seconds: 1));
                            },
                            child: const Text('SignUp'))
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
