import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mitch/app.dart';
import 'package:social_media_mitch/feature/auth/presentation/pages/auth_page.dart';
import 'package:social_media_mitch/feature/auth/presentation/pages/login_page.dart';
import 'package:social_media_mitch/feature/auth/presentation/pages/register_page.dart';
import 'package:social_media_mitch/config/firebase_options.dart';
import 'package:social_media_mitch/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
