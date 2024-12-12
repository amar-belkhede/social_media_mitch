import 'dart:typed_data';

import 'package:social_media_mitch/feature/storage/domain/storage_repo.dart';

class FirebaseStorageRepo  implements StorageRepo{
  @override
  Future<String?> uploadProfileImageMobile(String path, String fileName) {
    // TODO: implement uploadProfileImageMobile
    throw UnimplementedError();
  }

  @override
  Future<String?> uploadProfileImageWeb(Uint8List fileBytes, String fileName) {
    // TODO: implement uploadProfileImageWeb
    throw UnimplementedError();
  }
}