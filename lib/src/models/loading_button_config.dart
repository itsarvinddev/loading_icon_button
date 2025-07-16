part of '../../loading_icon_button.dart';

/// Global configuration for LoadingButton
class LoadingButtonConfig {
  static LoadingButtonConfig _instance = LoadingButtonConfig._internal();
  factory LoadingButtonConfig() => _instance;
  LoadingButtonConfig._internal();

  /// Default animation duration for all buttons
  Duration defaultAnimationDuration = const Duration(milliseconds: 300);

  /// Default loading widget
  Widget defaultLoadingWidget = const SizedBox(
    width: 20,
    height: 20,
    child: CircularProgressIndicator(
      strokeWidth: 2,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    ),
  );

  /// Default success widget
  Widget defaultSuccessWidget = const Icon(
    Icons.check,
    color: Colors.white,
    size: 20,
  );

  /// Default error widget
  Widget defaultErrorWidget = const Icon(
    Icons.error,
    color: Colors.white,
    size: 20,
  );

  /// Default button height
  double defaultHeight = 50.0;

  /// Default button width
  double defaultWidth = 200.0;

  /// Default border radius
  double defaultBorderRadius = 8.0;

  /// Default success duration
  Duration defaultSuccessDuration = const Duration(seconds: 2);

  /// Default error duration
  Duration defaultErrorDuration = const Duration(seconds: 2);

  /// Whether to enable haptic feedback
  bool enableHapticFeedback = true;

  /// Whether to enable debug mode
  bool debugMode = false;

  /// Reset to default values
  void reset() {
    _instance = LoadingButtonConfig._internal();
  }
}
