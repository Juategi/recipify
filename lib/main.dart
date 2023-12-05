import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/dependency_injection.dart';
import 'common/routes.dart';
import 'view/recipe_detail.dart';
import 'view/recipes_list.dart';

void main() {
  DependendyInjection.setUp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const RecipesList(),
        Routes.recipeDetail: (context) => const RecipeDetail(),
      },
    );
  }
}
