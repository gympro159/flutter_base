import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FbReadMore extends StatefulWidget {
  final String title;
  final String content;
  final int lineNum;
  final String trimText;
  final TextStyle titleStyle;
  final TextStyle contentStyle;
  final TextStyle trimStyle;
  final String delimiter;

  const FbReadMore({
    Key key,
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
  _FbReadMoreState createState() => _FbReadMoreState();
}

class _FbReadMoreState extends State<FbReadMore> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    final result = LayoutBuilder(builder: (context, size) {
      int endIndex;
      TextSpan _delimiter = showMore
          ? TextSpan(text: '', style: widget.contentStyle)
          : TextSpan(text: widget.delimiter, style: widget.contentStyle);
      TextSpan _link = showMore
          ? TextSpan(text: '', style: widget.trimStyle)
          : TextSpan(
              text: widget.trimText,
              style: widget.trimStyle,
              recognizer: new TapGestureRecognizer()
                ..onTap = () => {
                      setState(() {
                        showMore = true;
                      })
                    },
            );

      final spanScheck =
          TextSpan(text: widget.title, style: widget.titleStyle, children: [
        TextSpan(text: widget.content, style: widget.contentStyle),
      ]);

      final textPainter = TextPainter(
        text: spanScheck,
        maxLines: widget.lineNum,
        textDirection: Directionality.of(context),
      );
      textPainter.layout(maxWidth: size.maxWidth);
      var pos = textPainter.getPositionForOffset(
        textPainter.size.bottomLeft(Offset.zero),
      );
      endIndex = pos.offset;
      final span =
          TextSpan(text: widget.title, style: widget.titleStyle, children: [
        TextSpan(
            text: showMore || endIndex > widget.content.length - 1
                ? widget.content
                : widget.content.substring(0, endIndex),
            style: widget.contentStyle),
        _delimiter,
        _link,
      ]);

      if (textPainter.didExceedMaxLines) {
        return RichText(
          text: span,
        );
      } else {
        return RichText(
            text: TextSpan(
                text: widget.title,
                style: widget.titleStyle,
                children: <TextSpan>[
              TextSpan(text: widget.content, style: widget.contentStyle),
            ]));
      }
    });
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: () {
            setState(() {
              showMore = !showMore;
            });
          },
          child: result),
    );
  }
}
