import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BetweenOverflowRichtext extends StatefulWidget {
  final String? title;
  final String? content;
  final int lineNum;
  final String trimText;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final TextStyle? trimStyle;
  final String delimiter;

  const BetweenOverflowRichtext({
    Key? key,
    this.title,
    this.content,
    this.lineNum = 2,
    this.trimText = 'Show more',
    this.titleStyle,
    this.contentStyle,
    this.trimStyle,
    this.delimiter = '... ',
  }) : super(key: key);

  @override
  _BetweenOverflowRichtextState createState() =>
      _BetweenOverflowRichtextState();
}

class _BetweenOverflowRichtextState extends State<BetweenOverflowRichtext> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    final result = LayoutBuilder(builder: (context, size) {
      int endIndex;
      TextSpan tail = TextSpan(
        text: widget.trimText,
        style: widget.trimStyle,
      );

      final spanScheck = TextSpan(children: [
        TextSpan(text: widget.title, style: widget.titleStyle),
        TextSpan(text: widget.content, style: widget.contentStyle),
        TextSpan(text: widget.trimText, style: widget.trimStyle),
      ]);

      final textPainter = TextPainter(
        text: spanScheck,
        maxLines: widget.lineNum,
        textDirection: Directionality.of(context),
      );
      textPainter.layout(maxWidth: size.maxWidth + 10);
      var pos = textPainter.getPositionForOffset(
        textPainter.size.bottomLeft(Offset.zero),
      );
      endIndex = pos.offset;
      final span =
          TextSpan(text: widget.title, style: widget.titleStyle, children: [
        TextSpan(
            text: endIndex > widget.content!.length - 1
                ? widget.content
                : widget.content!.substring(0, endIndex) + '...',
            style: widget.contentStyle),
        // _delimiter,
        tail,
      ]);

      return RichText(
        text: span,
      );
    });
    return result;
  }
}
