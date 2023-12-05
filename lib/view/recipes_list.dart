import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipy/domain/entities/recipe.dart';

import 'providers/recipes_list_provider.dart';
import 'widgets/recipe_tile.dart';

class RecipesList extends ConsumerWidget {
  const RecipesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Recipe>> recipesList = ref.watch(recipesListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipify'),
      ),
      body: Center(
          child: switch (recipesList) {
        AsyncData(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return RecipeTile(
                recipe: value[index],
              );
            }),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const CircularProgressIndicator(),
      }),
    );
  }
}
