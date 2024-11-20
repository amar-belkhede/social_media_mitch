import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_mitch/feature/auth/presentation/pages/login_page.dart';
import 'package:social_media_mitch/feature/auth/presentation/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        togglePage: togglePage,
      );
    } else {
      return RegisterPage(
        togglePage: togglePage,
      );
    }
  }
}
