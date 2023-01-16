import 'package:flutter/material.dart';
import 'package:qoute_a_pic/Models/image_model.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.item}) : super(key: key);

  final UnSplashImageModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.network(item.urls?.smallS3 ?? ''),
    );
  }
}
