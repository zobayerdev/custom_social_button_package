# Custom Social Button

A customizable Flutter button widget that displays an SVG icon based on the provided social platform `title` (e.g., 'facebook', 'google', 'apple', 'github', 'twitter', 'messenger', 'linkedin') alongside a customizable button title.

<img width="377" height="417" alt="Screenshot_3" src="https://github.com/user-attachments/assets/44fa968f-37ee-4caa-9028-c1bf8766e80c" />

## Features
- Automatically selects an SVG icon based on the `title` (e.g., 'facebook' maps to `assets/icons/facebook.svg`).
- Customizable icon size with `iconHeight` and `iconWidth` parameters.
- Customizable button properties: background color, height, width, tap callback, border radius, border color, border width, and text style.
- Mandatory parameters: `title` and `buttonTitle`.
- Uses `flutter_svg` for rendering SVG icons.
- Supports popular social platforms like Facebook, Google, and Twitter out of the box.

## Installation
Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  custom_social_button: ^1.0.6
```

Ensure your SVG assets are included in your project's `pubspec.yaml` under `flutter: assets:`.

Run `flutter pub get` to install the package and its dependencies.

## Usage
Below is an example of how to use the `SocialButton` widget in a Flutter app. This example creates a simple app with three social buttons (Facebook, Google, and Twitter) showcasing different customization options.

### Example App

Create a new Flutter project and replace the `main.dart` file with the following code:

```dart
import 'package:flutter/material.dart';
import 'package:custom_social_button/custom_social_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Social Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SocialButtonDemo(),
    );
  }
}

class SocialButtonDemo extends StatelessWidget {
  const SocialButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Button Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Facebook Button
            SocialButton(
              title: 'facebook',
              buttonTitle: 'Sign in with Facebook',
              color: Colors.blue,
              height: 50.0,
              width: 300.0,
              borderRadius: 12.0,
              borderColor: Colors.blueAccent,
              borderWidth: 2.0,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              iconHeight: 24.0,
              iconWidth: 24.0,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Facebook button tapped!')),
                );
              },
            ),
            const SizedBox(height: 16.0),
            // Google Button
            SocialButton(
              title: 'google',
              buttonTitle: 'Sign in with Google',
              color: Colors.red,
              height: 50.0,
              width: 300.0,
              borderRadius: 12.0,
              borderColor: Colors.redAccent,
              borderWidth: 2.0,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              iconHeight: 24.0,
              iconWidth: 24.0,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Google button tapped!')),
                );
              },
            ),
            const SizedBox(height: 16.0),
            // Twitter Button with minimal customization
            SocialButton(
              title: 'twitter',
              buttonTitle: 'Sign in with Twitter',
              color: Colors.lightBlue,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Twitter button tapped!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

### Setup Instructions
1. **Install Dependencies**:
   - Run `flutter pub get` to install the `custom_social_button` package and its dependencies.

2. **Run the App**:
   - Replace your project's `main.dart` with the above code.
   - Run the app using `flutter run`.

## Parameters
| Parameter      | Type              | Description                                      | Required |
|----------------|-------------------|--------------------------------------------------|----------|
| title          | String            | Social platform name (e.g., 'facebook', 'google', 'twitter') to select the SVG icon | Yes      |
| buttonTitle    | String            | Text displayed on the button                     | Yes      |
| color          | Color?            | Background color of the button                   | No       |
| height         | double?           | Height of the button (defaults to 48.0)         | No       |
| width          | double?           | Width of the button (defaults to full width)    | No       |
| onTap          | VoidCallback?     | Callback function when the button is tapped      | No       |
| borderRadius   | double?           | Border radius of the button (defaults to 8.0)   | No       |
| borderColor    | Color?            | Border color of the button                       | No       |
| borderWidth    | double?           | Border width of the button                       | No       |
| textStyle      | TextStyle?        | Style of the button text (defaults to white, 16.0, medium weight) | No       |
| iconHeight     | double?           | Height of the SVG icon (defaults to 24.0)       | No       |
| iconWidth      | double?           | Width of the SVG icon (defaults to 24.0)        | No       |
| iconColor      | Color?            | Color filter for the SVG icon                    | No       |

## Notes
- The `title` parameter determines the SVG icon, which is automatically mapped to an asset path (e.g., `facebook` maps to `assets/icons/facebook.svg`).
- Supported platforms include `facebook`, `google`, and `twitter`. If an unsupported `title` is provided, a default icon (`assets/icons/default.svg`) is used.
- Ensure all SVG assets are correctly declared in `pubspec.yaml` and exist in the `assets/icons/` folder.
- If an SVG asset is missing, the app may throw an error. Consider adding error handling (e.g., a placeholder widget) for robustness.
- To add support for more platforms, extend the internal icon mapping in the `SocialButton` widget by updating its `_iconMap`.

## License
MIT License
