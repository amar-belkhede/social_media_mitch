import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_mitch/extention_util.dart';
import 'package:social_media_mitch/feature/auth/domain/entities/app_user.dart';
import 'package:social_media_mitch/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_mitch/feature/auth/presentation/pages/login_page.dart';
import 'package:social_media_mitch/feature/auth/presentation/pages/register_page.dart';
import 'package:social_media_mitch/feature/profile/presentation/components/bio_box.dart';
import 'package:social_media_mitch/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:social_media_mitch/feature/profile/presentation/cubit/profile_state.dart';
import 'package:social_media_mitch/feature/profile/presentation/pages/edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  late AppUser? currentUser = authCubit.currentUser;

  @override
  void initState() {
    super.initState();
    profileCubit.fetchUserProfile(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final user = state.profileUser;
          return Scaffold(
            appBar: AppBar(
              title: Text(user.name),
              foregroundColor: Theme.of(context).colorScheme.primary,
              actions: [
                IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(
                            user: user,
                          ),
                        )),
                    icon: const Icon(Icons.settings))
              ],
            ),
            body: Column(
              children: [
                15.height(),
                Center(
                  child: Text(
                    user.email,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                15.height(),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 120,
                  width: 120,
                  padding: const EdgeInsets.all(25),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 72,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                25.height(),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      Text(
                        "Bio",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      )
                    ],
                  ),
                ),
                10.height(),
                BioBox(text: user.bio),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 25),
                  child: Row(
                    children: [
                      Text(
                        "Posts",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      )
                    ],
                  ),
                ),
                10.height(),
              ],
            ),
          );
        } else if (state is ProfileLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("No Profile Found.."),
            ),
          );
        }
      },
    );
  }
}
