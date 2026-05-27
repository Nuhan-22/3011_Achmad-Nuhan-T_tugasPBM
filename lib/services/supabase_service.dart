import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  Future<String> uploadImage(File imageFile) async {
    final fileName = const Uuid().v4();

    await supabase.storage
        .from('photos')
        .upload(fileName, imageFile);

    final imageUrl = supabase.storage
        .from('photos')
        .getPublicUrl(fileName);

    return imageUrl;
  }
}
