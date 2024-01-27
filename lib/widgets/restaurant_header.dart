import 'package:appinio_bloc/theme.dart';
import 'package:flutter/material.dart';

class RestaurantHeader extends StatelessWidget {
  const RestaurantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: RestaurantHeaderDelegate(),
    );
  }
}

class RestaurantHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final opacityAnimationValue =
        CurveTween(curve: Curves.easeInCubic).evaluate(
      AlwaysStoppedAnimation((maxExtent - shrinkOffset) / maxExtent),
    );

    return Container(
      height: 150,
      color: searchBarColor,
      padding: const EdgeInsets.only(top: 22),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Opacity(
              opacity: opacityAnimationValue,
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Appinio's Restaurant",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox.fromSize(
            size: const Size.fromRadius(28),
            child: Opacity(
              opacity: opacityAnimationValue,
              child: const FittedBox(
                child: Icon(
                  Icons.food_bank_outlined,
                  color: Colors.black,
                  weight: 0.2,
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
