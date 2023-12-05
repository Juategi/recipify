import 'package:flutter/material.dart';
import 'package:recipy/common/routes.dart';
import 'package:recipy/common/styles.dart';
import 'package:recipy/domain/entities/recipe.dart';
import 'package:recipy/view/widgets/favorite_widget.dart';
import 'package:recipy/view/widgets/recipe_image.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({super.key, required this.recipe});
  final Recipe recipe;
  final double height = 100;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.recipeDetail,
              arguments: recipe.id);
        },
        child: SizedBox(
          height: height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeImage(url: recipe.thumbnail),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 220,
                        child: Text(
                          recipe.title,
                          style: TextStyles.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FavoriteWidget(
                        id: recipe.id,
                        height: 18,
                      ),
                    ],
                  ),
                  Text(
                    recipe.subtitle,
                    style: TextStyles.subtitle,
                  ),
                  const Spacer(),
                  Text(
                    recipe.creatorName,
                    style: TextStyles.creatorName,
                  ),
                  Text(
                    recipe.rating.toString(),
                    style: TextStyles.rating,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
