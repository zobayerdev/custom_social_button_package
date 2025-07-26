import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Color? color;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final TextStyle? textStyle;
  final double? iconHeight;
  final double? iconWidth;
  final Color? iconColor;

  // Map to associate titles with SVG icon paths
  static const Map<String, String> _iconMap = {
    'facebook': 'assets/icons/facebook.svg',
    'google': 'assets/icons/google.svg',
    'twitter': 'assets/icons/twitter.svg',
    'github': 'assets/icons/github.svg',
    'linkedin': 'assets/icons/linkedin.svg',
    'messenger': 'assets/icons/messenger.svg',
    'apple': 'assets/icons/apple.svg',
    // Add more mappings as needed
  };

  const SocialButton({
    super.key,
    required this.title,
    required this.buttonTitle,
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

  // Helper method to get the SVG icon path
  String _getSvgIcon() {
    final key = title.toLowerCase();
    return _iconMap[key] ?? 'assets/icons/facebook.svg'; // Fallback to default icon
  }

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
              _getSvgIcon(),
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