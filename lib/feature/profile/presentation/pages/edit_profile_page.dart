import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_mitch/extention_util.dart';
import 'package:social_media_mitch/feature/auth/presentation/components/my_text_field.dart';
import 'package:social_media_mitch/feature/profile/domain/entities/profile_user.dart';
import 'package:social_media_mitch/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:social_media_mitch/feature/profile/presentation/cubit/profile_state.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileUser user;
  const EditProfilePage({
    super.key,
    required this.user,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final bioTextContrller = TextEditingController();

  void updateProfile() async {
    final profileCubit = context.read<ProfileCubit>();
    if (bioTextContrller.text.isNotEmpty) {
      profileCubit.updaeProfile(
        uid: widget.user.uid,
        newBio: bioTextContrller.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("Uploading..."),
                ],
              ),
            ),
          );
        } else {
          return buildEditPage();
        }
      },
      listener: (context, state) {
        if (state is ProfileLoaded) {
          Navigator.pop(context);
        }
      },
    );
  }

  Widget buildEditPage({double uploadProgress = 0.0}) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        foregroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: updateProfile,
            icon: const Icon(Icons.upload),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("Bio"),
          10.height(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: MyTextField(
              controller: bioTextContrller,
              hintText: widget.user.bio,
              obsecureText: false,
            ),
          ),
        ],
      ),
    );
  }
}
