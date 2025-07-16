part of '../../loading_icon_button.dart';

/// Style configuration for LoadingButton
@immutable
class LoadingButtonStyle {
  const LoadingButtonStyle({
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.loadingBackgroundColor,
    this.successBackgroundColor,
    this.errorBackgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
    this.padding,
    this.textStyle,
    this.iconSize,
    this.alignment,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? loadingBackgroundColor;
  final Color? successBackgroundColor;
  final Color? errorBackgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final double? elevation;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double? iconSize;
  final AlignmentGeometry? alignment;

  /// Create a copy with modified properties
  LoadingButtonStyle copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? loadingBackgroundColor,
    Color? successBackgroundColor,
    Color? errorBackgroundColor,
    Color? borderColor,
    double? borderWidth,
    double? borderRadius,
    double? elevation,
    Color? shadowColor,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    double? iconSize,
    AlignmentGeometry? alignment,
  }) {
    return LoadingButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledForegroundColor:
          disabledForegroundColor ?? this.disabledForegroundColor,
      loadingBackgroundColor:
          loadingBackgroundColor ?? this.loadingBackgroundColor,
      successBackgroundColor:
          successBackgroundColor ?? this.successBackgroundColor,
      errorBackgroundColor: errorBackgroundColor ?? this.errorBackgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      iconSize: iconSize ?? this.iconSize,
      alignment: alignment ?? this.alignment,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LoadingButtonStyle &&
        other.backgroundColor == backgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.disabledBackgroundColor == disabledBackgroundColor &&
        other.disabledForegroundColor == disabledForegroundColor &&
        other.loadingBackgroundColor == loadingBackgroundColor &&
        other.successBackgroundColor == successBackgroundColor &&
        other.errorBackgroundColor == errorBackgroundColor &&
        other.borderColor == borderColor &&
        other.borderWidth == borderWidth &&
        other.borderRadius == borderRadius &&
        other.elevation == elevation &&
        other.shadowColor == shadowColor &&
        other.padding == padding &&
        other.textStyle == textStyle &&
        other.iconSize == iconSize &&
        other.alignment == alignment;
  }

  @override
  int get hashCode => Object.hash(
        backgroundColor,
        foregroundColor,
        disabledBackgroundColor,
        disabledForegroundColor,
        loadingBackgroundColor,
        successBackgroundColor,
        errorBackgroundColor,
        borderColor,
        borderWidth,
        borderRadius,
        elevation,
        shadowColor,
        padding,
        textStyle,
        iconSize,
        alignment,
      );
}
