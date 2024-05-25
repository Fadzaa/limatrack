import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
      else {
        return child;
    }
    }
  }


class ShimmerOverlay extends StatelessWidget {
  const ShimmerOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    required this.axis
  });

  final bool isLoading;
  final Widget child;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      return ListView.builder(
        shrinkWrap: axis == Axis.vertical ? true : false,
        physics: axis == Axis.vertical ? const NeverScrollableScrollPhysics() : null,
        scrollDirection: axis,
        itemCount: 5,
          itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
      );
    }
    else {
      return child;
    }
  }
}

