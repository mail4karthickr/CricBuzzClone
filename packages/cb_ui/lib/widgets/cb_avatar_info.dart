import 'package:cb_ui/cb_text_styles.dart';
import 'package:cb_ui/widgets/cb_network_image.dart';
import 'package:flutter/material.dart';

class CBAvatarInfo extends StatelessWidget {
  const CBAvatarInfo({
    super.key,
    required this.imageId,
    required this.width,
    required this.height,
    required this.title,
    required this.subTitle
  });

  final String imageId;
  final double width;
  final double height;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CBNetworkImage(imageId: imageId, width: 100, height: 100),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 3),
        Text(subTitle)
      ],
    );
  }
}