import 'package:flutter/widgets.dart';
import 'package:recipy/common/styles.dart';
import 'package:recipy/domain/entities/recipe.dart';

import 'recipe_image.dart';

class RecipeInfo extends StatefulWidget {
  const RecipeInfo({super.key, required this.recipe});
  final Recipe recipe;

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pictureAnimation;
  late Animation<Offset> _textAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _pictureAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
    _animationController.forward();
    _textAnimation = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
              ScaleTransition(
                scale: _pictureAnimation,
                child: RecipeImage(url: widget.recipe.thumbnail),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recipe.creatorName,
                    style: TextStyles.creatorName,
                  ),
                  Text(
                    widget.recipe.rating.toString(),
                    style: TextStyles.rating,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SlideTransition(
            position: _textAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Ingredientes: ", style: TextStyles.title),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: widget.recipe.ingredients.length * 20,
                  child: ListView.builder(
                    itemCount: widget.recipe.ingredients.length,
                    itemBuilder: (context, index) {
                      return Text(
                        "- ${widget.recipe.ingredients.elementAt(index).name}",
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
                  child: Text(widget.recipe.preparationDetails,
                      style: TextStyles.subtitle),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Macros y calorias: ", style: TextStyles.title),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: widget.recipe.macros.length * 20,
                  child: ListView.builder(
                    itemCount: widget.recipe.macros.length,
                    itemBuilder: (context, index) {
                      return Text(
                        "${widget.recipe.macros.elementAt(index).name}:  ${widget.recipe.macros.elementAt(index).value}",
                        style: TextStyles.subtitle,
                      );
                    },
                  ),
                ),
                Text("Calorias: ${widget.recipe.calories}",
                    style: TextStyles.subtitle),
                const SizedBox(
                  height: 10,
                ),
                Text("Alérgenos: ", style: TextStyles.title),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: widget.recipe.macros.length * 20,
                  child: ListView.builder(
                    itemCount: widget.recipe.allergens.length,
                    itemBuilder: (context, index) {
                      return Text(
                        widget.recipe.allergens.elementAt(index).name,
                        style: TextStyles.subtitle,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
