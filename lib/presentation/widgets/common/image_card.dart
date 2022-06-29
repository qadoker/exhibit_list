import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      height: 104,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => const SizedBox(),
      loadingBuilder: (_, image, ___) => image,
      frameBuilder: (_, image, __, ___) {
        return Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 14, height: 1),
                ),
                const SizedBox(height: 10),
                image,
              ],
            ),
          ),
        );
      },
    );
  }
}
