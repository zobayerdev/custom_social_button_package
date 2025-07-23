import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A customizable social button widget for Flutter applications.
///
/// This widget displays a button with an SVG icon and a title, commonly used for
/// social media login or sharing functionalities. It is highly customizable,
/// allowing you to define its appearance and behavior.
class SocialButton extends StatelessWidget {
  /// The text displayed on the button.
  final String buttonTitle;

  /// The path to the SVG asset for the icon.
  final String svgIcon;

  /// The background color of the button.
  ///
  /// If null, it defaults to the primary color of the current theme.
  final Color? color;

  /// The height of the button.
  ///
  /// Defaults to `48.0`.
  final double? height;

  /// The width of the button.
  ///
  /// Defaults to `double.infinity`.
  final double? width;

  /// The callback function that is called when the button is tapped.
  final VoidCallback? onTap;

  /// The border radius of the button.
  ///
  /// Defaults to `8.0`.
  final double? borderRadius;

  /// The color of the button's border.
  ///
  /// A border is only displayed if both `borderColor` and `borderWidth` are not null.
  final Color? borderColor;

  /// The width of the button's border.
  ///
  /// A border is only displayed if both `borderColor` and `borderWidth` are not null.
  final double? borderWidth;

  /// The text style for the button's title.
  ///
  /// If null, it defaults to a white text with a font size of `16.0` and a
  /// font weight of `w500`.
  final TextStyle? textStyle;

  /// The height of the icon.
  ///
  /// Defaults to `24.0`.
  final double? iconHeight;

  /// The width of the icon.
  ///
  /// Defaults to `24.0`.
  final double? iconWidth;

  /// The color of the icon.
  ///
  -/// If null, the icon will be displayed with its original colors.
  final Color? iconColor;

  /// Creates a [SocialButton].
  ///
  /// The [buttonTitle] and [svgIcon] parameters are required.
  const SocialButton({
    super.key,
    required this.buttonTitle,
    required this.svgIcon,
    this.color,
    this.height,
    this.width,
    this.onTap,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.textStyle,
    this.iconHeight,
    this.iconWidth,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 48.0,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          border: borderColor != null && borderWidth != null
              ? Border.all(
                  color: borderColor!,
                  width: borderWidth!,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgIcon,
              height: iconHeight ?? 24,
              width: iconWidth ?? 24,
              colorFilter: iconColor != null
                  ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                  : null,
            ),
            const SizedBox(width: 8.0),
            Text(
              buttonTitle,
              style: textStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}