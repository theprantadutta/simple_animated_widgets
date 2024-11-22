Here’s a README template for your `simple_animated_widgets` package, based on the three components we've created so far (`FadingButton`, `BouncingText`, and `RotatingIcon`). Feel free to adjust any specific information or add further details as needed:

---

# simple_animated_widgets

**simple_animated_widgets** is a Flutter package that provides simple, reusable, and customizable animated widgets to enhance your Flutter applications. Whether you're looking to add smooth transitions, visual effects, or interactions to your UI components, this package offers a set of easy-to-use widgets for your needs.

## Features

- **FadingButton**: A button that fades in and out, creating a smooth visual effect. Customize the fade duration and opacity.
- **BouncingText**: A text widget that bounces vertically or horizontally, adding playful movement to your UI.
- **RotatingIcon**: An icon widget that continuously rotates or rotates on user interaction. Customize the rotation speed and angle.

Each widget is lightweight, customizable, and easy to integrate into your Flutter projects.

## Getting started

To get started with **simple_animated_widgets**, you need to add it as a dependency in your `pubspec.yaml` file.

### Prerequisites:
- Make sure you have Flutter installed. If not, follow the installation guide [here](https://flutter.dev/docs/get-started/install).
- Ensure your Flutter project is set up and working correctly.

### Installation

In your `pubspec.yaml` file, add **simple_animated_widgets** under dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  simple_animated_widgets: ^0.0.1
```

Run `flutter pub get` to install the package.

## Usage

You can use these animated widgets directly in your app. Below are examples of how to use each widget:

### FadingButton Example:

```dart
import 'package:flutter/material.dart';
import 'package:simple_animated_widgets/simple_animated_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Simple Animated Widgets')),
        body: Center(
          child: FadingButton(
            onPressed: () {
              print('Button Pressed!');
            },
            child: Text('Tap Me'),
            duration: Duration(seconds: 2),
            fadeIn: true,
          ),
        ),
      ),
    );
  }
}
```

### BouncingText Example:

```dart
import 'package:flutter/material.dart';
import 'package:simple_animated_widgets/simple_animated_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Simple Animated Widgets')),
        body: Center(
          child: BouncingText(
            text: 'Bounce Me!',
            bounceDirection: BounceDirection.Vertical,
            bounceHeight: 20,
          ),
        ),
      ),
    );
  }
}
```

### RotatingIcon Example:

```dart
import 'package:flutter/material.dart';
import 'package:simple_animated_widgets/simple_animated_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Simple Animated Widgets')),
        body: Center(
          child: RotatingIcon(
            icon: Icon(Icons.refresh, size: 48, color: Colors.blue),
            duration: Duration(seconds: 2),
            angle: 360.0,
            isRotating: true,
          ),
        ),
      ),
    );
  }
}
```

### Example App:

For a more detailed example, check out the `/example` directory of the repository.

## Additional information

- **Documentation**: You can find more information and usage details in the code and comments in the source files.
- **Contributing**: Contributions are welcome! Feel free to fork this repository, create a pull request, and submit your improvements.
- **Issues**: If you encounter any issues, please file them on the GitHub issues page.
- **License**: This package is open-source and available under the MIT License. See the LICENSE file for more details.

For further questions, feel free to reach out via GitHub discussions or open an issue in the repository.