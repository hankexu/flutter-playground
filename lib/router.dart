import 'package:flutter/cupertino.dart';
import 'package:playground/translate/translate.page.dart';

import 'main.dart';

class Page {
  final String path;
  final WidgetBuilder builder;
  final String title;

  const Page({
    required this.path,
    required this.builder,
    required this.title,
  });
}

final pages = [
  Page(
    path: '/translate',
    builder: (context) => const TranslatePage(),
    title: 'Translate',
  ),
];


final routes = Map.fromEntries(pages.map((e) => MapEntry(e.path, e.builder)));