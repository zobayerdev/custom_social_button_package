import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final String svgIcon; // Mandatory SVG icon path
  final Color? color;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final TextStyle? textStyle;
  final double? iconHeight; // New parameter for icon height
  final double? iconWidth; // New parameter for icon width

  const SocialButton({
    super.key,
    required this.title,
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
              height: iconHeight ?? (textStyle?.fontSize ?? 16.0) + 4.0,
              width: iconWidth ?? (textStyle?.fontSize ?? 16.0) + 4.0,
              colorFilter: textStyle?.color != null
                  ? ColorFilter.mode(textStyle!.color!, BlendMode.srcIn)
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