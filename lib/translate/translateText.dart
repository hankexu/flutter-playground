import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/translate/provider.dart';

class TranslateText extends HookConsumerWidget {
  const TranslateText(
      this.text, {
        Key? key,
      }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(translatorProvider(text));
    return state.when(data: (data) {
      return Text(data);
    }, error: (_, __) {
      return Text(text);
    }, loading: () {
      return Text(text);
    });
  }
}