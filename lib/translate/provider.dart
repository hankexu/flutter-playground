

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'provider.g.dart';

@riverpod
class Translator extends _$Translator {
  @override
  Future<String> build(String originalText) {
    return translate();
  }

  Future<String> translate() async {
     // await Future.delayed(const Duration(seconds: 1));
    return 'translated: $originalText';
  }
}