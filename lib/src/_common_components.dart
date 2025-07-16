part of '../loading_icon_button.dart';

/// [ElevatedAutoLoadingButton]，[FilledAutoLoadingButton]&[State]parent class
///
/// Provide standard implementation
abstract class AutoLoadingButtonState<T extends StatefulWidget>
    extends State<T> {
  /// Trigger the execution of the widget's onPressed event and enter the loading state
  ///
  /// Call by passing [GlobalKey]
  ///
  /// Return the future of the original onPressed event completion.
  /// If the widget does not pass the original onPressed event, nothing will happen,
  /// If the widget is in the loading state, the future of the current loading event will be returned, and the event will not be triggered repeatedly
  Future<void> doPress() {
    if (_onPressedFuture != null) {
      return _onPressedFuture!;
    }

    final onPressed = _onPressed;

    if (onPressed == null) {
      return Future.value();
    }

    final completer = Completer<void>();

    setState(() {
      _onPressedFuture = completer.future;
    });

    onPressed().then((value) {
      _onPressedFuture = null;
      completer.complete();

      if (mounted) {
        setState(() {});
      }
    });

    return completer.future;
  }

  /// Trigger the execution of the widget's onLongPress event
  ///
  /// Call by passing [GlobalKey]
  ///
  /// Return the future of the original onLongPress event completion.
  /// If the widget does not pass the original onLongPress event, nothing will happen,
  /// If the widget is in the loading state, the future of the current loading event will be returned, and the event will not be triggered repeatedly
  Future<void> doLongPress() {
    if (_onLongPressFuture != null) {
      return _onLongPressFuture!;
    }

    final onPressed = _onLongPress;

    if (onPressed == null) {
      return Future.value();
    }

    final completer = Completer<void>();

    setState(() {
      _onLongPressFuture = completer.future;
    });

    onPressed().then((value) {
      _onLongPressFuture = null;
      completer.complete();

      if (mounted) {
        setState(() {});
      }
    });

    return completer.future;
  }

  /// Whether the current is in the loading state
  bool get _isLoading => _onPressedFuture != null || _onLongPressFuture != null;

  /// If the current is executing the onPressed loading event, then its completion future, otherwise null
  Future<void>? _onPressedFuture;

  /// If the current is executing the onLongPress loading event, then its completion future, otherwise null
  Future<void>? _onLongPressFuture;

  /// Original widget click event
  AsyncCallback? get _onPressed;

  /// Original widget long press event
  AsyncCallback? get _onLongPress;

  /// [_onPressed] event wrapper
  VoidCallback? _wrapOnPressed() {
    return _onPressed == null ? null : doPress;
  }

  /// [_onLongPress] event wrapper
  VoidCallback? _wrapOnLongPress() {
    return _onLongPress == null ? null : doLongPress;
  }
}

class _ButtonWithIconChild extends StatelessWidget {
  const _ButtonWithIconChild({
    required this.label,
    required this.icon,
  });

  final Widget label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaler.scale(1) ?? 1;
    final double gap = scale <= 1 ? 8 : lerpDouble(8, 4, min(scale - 1, 1))!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[icon, SizedBox(width: gap), Flexible(child: label)],
    );
  }
}

class _LoadingChild extends StatelessWidget {
  const _LoadingChild();

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    Widget result = CircularProgressIndicator(
      strokeWidth: 2,
      color: iconTheme.color,
    );

    result = Padding(
      padding: const EdgeInsets.all(2),
      child: result,
    );

    result = SizedBox.square(
      dimension: iconTheme.size ?? 24,
      child: result,
    );

    return result;
  }
}
