part of '../../loading_icon_button.dart';

/// Builder class for creating LoadingButton with fluent API
class LoadingButtonBuilder {
  final ButtonType _type;
  AsyncCallback? _onPressed;
  Widget? _child;
  Widget? _loadingWidget;
  Widget? _successWidget;
  Widget? _errorWidget;
  LoadingButtonStyle? _style;
  Duration? _animationDuration;
  Duration? _successDuration;
  Duration? _errorDuration;
  double? _width;
  double? _height;
  String? _loadingText;
  String? _successText;
  String? _errorText;
  bool _resetAfterDuration = true;
  bool? _enableHapticFeedback;
  Function(dynamic)? _onError;
  Function(ActionState)? _onStateChanged;
  Key? _key;
  LoadingButtonBuilder._(this._type);

  /// Create elevated button builder
  factory LoadingButtonBuilder.elevated() =>
      LoadingButtonBuilder._(ButtonType.elevated);

  /// Create filled button builder
  factory LoadingButtonBuilder.filled() =>
      LoadingButtonBuilder._(ButtonType.filled);

  /// Create outlined button builder
  factory LoadingButtonBuilder.outlined() =>
      LoadingButtonBuilder._(ButtonType.outlined);

  /// Create text button builder
  factory LoadingButtonBuilder.text() =>
      LoadingButtonBuilder._(ButtonType.text);

  /// Create icon button builder
  factory LoadingButtonBuilder.icon() =>
      LoadingButtonBuilder._(ButtonType.icon);

  /// Set the button's onPressed callback
  LoadingButtonBuilder onPressed(AsyncCallback? onPressed) {
    _onPressed = onPressed;
    return this;
  }

  /// Set the button's child widget
  LoadingButtonBuilder child(Widget child) {
    _child = child;
    return this;
  }

  /// Set the button's key
  LoadingButtonBuilder key(Key key) {
    _key = key;
    return this;
  }

  /// Set custom loading widget
  LoadingButtonBuilder loadingWidget(Widget loadingWidget) {
    _loadingWidget = loadingWidget;
    return this;
  }

  /// Set custom success widget
  LoadingButtonBuilder successWidget(Widget successWidget) {
    _successWidget = successWidget;
    return this;
  }

  /// Set custom error widget
  LoadingButtonBuilder errorWidget(Widget errorWidget) {
    _errorWidget = errorWidget;
    return this;
  }

  /// Set button style
  LoadingButtonBuilder style(LoadingButtonStyle style) {
    _style = style;
    return this;
  }

  /// Set animation duration
  LoadingButtonBuilder animationDuration(Duration duration) {
    _animationDuration = duration;
    return this;
  }

  /// Set success duration
  LoadingButtonBuilder successDuration(Duration duration) {
    _successDuration = duration;
    return this;
  }

  /// Set error duration
  LoadingButtonBuilder errorDuration(Duration duration) {
    _errorDuration = duration;
    return this;
  }

  /// Set button width
  LoadingButtonBuilder width(double width) {
    _width = width;
    return this;
  }

  /// Set button height
  LoadingButtonBuilder height(double height) {
    _height = height;
    return this;
  }

  /// Set loading text
  LoadingButtonBuilder loadingText(String text) {
    _loadingText = text;
    return this;
  }

  /// Set success text
  LoadingButtonBuilder successText(String text) {
    _successText = text;
    return this;
  }

  /// Set error text
  LoadingButtonBuilder errorText(String text) {
    _errorText = text;
    return this;
  }

  /// Set whether to reset after duration
  LoadingButtonBuilder resetAfterDuration(bool reset) {
    _resetAfterDuration = reset;
    return this;
  }

  /// Set whether to enable haptic feedback
  LoadingButtonBuilder enableHapticFeedback(bool enable) {
    _enableHapticFeedback = enable;
    return this;
  }

  /// Set error handler
  LoadingButtonBuilder onError(Function(dynamic) onError) {
    _onError = onError;
    return this;
  }

  /// Set state change handler
  LoadingButtonBuilder onStateChanged(Function(ActionState) onStateChanged) {
    _onStateChanged = onStateChanged;
    return this;
  }

  /// Build the LoadingButton widget
  Widget build() {
    return LoadingButton(
      key: _key,
      type: _type,
      onPressed: _onPressed,
      loadingWidget: _loadingWidget,
      successWidget: _successWidget,
      errorWidget: _errorWidget,
      style: _style,
      animationDuration: _animationDuration,
      successDuration: _successDuration,
      errorDuration: _errorDuration,
      width: _width,
      height: _height,
      loadingText: _loadingText,
      successText: _successText,
      errorText: _errorText,
      resetAfterDuration: _resetAfterDuration,
      enableHapticFeedback: _enableHapticFeedback,
      onError: _onError,
      onStateChanged: _onStateChanged,
      child: _child,
    );
  }
}
