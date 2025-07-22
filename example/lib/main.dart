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
              svgIcon: 'assets/icons/facebook.svg',
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
            // Instagram Button with different styling
            SocialButton(
              title: 'instagram',
              buttonTitle: 'Sign in with Instagram',
              svgIcon: 'assets/icons/instagram.svg',
              color: Colors.pink,
              height: 60.0,
              borderRadius: 8.0,
              iconColor: Colors.green,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              iconHeight: 20.0,
              iconWidth: 20.0,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Instagram button tapped!')),
                );
              },
            ),
            const SizedBox(height: 16.0),
            // Google Button with minimal customization
            SocialButton(
              title: 'google',
              buttonTitle: 'Sign in with Google',
              svgIcon: 'assets/icons/google.svg',
              color: Colors.red,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Google button tapped!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}