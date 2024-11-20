import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_mitch/extention_util.dart';
import 'package:social_media_mitch/feature/auth/presentation/components/my_button.dart';
import 'package:social_media_mitch/feature/auth/presentation/components/my_text_field.dart';
import 'package:social_media_mitch/feature/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePage;

  const LoginPage({super.key, required this.togglePage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  void login() {
    final String email = emailController.text;
    final String pw = pwController.text;

    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty && pw.isNotEmpty) {
      authCubit.login(email, pw);
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text("Please enter both email and password")));

      context.showSnackBar(text: "Please enter both email and password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  "Welcome back, you've been missed!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                25.height(),
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
                25.height(),
                MyButton(onTap: login, text: 'Login'),
                50.height(),
                GestureDetector(
                  onTap: widget.togglePage,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      children: [
                        TextSpan(
                          text: "Not a member? ",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        TextSpan(
                          text: "Register now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
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
    );
  }
}
