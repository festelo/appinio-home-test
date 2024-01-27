import 'package:appinio_bloc/pages/food_list_page/favorite_food_list_tab/favorite_food_list_cubit.dart';
import 'package:appinio_bloc/pages/food_list_page/favorite_food_list_tab/favorite_food_list_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (context, i) => switch (i) {
        0 => BlocProvider(
            create: (ctx) => FavoriteFoodListCubit()..load(),
            child: FavoriteFoodListTab(),
          ),
        _ => Container()
      },
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
