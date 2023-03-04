import 'package:flutter/material.dart';

class imageItemData extends StatelessWidget {
  const imageItemData(
    this.data, {
    Key? key,
  }) : super(key: key);

  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 1, left: 8, right: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Text(
        data,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}