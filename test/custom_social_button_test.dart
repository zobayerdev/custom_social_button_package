import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_social_button/custom_social_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  // Helper function to wrap the widget in a MaterialApp for testing
  Widget createTestWidget(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: child),
      ),
    );
  }

  group('SocialButton Widget Tests', () {
    testWidgets('SocialButton renders with required parameters', (WidgetTester tester) async {
      // Build the SocialButton widget with minimal required parameters
      await tester.pumpWidget(
        createTestWidget(
          const SocialButton(
            title: 'facebook',
            buttonTitle: 'Sign in with Facebook',
            svgIcon: 'assets/icons/facebook.svg',
          ),
        ),
      );

      // Verify that the button text is rendered
      expect(find.text('Sign in with Facebook'), findsOneWidget);

      // Verify that the SvgPicture widget is rendered
      expect(find.byType(SvgPicture), findsOneWidget);

      // Verify that the button has the default height and width
      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxHeight, 48.0);
    });

    testWidgets('SocialButton applies custom styles correctly', (WidgetTester tester) async {
      // Build the SocialButton widget with custom parameters
      await tester.pumpWidget(
        createTestWidget(
          SocialButton(
            title: 'instagram',
            buttonTitle: 'Sign in with Instagram',
            svgIcon: 'assets/icons/instagram.svg',
            color: Colors.pink,
            height: 60.0,
            width: 250.0,
            borderRadius: 20.0,
            borderColor: Colors.pinkAccent,
            borderWidth: 3.0,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            iconHeight: 30.0,
            iconWidth: 30.0,
          ),
        ),
      );

      // Verify that the button text is rendered
      expect(find.text('Sign in with Instagram'), findsOneWidget);

      // Verify that the SvgPicture widget has the correct size
      final svgPicture = tester.widget<SvgPicture>(find.byType(SvgPicture));
      expect(svgPicture.height, 30.0);
      expect(svgPicture.width, 30.0);

      // Verify that the container has the correct styles
      final container = tester.widget<Container>(find.byType(Container));
      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.pink);
      expect(decoration.borderRadius, BorderRadius.circular(20.0));
      expect(decoration.border, isA<Border>());
      final border = decoration.border as Border;
      expect(border.top.color, Colors.pinkAccent);
      expect(border.top.width, 3.0);
      expect(container.constraints?.maxHeight, 60.0);
      expect(container.constraints?.maxWidth, 250.0);

      // Verify that the text style is applied
      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontSize, 20.0);
      expect(text.style?.color, Colors.white);
      expect(text.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('SocialButton triggers onTap callback', (WidgetTester tester) async {
      bool wasTapped = false;

      // Build the SocialButton widget with an onTap callback
      await tester.pumpWidget(
        createTestWidget(
          SocialButton(
            title: 'google',
            buttonTitle: 'Sign in with Google',
            svgIcon: 'assets/icons/google.svg',
            onTap: () {
              wasTapped = true;
            },
          ),
        ),
      );

      // Tap the button
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      // Verify that the onTap callback was triggered
      expect(wasTapped, isTrue);
    });

    testWidgets('SocialButton uses default icon size when iconHeight/iconWidth not provided', (WidgetTester tester) async {
      // Build the SocialButton widget without iconHeight and iconWidth
      await tester.pumpWidget(
        createTestWidget(
          const SocialButton(
            title: 'twitter',
            buttonTitle: 'Sign in with Twitter',
            svgIcon: 'assets/icons/twitter.svg',
            textStyle: TextStyle(fontSize: 18.0),
          ),
        ),
      );

      // Verify that the SvgPicture uses the default icon size (textStyle.fontSize + 4.0)
      final svgPicture = tester.widget<SvgPicture>(find.byType(SvgPicture));
      expect(svgPicture.height, 22.0); // 18.0 + 4.0
      expect(svgPicture.width, 22.0); // 18.0 + 4.0
    });
  });
}