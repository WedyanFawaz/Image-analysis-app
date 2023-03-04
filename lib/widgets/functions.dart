import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_items_identification/pages/details_page.dart';

void identiyItemInImage(BuildContext context, {required File image}) async {
  final imageLabeler = GoogleMlKit.vision.imageLabeler();
  final inputImage = InputImage.fromFilePath(image.path);
  final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

  final List<String> imageData = [];
  final List<String> indexData = [];
  final List<String> confidenceData = [];

  for (ImageLabel label in labels) {
    imageData.add(label.label);
    indexData.add(label.index.toString());
    confidenceData.add(label.confidence.toStringAsFixed(2));
  }
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailsPage(
                image: image,
                imageData: imageData,
                indexData: indexData,
                confidenceData: confidenceData,
              )));
}
