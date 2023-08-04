import 'package:flutter/material.dart';
part './color_schemes.g.dart';
const customgreen = Color(0xFF19C771);


CustomColors lightCustomColors = const CustomColors(
  sourceCustomgreen: Color(0xFF19C771),
  customgreen: Color(0xFF006D3A),
  onCustomgreen: Color(0xFFFFFFFF),
  customgreenContainer: Color(0xFF66FEA1),
  onCustomgreenContainer: Color(0xFF00210E),
);

CustomColors darkCustomColors = const CustomColors(
  sourceCustomgreen: Color(0xFF19C771),
  customgreen: Color(0xFF44E187),
  onCustomgreen: Color(0xFF00391C),
  customgreenContainer: Color(0xFF00522A),
  onCustomgreenContainer: Color(0xFF66FEA1),
);



/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceCustomgreen,
    required this.customgreen,
    required this.onCustomgreen,
    required this.customgreenContainer,
    required this.onCustomgreenContainer,
  });

  final Color? sourceCustomgreen;
  final Color? customgreen;
  final Color? onCustomgreen;
  final Color? customgreenContainer;
  final Color? onCustomgreenContainer;

  @override
  CustomColors copyWith({
    Color? sourceCustomgreen,
    Color? customgreen,
    Color? onCustomgreen,
    Color? customgreenContainer,
    Color? onCustomgreenContainer,
  }) {
    return CustomColors(
      sourceCustomgreen: sourceCustomgreen ?? this.sourceCustomgreen,
      customgreen: customgreen ?? this.customgreen,
      onCustomgreen: onCustomgreen ?? this.onCustomgreen,
      customgreenContainer: customgreenContainer ?? this.customgreenContainer,
      onCustomgreenContainer: onCustomgreenContainer ?? this.onCustomgreenContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceCustomgreen: Color.lerp(sourceCustomgreen, other.sourceCustomgreen, t),
      customgreen: Color.lerp(customgreen, other.customgreen, t),
      onCustomgreen: Color.lerp(onCustomgreen, other.onCustomgreen, t),
      customgreenContainer: Color.lerp(customgreenContainer, other.customgreenContainer, t),
      onCustomgreenContainer: Color.lerp(onCustomgreenContainer, other.onCustomgreenContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
    );
  }
}