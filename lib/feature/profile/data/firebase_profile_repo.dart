import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_mitch/feature/profile/domain/entities/profile_user.dart';
import 'package:social_media_mitch/feature/profile/domain/repos/profile_repo.dart';

class FirebaseProfileRepo implements ProfileRepo {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<ProfileUser?> fetchUserProfile(String uid) async {
    try {
      final userDoc =
          await firebaseFirestore.collection('users').doc(uid).get();
      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null) {
          return ProfileUser(
            bio: userData['bio'] ?? "",
            profileImageUrl: userData['profileImageUrl'] ?? "",
            uid: userData['uid'],
            email: userData['email'],
            name: userData['name'],
          );
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> updateProfile(ProfileUser updatedProfileUser) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(updatedProfileUser.uid)
          .update({
        'bio': updatedProfileUser.bio,
        'profileImageUrl': updatedProfileUser.profileImageUrl,
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
