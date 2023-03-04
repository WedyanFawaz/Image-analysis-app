import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_items_identification/widgets/constants.dart';

import '../widgets/image_item.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(
      {required this.image,
      required this.imageData,
      required this.indexData,
      required this.confidenceData,
      Key? key})
      : super(key: key);
  final File image;

  final List<String> imageData;
  final List<String> indexData;
  final List<String> confidenceData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 15, 71, 117),
        body: Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 6),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_outlined),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Container(
                 width: double.infinity,
                  decoration: kAppContainerDec,
                  child: SizedBox(
                      height: size.height * 0.4,

                      width: size.width * 0.3,
                      child: Image.file(
                        image,
                        fit: BoxFit.cover,
                      ))),
              kverticalSpace,
              Text(
                'نتائج تحليل الصورة',
                style: kstyleText2,
                textAlign: TextAlign.end,
              ),
              kverticalSpace2,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('رقم الفهرسة', style: KsubTitle),
                  Text('الاحتمال', style: KsubTitle),
                  Text('اسم العنصر', style: KsubTitle),
                ],
              ),
              kverticalSpace,
              SizedBox(
                height: size.height * 0.23,
                child: ListView.builder(
                    itemCount: indexData.length,
                    itemBuilder: (context, index) => ImageItem(
                        indexData: indexData[index],
                        confidenceData: confidenceData[index],
                        imageData: imageData[index]),),
              )
            ])),
      ),
    );
  }
}




