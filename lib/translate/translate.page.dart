import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/translate/translateText.dart';

class TranslatePage extends HookConsumerWidget {
  const TranslatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate'),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('title $index'),
          subtitle: TranslateText('subtitle $index'),
        );
      }),
    );
  }
}