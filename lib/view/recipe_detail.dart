import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipy/common/styles.dart';
import 'package:recipy/view/providers/recipe_provider.dart';
import 'package:recipy/view/widgets/recipe_info.dart';

import '../domain/entities/recipe.dart';
import 'widgets/favorite_widget.dart';

class RecipeDetail extends ConsumerWidget {
  const RecipeDetail({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    AsyncValue<Recipe> recipe = ref.watch(recipeProvider.call(id));
    return Center(
        child: switch (recipe) {
      AsyncData(:final value) => Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text(value.title, style: TextStyles.title),
                const Spacer(),
                FavoriteWidget(
                  id: value.id,
                  height: 25,
                ),
              ],
            ),
          ),
          body: RecipeInfo(
            recipe: value,
          )),
      AsyncError(:final error) => Scaffold(body: Text('Error: $error')),
      _ => const Scaffold(body: CircularProgressIndicator()),
    });
  }
}
