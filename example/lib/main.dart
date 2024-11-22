import 'package:flutter/material.dart';
import 'package:simple_animated_widgets/simple_animated_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Animated Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Simple Animated Widgets'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadingButton(
                onPressed: () {
                  debugPrint('Button Pressed!');
                },
                fadeTo: 0.3,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'I Will Fade on Tap!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              BouncingText(
                text: "I Will Bounce on Tap!",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                onTap: () {
                  debugPrint("Text Tapped!");
                },
                scaleFactor: 1.5,
                duration: const Duration(milliseconds: 300),
              ),
              const SizedBox(height: 10),
              const RotatingIcon(
                isRotating: false,
                icon: Icon(
                  Icons.refresh,
                  size: 48,
                  color: Colors.blue,
                ),
                duration: Duration(seconds: 2),
                angle: 360.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
