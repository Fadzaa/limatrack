import 'package:flutter/material.dart';
import 'package:limatrack_genetic/common/theme.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 10,
        width: isActive ? 30 : 10,
        decoration: BoxDecoration(
          color: isActive ? primaryColor : greyColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}