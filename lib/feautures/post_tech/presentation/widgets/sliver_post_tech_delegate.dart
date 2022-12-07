import 'package:flutter/material.dart';

class SliverPostTechDelegate extends SliverPersistentHeaderDelegate {
  SliverPostTechDelegate({
    required this.child,
  });

  final Widget child;
  final double _minHeight = 50.0;
  final double _maxHeight = 50.0;

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
  bool shouldRebuild(SliverPostTechDelegate oldDelegate) {
    return _maxHeight != oldDelegate._maxHeight ||
        _minHeight != oldDelegate._minHeight ||
        child != oldDelegate.child;
  }
}