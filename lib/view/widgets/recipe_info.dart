import 'package:flutter/widgets.dart';
import 'package:recipy/common/styles.dart';
import 'package:recipy/domain/entities/recipe.dart';

import 'recipe_image.dart';

class RecipeInfo extends StatelessWidget {
  const RecipeInfo({super.key, required this.recipe});
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeImage(url: recipe.thumbnail),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.creatorName,
                    style: TextStyles.creatorName,
                  ),
                  Text(
                    recipe.rating.toString(),
                    style: TextStyles.rating,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text("Ingredientes: ", style: TextStyles.title),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: recipe.ingredients.length * 20,
            child: ListView.builder(
              itemCount: recipe.ingredients.length,
              itemBuilder: (context, index) {
                return Text(
                  "- ${recipe.ingredients.elementAt(index).name}",
                  style: TextStyles.subtitle,
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Instrucciones: ", style: TextStyles.title),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            child: Text(recipe.preparationDetails, style: TextStyles.subtitle),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Macros y calorias: ", style: TextStyles.title),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: recipe.macros.length * 20,
            child: ListView.builder(
              itemCount: recipe.macros.length,
              itemBuilder: (context, index) {
                return Text(
                  "${recipe.macros.elementAt(index).name}:  ${recipe.macros.elementAt(index).value}",
                  style: TextStyles.subtitle,
                );
              },
            ),
          ),
          Text("Calorias: ${recipe.calories}", style: TextStyles.subtitle),
          const SizedBox(
            height: 10,
          ),
          Text("Alérgenos: ", style: TextStyles.title),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: recipe.macros.length * 20,
            child: ListView.builder(
              itemCount: recipe.allergens.length,
              itemBuilder: (context, index) {
                return Text(
                  recipe.allergens.elementAt(index).name,
                  style: TextStyles.subtitle,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
