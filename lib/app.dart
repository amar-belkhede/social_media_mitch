import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_mitch/feature/auth/data/firebase_auth_repo.dart';
import 'package:social_media_mitch/feature/auth/domain/repos/auth_repo.dart';
import 'package:social_media_mitch/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_mitch/feature/auth/presentation/cubits/auth_states.dart';
import 'package:social_media_mitch/feature/auth/presentation/pages/auth_page.dart';
import 'package:social_media_mitch/feature/home/presentation/home_page.dart';
import 'package:social_media_mitch/feature/profile/data/firebase_profile_repo.dart';
import 'package:social_media_mitch/feature/profile/domain/repos/profile_repo.dart';
import 'package:social_media_mitch/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:social_media_mitch/themes/light_mode.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final authRepo = FirebaseAuthRepo();
  final profileRepo = FirebaseProfileRepo();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(profileRepo: profileRepo),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Social media',
        theme: lightTheme,
        home: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is Unauthenticated) {
              return const AuthPage();
            }
            if (state is Authenticated) {
              return const HomePage();
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
