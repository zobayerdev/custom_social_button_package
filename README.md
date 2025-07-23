# Custom Social Button

A customizable Flutter button widget that displays user-provided SVG icons with customizable size alongside the button title.

## Features
- Displays a user-provided SVG icon alongside the button title.
- Customizable icon size with `iconHeight` and `iconWidth` parameters.
- Customizable button properties: color, height, width, onTap, borderRadius, borderColor, borderWidth, and textStyle.
- Mandatory parameters: `buttonTitle`, and `svgIcon`.
- Uses `flutter_svg` for rendering SVG icons.

## Installation
Add this to your `pubspec.yaml`:

```yaml
dependencies:
  custom_social_button: ^1.0.5
```

Ensure you have your SVG assets included in your project's `pubspec.yaml` under `flutter: assets:`.

Run `flutter pub get` to install the package.

## Usage
Below is an example of how to use the `SocialButton` widget in a Flutter app. This example creates a simple app with three social buttons (Facebook, Google and GitHub) showcasing different customization options.

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
              buttonTitle: 'Sign in with Facebook',
              svgIcon: 'assets/facebook.svg',
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
            // Google Button with minimal customization
            SocialButton(
              buttonTitle: 'Sign in with Google',
              svgIcon: 'assets/google.svg',
              color: Colors.red,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Google button tapped!')),
                );
              },
            ),
            const SizedBox(height: 16.0),
            // GitHub Button
            SocialButton(
              buttonTitle: 'Sign in with GitHub',
              svgIcon: 'assets/github.svg',
              color: Colors.black,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('GitHub button tapped!')),
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
1. **Add SVG Assets**:
   - Create an `assets/` folder in your project.
   - Add SVG files (e.g., `facebook.svg`, `google.svg`, `github.svg`) to this folder. You can download these from free resources like Flaticon or Icons8.
   - Declare the assets in your `pubspec.yaml`:
     ```yaml
     flutter:
       assets:
         - assets/facebook.svg
         - assets/google.svg
         - assets/github.svg
     ```

2. **Install Dependencies**:
   - Run `flutter pub get` to install the `custom_social_button` package and its dependencies.

3. **Run the App**:
   - Replace your project's `main.dart` with the above code.
   - Run the app using `flutter run`.

## Parameters
| Parameter      | Type              | Description                                      | Required |
|----------------|-------------------|--------------------------------------------------|----------|
| buttonTitle    | String            | Text displayed on the button                     | Yes      |
| svgIcon        | String            | Path to the SVG icon asset                       | Yes      |
| color          | Color?            | Background color of the button                   | No       |
| height         | double?           | Height of the button                             | No       |
| width          | double?           | Width of the button                              | No       |
| onTap          | VoidCallback?     | Callback function when the button is tapped       | No       |
| borderRadius   | double?           | Border radius of the button                      | No       |
| borderColor    | Color?            | Border color of the button                       | No       |
| borderWidth    | double?           | Border width of the button                       | No       |
| textStyle      | TextStyle?        | Style of the button text                         | No       |
| iconHeight     | double?           | Height of the SVG icon                           | No       |
| iconWidth      | double?           | Width of the SVG icon                            | No       |
| iconColor      | Color?            | Color of the icon.                               | No       |

## Notes
- Users must provide their own SVG icons in their project's asset folder and declare them in `pubspec.yaml`.
- The `svgIcon` parameter is mandatory and must point to a valid SVG file.
- SVG icons must be accessible in the project's asset folder.
- If `iconHeight` or `iconWidth` is not provided, the icon size defaults to 24.

## License
MIT License