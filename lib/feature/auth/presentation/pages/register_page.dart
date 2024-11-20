import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_mitch/extention_util.dart';
import 'package:social_media_mitch/feature/auth/presentation/components/my_button.dart';
import 'package:social_media_mitch/feature/auth/presentation/components/my_text_field.dart';
import 'package:social_media_mitch/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_mitch/feature/auth/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwController.dispose();
    confirmPwController.dispose();
    super.dispose();
  }

  void register() {
    final String name = nameController.text;
    final String email = emailController.text;
    final String pw = pwController.text;
    final String confirmPw = confirmPwController.text;

    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty &&
        name.isNotEmpty &&
        pw.isNotEmpty &&
        confirmPw.isNotEmpty) {
      if (pw == confirmPw) {
        authCubit.register(name, email, pw);
      } else {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text("Password do not match"),
        //   ),
        // );
        context.showSnackBar(text: "Password do not match");
      }
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text("Please complete all fields"),
      //   ),
      // );

      context.showSnackBar(text: "Please complete all fields");
    }
  }

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
                  MyButton(onTap: register, text: 'Register'),
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
