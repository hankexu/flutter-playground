import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/init_meedu_player.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/router.dart';

void main() {
  initMeeduPlayer(androidUseMediaKit: true);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: routes,
    );
  }
}

class HomePage extends HookConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground'),
      ),
      body: ListView.separated(
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            final page = pages[index];
            return ListTile(
              title: Text(page.title),
              onTap: () {
                Navigator.of(context).pushNamed(page.path);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          }),
    );
  }
}
