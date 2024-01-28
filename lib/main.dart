import 'package:appinio_bloc/data/repositories/firestore_food_repository.dart';
import 'package:appinio_bloc/domain/repositories/food_repository.dart';
import 'package:appinio_bloc/firebase_options.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/food_list_cubit.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/food_list_page.dart';
import 'package:appinio_bloc/ui/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ),
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: BlocProvider(
        create: (ctx) => FoodListCubit(context.read())..load(),
        child: const FoodListPage(),
      ),
    );
  }
}
