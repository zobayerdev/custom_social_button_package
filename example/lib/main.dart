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