# Changelog

## 1.0.4
- Added new version for improve the package

## 1.0.3
- Added `iconHeight` and `iconWidth` parameters to allow customization of SVG icon size.
- Updated documentation to include `iconHeight` and `iconWidth` parameters.
- Improved example code in `README.md` and added an `example/` folder for a complete demo app.

## 1.0.2
- Made `svgIcon` parameter mandatory.
- Removed default SVG icon management; users must provide their own SVG icons.
- Removed asset declarations from `pubspec.yaml` as the package no longer bundles icons.
- Updated documentation to reflect that users must provide SVG icons.

## 1.0.1
- Replaced `flutter_iconly` with `flutter_svg` for SVG icon support.
- Added `svgIcon` parameter to allow users to provide custom SVG icon paths.
- Updated default icon handling to use SVG assets from `assets/icons/`.
- Updated documentation to reflect SVG icon usage.

## 1.0.0
- Initial release of the Custom Social Button package.
- Added `SocialButton` widget with support for user-provided SVG icons using `flutter_svg`.
- Mandatory parameters: `title`, `buttonTitle`, and `svgIcon`.
- Customizable properties: `color`, `height`, `width`, `onTap`, `borderRadius`, `borderColor`, `borderWidth`, `textStyle`.