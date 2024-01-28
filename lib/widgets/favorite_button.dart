import 'package:appinio_bloc/theme.dart';
import 'package:flutter/cupertino.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.onFavoriteTap,
    required this.isFavorite,
    super.key,
  });

  final VoidCallback onFavoriteTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onFavoriteTap,
      child: isFavorite
          ? Icon(
              CupertinoIcons.heart_fill,
              color: favoriteColor,
              size: 22,
            )
          : Icon(
              CupertinoIcons.heart,
              color: notFavoriteColor,
              size: 22,
            ),
    );
  }
}
