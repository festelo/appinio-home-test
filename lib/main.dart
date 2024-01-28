import 'package:appinio_bloc/firebase_options.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/food_list_cubit.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/food_list_page.dart';
import 'package:appinio_bloc/ui/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        create: (ctx) => FoodListCubit()..load(),
        child: const FoodListPage(),
      ),
    );
  }
}
