import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BoxAnimated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: double.infinity,
          height: 30.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
