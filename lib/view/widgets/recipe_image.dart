import 'package:flutter/widgets.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({super.key, required this.url});
  final String url;
  final double height = 100;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        url,
        width: height,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
