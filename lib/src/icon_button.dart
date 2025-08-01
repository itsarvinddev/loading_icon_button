part of '../loading_icon_button.dart';

class IconButtonLoading {
  final String? text;
  final Icon? icon;
  final Color color;

  const IconButtonLoading({
    this.text,
    this.icon,
    required this.color,
  });
}

Widget buildChildWithIcon(
  IconButtonLoading iconButtonLoading,
  double iconPadding,
  TextStyle textStyle,
) {
  return buildChildWithIC(
    iconButtonLoading.text,
    iconButtonLoading.icon,
    iconPadding,
    textStyle,
  );
}

Widget buildChildWithIC(
  String? text,
  Icon? icon,
  double gap,
  TextStyle textStyle,
) {
  var children = <Widget>[];
  children.add(icon ?? Container());
  if (text != null) {
    children.add(
      Padding(
        padding: EdgeInsets.all(gap),
      ),
    );
    children.add(
      buildText(text, textStyle),
    );
  }

  return Wrap(
    direction: Axis.horizontal,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: children,
  );
}

Widget buildText(String text, TextStyle style) {
  return Text(
    text,
    style: style,
  );
}
