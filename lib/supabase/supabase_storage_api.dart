import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:right_code_app/dep_injection.dart';
import 'package:right_code_app/utils/prints.dart';
import 'package:right_code_app/utils/supabase_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseStorageRepository {
  ///
  Future<void> removeFile({required String path});

  ///
  Future<String?> uploadOneFile({
    required String bucketName,
    required Uint8List fileData,
    required String fileName,
    String? folderName,
  });
  Future<List<String>> uploadMultipleFiles({
    required String bucketName,
    required String folderName,
    required List<PlatformFile> files,
  });

  String getRawPath(String url) {
    Uri uri = Uri.parse(url);
    String basePath = "/storage/v1/object/public/HRD/";
    String rawPath = uri.path.substring(basePath.length);
    return rawPath;
  }

  String getStoragePath({
    required String bucketName,
    required String filename,
    String? subFolderName,
    String? customFileName,
    bool setNameAsFileName = true,
    String? customPath,
  }) {
    // final fileExtension = getFileExtension(filename); //* ".png" ..e.t.c
    final fileNameWithExtension = "$customFileName";
    final fileName = setNameAsFileName && customFileName == null
        ? filename
        : fileNameWithExtension;
    final subFolder = subFolderName;
    final filePath = customPath ??
        (subFolder != null
            ? '$bucketName/$subFolder/$fileName'
            : '$bucketName/$fileName'); //*{FolderName}/{UserName}/{imgName}.{FileExtension}
    return filePath;
  }

  ///
  ///* Get File Extension
  String getFileExtension(String fileName) {
    List<String> parts = fileName.split('.');
    if (parts.length > 1) {
      return '.${parts.last.toLowerCase()}';
    }
    return '';
  }
}

class SupabaseStorageImplement extends BaseStorageRepository {
  final supabase = getIt<Supabase>();

  @override
  Future<String?> uploadOneFile({
    required String bucketName,
    required Uint8List fileData,
    required String fileName,
    String? folderName,
  }) async {
    try {
      final filePath = getStoragePath(
        bucketName: bucketName,
        filename: fileName,
        customFileName: fileName,
        subFolderName: folderName,
      );
      await supabase.client.storage.from('App').uploadBinary(filePath, fileData,
          fileOptions: const FileOptions(upsert: true));
      final url = supabase.client.storage.from('App').getPublicUrl(filePath);
      return url;
    } on PostgrestException catch (e) {
      pError("Error Uploading File", e);
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<void> removeFile({required String path}) async {
    try {
      if (path.isNotEmpty) {
        final rawPath = getRawPath(path);
        pCorrect("Raw Path", rawPath);
        await supabase.client.storage
            .from("App")
            .remove([rawPath]).then((value) {
          pCorrect(
              "Remove File From Supabase Storage", value.map((e) => e.name));
        });
      }
    } on PostgrestException catch (e) {
      pError("Error Remove File From Supabase Storage", e);
      throw handleSupabaseException(e);
    }
  }

  @override
  Future<List<String>> uploadMultipleFiles(
      {required String bucketName,
      required String folderName,
      required List<PlatformFile> files}) {
    // TODO: implement uploadMultipleFiles
    throw UnimplementedError();
  }
}
