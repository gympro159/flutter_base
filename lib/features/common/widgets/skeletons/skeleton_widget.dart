import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? radius;
  final List<double>? radiusCustom;

  const SkeletonWidget(
      {Key? key,
      required this.width,
      required this.height,
      this.radius,
      this.radiusCustom})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radiusCustom != null
          ? BorderRadius.only(
              topLeft: Radius.circular(radiusCustom![0]),
              topRight: Radius.circular(radiusCustom![1]),
              bottomRight: Radius.circular(radiusCustom![2]),
              bottomLeft: Radius.circular(radiusCustom![3]),
            )
          : BorderRadius.circular(radius ?? 5),
      child: SkeletonAnimation(
        child: Container(
          width: (width < 0) ? 0 : width,
          height: (height < 0) ? 0 : height,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: radiusCustom != null
                ? BorderRadius.only(
                    topLeft: Radius.circular(radiusCustom![0]),
                    topRight: Radius.circular(radiusCustom![1]),
                    bottomRight: Radius.circular(radiusCustom![2]),
                    bottomLeft: Radius.circular(radiusCustom![3]),
                  )
                : BorderRadius.circular(radius ?? 5),
          ),
        ),
      ),
    );
  }
}
