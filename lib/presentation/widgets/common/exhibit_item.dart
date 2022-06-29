import 'package:flutter/material.dart';
import 'package:techincal_task/foundation/models/remote_models/exhibit_model.dart';
import 'package:techincal_task/presentation/widgets/common/image_card.dart';

class ExhibitItem extends StatelessWidget {
  const ExhibitItem({
    Key? key,
    required this.exhibit,
  }) : super(key: key);

  final Exhibit exhibit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 12),
        scrollDirection: Axis.horizontal,
        itemCount: exhibit.images?.length ?? 0,
        itemBuilder: (context, index) {
          final imagePath = exhibit.images![index];
          return ImageCard(
            imagePath: imagePath,
            title: exhibit.title ?? "",
          );
        },
      ),
    );
  }
}
