import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const platform = MethodChannel("launchUrl");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Surprise',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(brightness: Brightness.dark, primary: Colors.black),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Surprise!"),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Click a button visible over bottom right corner',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Add me on snap! 👻',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.yellow,
          onPressed: () {
            openUrl("https://www.snapchat.com/add/avadhk.sapariya");
          },
          child: const Icon(
            Icons.snapchat,
          ),
        ),
      ),
    );
  }

  static Future<void> openUrl(String url) async {
    try {
      await platform.invokeMethod("openUrl", url);
    } on PlatformException catch (e) {
      log("Failed to open URL: '${e.message}'.");
    }
  }
}
