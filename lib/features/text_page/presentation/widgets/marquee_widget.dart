import 'package:flutter/material.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';
import 'package:marquee/marquee.dart';

//!https://pub.dev/packages/marquee

class MarqueeWidget extends StatelessWidget {
  const MarqueeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Marquee',
      content: Container(
        height: 30.0,
        child: Center(
          child: Marquee(
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: Theme.of(context).textTheme.bodyText2,
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 100.0,
            pauseAfterRound: Duration(seconds: 1),
            showFadingOnlyWhenScrolling: true,
            fadingEdgeStartFraction: 0.1,
            fadingEdgeEndFraction: 0.1,
            startPadding: 10.0,
            accelerationDuration: Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          ),
        ),
      ),
      sourceCode: 'https://gooogle.com',
    );
  }
}
