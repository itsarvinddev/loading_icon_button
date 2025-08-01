part of '../../loading_icon_button.dart';

/// [TextButton] with automatic loading state management implementation
///
/// When the button event is triggered, it will automatically enter the loading state, display the loading icon and loading prompt text, and not respond to click events,
/// If [loadingIcon] is null, the default [CircularProgressIndicator] will be used.
/// If [loadingLabel] is null, the prompt text will not be displayed,
/// At the same time, the event returns a [Future], which is completed when the loading ends, and automatically returns to the non-loading state (can refer to the mode of [RefreshIndicator]).
///
/// Due to logical conflicts, the [TextLoadingButton.loadingClickable] parameter cannot be used in the automatic management button,
/// If you need to use it, please use [TextLoadingButton] yourself.
///
/// [switchDuration] is the transition animation time caused by the change of the control size, which is implemented internally using [AnimatedSize], and the default is [kThemeAnimationDuration].
///
/// [style] Please refer to [TextButton.styleFrom] for generation
class TextAutoLoadingButton extends StatefulWidget {
  const TextAutoLoadingButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.statesController,
    this.loadingIcon,
    this.loadingLabel,
    this.switchDuration = kThemeAnimationDuration,
    required this.child,
  });

  /// Refer to [TextButton.icon]
  TextAutoLoadingButton.icon({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    this.statesController,
    this.loadingIcon,
    this.loadingLabel,
    Duration? switchDuration,
    required Widget icon,
    required Widget label,
  })  : autofocus = autofocus ?? false,
        clipBehavior = clipBehavior ?? Clip.none,
        switchDuration = switchDuration ?? kThemeAnimationDuration,
        child = _ButtonWithIconChild(label: label, icon: icon);

  /// Button click event
  ///
  /// When the click is triggered, the button will automatically enter the loading state and no longer receive new events,
  /// Until the completion of this event, the loading state can be ended
  ///
  /// If both this value and [onLongPress] are null, the button is disabled
  final AsyncCallback? onPressed;

  /// Button long press event
  ///
  /// When the long press is triggered, the button will automatically enter the loading state and no longer receive new events,
  /// Until the completion of this event, the loading state can be ended
  ///
  /// If both this value and [onPressed] are null, the button is disabled
  final AsyncCallback? onLongPress;

  /// Called when a pointer enters or exits the button response area.
  ///
  /// The value passed to the callback is true if a pointer has entered this
  /// part of the material and false if a pointer has exited this part of the
  /// material.
  final ValueChanged<bool>? onHover;

  /// Handler called when the focus changes.
  ///
  /// Called with true if this widget's node gains focus, and false if it loses
  /// focus.
  final ValueChanged<bool>? onFocusChange;

  /// Customizes this button's appearance.
  ///
  /// Non-null properties of this style override the corresponding
  /// properties in [themeStyleOf] and [defaultStyleOf]. [WidgetStateProperty]s
  /// that resolve to non-null values will similarly override the corresponding
  /// [WidgetStateProperty]s in [themeStyleOf] and [defaultStyleOf].
  ///
  /// Null by default.
  final ButtonStyle? style;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.material.inkwell.statesController}
  final WidgetStatesController? statesController;

  /// Typically the button's label.
  final Widget child;

  /// The loading icon displayed when the button is in the loading state
  ///
  /// The default implementation is [_LoadingChild]
  final Widget? loadingIcon;

  /// The prompt text displayed when the button is in the loading state
  ///
  /// The default is empty
  final Widget? loadingLabel;

  /// The transition animation time caused by the change of the control size
  ///
  /// The default is [kThemeAnimationDuration]
  final Duration switchDuration;

  @override
  State createState() => _TextAutoLoadingButtonState();
}

class _TextAutoLoadingButtonState
    extends AutoLoadingButtonState<TextAutoLoadingButton> {
  @override
  AsyncCallback? get _onPressed => widget.onPressed;

  @override
  AsyncCallback? get _onLongPress => widget.onLongPress;

  @override
  Widget build(BuildContext context) {
    return TextLoadingButton(
      isLoading: _isLoading,
      onPressed: _wrapOnPressed(),
      onLongPress: _wrapOnLongPress(),
      onHover: widget.onHover,
      onFocusChange: widget.onFocusChange,
      style: widget.style,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      statesController: widget.statesController,
      loadingIcon: widget.loadingIcon,
      loadingLabel: widget.loadingLabel,
      loadingClickable: false,
      switchDuration: widget.switchDuration,
      child: widget.child,
    );
  }
}

/// [TextButton] with loading state representation implementation
///
/// [isLoading] indicates whether the button is currently in the loading state, if the value is true, the loading icon and loading prompt text will be displayed, and the response to the click event is affected by [loadingClickable].
/// If [loadingIcon] is null, the default [CircularProgressIndicator] will be used.
/// If [loadingLabel] is null, the prompt will not be displayed.
///
/// If the value of [isLoading] is false, it is not in the loading state, only the [child] is displayed, and the click event can be responded to.
///
/// [loadingClickable] indicates whether the click event can be responded to when the button is in the [isLoading] state, including [onPressed] and [onLongPress], the default is false.
/// [switchDuration] is the transition animation time caused by the change of the control size, which is implemented internally using [AnimatedSize], and the default is [kThemeAnimationDuration].
///
/// [style] Please refer to [TextButton.styleFrom] for generation
class TextLoadingButton extends TextButton {
  TextLoadingButton({
    super.key,
    required bool isLoading,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    bool loadingClickable = false,
    Duration switchDuration = kThemeAnimationDuration,
    Widget? loadingIcon,
    Widget? loadingLabel,
    required Widget child,
  }) : super(
          onPressed: isLoading && !loadingClickable ? null : onPressed,
          onLongPress: isLoading && !loadingClickable ? null : onLongPress,
          child: AnimatedSize(
            duration: switchDuration,
            child: !isLoading
                ? child
                : loadingLabel == null
                    ? loadingIcon ?? const _LoadingChild()
                    : _ButtonWithIconChild(
                        icon: loadingIcon ?? const _LoadingChild(),
                        label: loadingLabel,
                      ),
          ),
        );

  /// Refer to [OutlinedButton.icon]
  ///
  /// When [loadingNoLabel] is true
  TextLoadingButton.icon({
    super.key,
    required bool isLoading,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    super.statesController,
    Widget? loadingIcon,
    Widget? loadingLabel,
    bool loadingClickable = false,
    Duration switchDuration = kThemeAnimationDuration,
    required Widget icon,
    required Widget label,
  }) : super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          onPressed: isLoading && !loadingClickable ? null : onPressed,
          onLongPress: isLoading && !loadingClickable ? null : onLongPress,
          child: AnimatedSize(
            duration: switchDuration,
            child: !isLoading
                ? _ButtonWithIconChild(icon: icon, label: label)
                : loadingLabel == null
                    ? loadingIcon ?? const _LoadingChild()
                    : _ButtonWithIconChild(
                        icon: loadingIcon ?? const _LoadingChild(),
                        label: loadingLabel,
                      ),
          ),
        );

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    if ((child as AnimatedSize).child is! _ButtonWithIconChild) {
      return super.defaultStyleOf(context);
    }

    final bool useMaterial3 = Theme.of(context).useMaterial3;
    final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
      useMaterial3
          ? const EdgeInsetsDirectional.fromSTEB(12, 8, 16, 8)
          : const EdgeInsets.all(8),
      const EdgeInsets.symmetric(horizontal: 4),
      const EdgeInsets.symmetric(horizontal: 4),
      MediaQuery.textScalerOf(context).scale(1),
    );
    return super.defaultStyleOf(context).copyWith(
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(scaledPadding),
        );
  }
}
