import 'package:flutter/material.dart';

import '../pages/details_page.dart';
import 'image_item_data_wg.dart';
class ImageItem extends StatelessWidget {
  const ImageItem({
    Key? key,
    required this.indexData,
    required this.confidenceData,
    required this.imageData,
  }) : super(key: key);

  final String indexData;
  final String confidenceData;
  final String imageData;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            gradient:
                const LinearGradient(colors: [Color.fromARGB(255, 26, 103, 196), Colors.black87]),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            imageItemData(indexData),
            imageItemData(confidenceData),
            imageItemData(imageData)
          ],
        ));
  }
}