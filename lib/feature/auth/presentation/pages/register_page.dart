import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_mitch/extention_util.dart';
import 'package:social_media_mitch/feature/auth/presentation/components/my_button.dart';
import 'package:social_media_mitch/feature/auth/presentation/components/my_text_field.dart';
import 'package:social_media_mitch/feature/auth/presentation/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePage;
  const RegisterPage({super.key, required this.togglePage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_open_outlined,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  50.height(),
                  Text(
                    "let's create an account for you",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),
                  25.height(),
                  MyTextField(
                    controller: nameController,
                    hintText: 'Name',
                    obsecureText: false,
                  ),
                  10.height(),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obsecureText: false,
                  ),
                  10.height(),
                  MyTextField(
                    controller: pwController,
                    hintText: 'password',
                    obsecureText: true,
                  ),
                  10.height(),
                  MyTextField(
                    controller: confirmPwController,
                    hintText: 'confirm password',
                    obsecureText: true,
                  ),
                  25.height(),
                  MyButton(onTap: () {}, text: 'Register'),
                  50.height(),
                  GestureDetector(
                    onTap: widget.togglePage,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        children: [
                          TextSpan(
                            text: "Already a member? ",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          TextSpan(
                            text: "Login now",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
