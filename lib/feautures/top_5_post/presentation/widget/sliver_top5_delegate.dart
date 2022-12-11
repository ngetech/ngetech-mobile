import 'package:flutter/material.dart';

class SliverTop5Delegate extends SliverPersistentHeaderDelegate {
  SliverTop5Delegate({
    required this.child,
  });

  final Widget child;
  final double _minHeight = 55.0;
  final double _maxHeight = 55.0;

  @override
  double get minExtent => _minHeight;

  @override
  double get maxExtent => _maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverTop5Delegate oldDelegate) {
    return _maxHeight != oldDelegate._maxHeight ||
        _minHeight != oldDelegate._minHeight ||
        child != oldDelegate.child;
  }
}
