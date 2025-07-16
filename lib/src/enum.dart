part of '../../loading_icon_button.dart';

/// Enum representing the different states of a loading button
enum ActionState {
  /// Button is in idle state and ready to be pressed
  idle,

  /// Button is in loading state
  loading,

  /// Button completed successfully
  success,

  /// Button encountered an error
  error,

  /// Button is disabled
  disabled,
}

/// Extension methods for ButtonState
extension ButtonStateExtension on ActionState {
  /// Check if button is in idle state
  bool get isIdle => this == ActionState.idle;

  /// Check if button is loading
  bool get isLoading => this == ActionState.loading;

  /// Check if button is in success state
  bool get isSuccess => this == ActionState.success;

  /// Check if button is in error state
  bool get isError => this == ActionState.error;

  /// Check if button is disabled
  bool get isDisabled => this == ActionState.disabled;

  /// Check if button is interactive (can be pressed)
  bool get isInteractive => this == ActionState.idle;
}

/// Enum representing different types of buttons
enum ButtonType {
  /// Elevated button style
  elevated,

  /// Filled button style
  filled,

  /// Outlined button style
  outlined,

  /// Text button style
  text,

  /// Icon button style
  icon,
}
