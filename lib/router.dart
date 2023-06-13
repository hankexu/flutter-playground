import 'package:flutter/cupertino.dart';
import 'package:playground/gesture.page.dart';
import 'package:playground/pageview_video.page.dart';
import 'package:playground/purchase.page.dart';
import 'package:playground/translate/translate.page.dart';

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
  Page(
      path: '/gesture',
      builder: (context) => const GesturePage(),
      title: 'Gesture'),
  Page(
      path: '/purchase',
      builder: (context) => const PurchasePage(),
      title: 'In App Purchase'),
  Page(
      path: '/tiktokLike',
      builder: (context) => const VideoPageView(),
      title: 'Like TikTok'),
];

final routes = Map.fromEntries(pages.map((e) => MapEntry(e.path, e.builder)));
