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
            svgIcon: 'test/assets/test_icon.svg',
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
            svgIcon: 'test/assets/test_icon.svg',
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
            svgIcon: 'test/assets/test_icon.svg',
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
            svgIcon: 'test/assets/test_icon.svg',
            textStyle: TextStyle(fontSize: 18.0),
          ),
        ),
      );

      // Verify that the SvgPicture uses the default icon size (24.0)
      final svgPicture = tester.widget<SvgPicture>(find.byType(SvgPicture));
      expect(svgPicture.height, 24.0);
      expect(svgPicture.width, 24.0);
    });

    testWidgets('SocialButton handles title property', (WidgetTester tester) async {
      // Build the SocialButton widget with a title
      await tester.pumpWidget(
        createTestWidget(
          const SocialButton(
            title: 'test_title',
            buttonTitle: 'Test Button',
            svgIcon: 'test/assets/test_icon.svg',
          ),
        ),
      );

      // Verify that the widget renders without error
      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('SocialButton does not crash without onTap', (WidgetTester tester) async {
      // Build the SocialButton widget without an onTap callback
      await tester.pumpWidget(
        createTestWidget(
          const SocialButton(
            buttonTitle: 'No-op Button',
            svgIcon: 'test/assets/test_icon.svg',
          ),
        ),
      );

      // Tap the button
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      // No verification needed, just ensuring no crash
    });

    testWidgets('SocialButton uses default color when color is null', (WidgetTester tester) async {
      // Build the SocialButton widget without a color
      await tester.pumpWidget(
        createTestWidget(
          const SocialButton(
            buttonTitle: 'Default Color Button',
            svgIcon: 'test/assets/test_icon.svg',
          ),
        ),
      );

      // Verify that the container has the default color (Theme.of(context).primaryColor)
      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, ThemeData().primaryColor);
    });
  });
}