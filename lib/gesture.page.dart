import 'package:flutter/material.dart';

class GesturePage extends StatelessWidget {
  const GesturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture'),
      ),
      body: GestureDetector(
        onTap: () {
          // Handle tap on the card but outside the image.
          // This could be navigating to the detail page.
          print('card tapped');
        },
        child: Card(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // Handle tap on the image.
                  // This could be navigating to the photo gallery.
                  print('image tapped');
                },
                child: Image.network('https://storage.googleapis.com/cms-storage-bucket/f399274b364a6194c43d.png'),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('My Card Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
