import 'package:appinio_bloc/data/repositories/firestore_food_repository.dart';
import 'package:appinio_bloc/data/repositories/firestore_order_repository.dart';
import 'package:appinio_bloc/data/repositories/in_memory_basket_repository.dart';
import 'package:appinio_bloc/domain/repositories/basket_repository.dart';
import 'package:appinio_bloc/domain/repositories/food_repository.dart';
import 'package:appinio_bloc/domain/repositories/order_repository.dart';
import 'package:appinio_bloc/firebase_options.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/food_list_cubit.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/food_list_page.dart';
import 'package:appinio_bloc/ui/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FirebaseFirestore>.value(
          value: FirebaseFirestore.instance,
        ),
        RepositoryProvider<FoodRepository>(
          create: (context) => FirestoreFoodRepository(
            context.read(),
          ),
        ),
        RepositoryProvider<OrderRepository>(
          create: (context) => FirestoreOrderRepository(
            context.read(),
          ),
        ),
        RepositoryProvider<BasketRepository>(
          create: (context) => InMemoryBasketRepository(),
        ),
      ],
      child: const AppinioRestaurantApp(),
    ),
  );
}

class AppinioRestaurantApp extends StatelessWidget {
  const AppinioRestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Appinio Demo Showcase',
      theme: CupertinoThemeData(
        primaryColor: bottomBarActionColor,
        brightness: Brightness.light,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (ctx) => FoodListCubit(context.read(), context.read())..load(),
        child: const FoodListPage(),
      ),
    );
  }
}
