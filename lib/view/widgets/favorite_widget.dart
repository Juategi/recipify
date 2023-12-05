import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipy/view/providers/favorites_provider.dart';

class FavoriteWidget extends ConsumerWidget {
  const FavoriteWidget({super.key, required this.id, this.height = 20});
  final String id;
  final double height;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFavorites = ref.watch(asyncFavoritesProvider);
    return switch (asyncFavorites) {
      AsyncData(:final value) => SizedBox(
          width: height,
          height: height,
          child: InkWell(
            child: Icon(
              Icons.favorite,
              color: value.contains(id) ? Colors.red : Colors.grey,
              size: height,
            ),
            onTap: () {
              ref.read(asyncFavoritesProvider.notifier).toggleFavorite(id);
            },
          ),
        ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
