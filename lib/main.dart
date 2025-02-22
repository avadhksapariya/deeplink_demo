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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: TextButton(
                onPressed: () {
                  openUrl("https://www.instagram.com/avadhk.sapariya");
                },
                style: TextButton.styleFrom(foregroundColor: Colors.blue),
                child: const Text(
                  'Open Url',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
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
