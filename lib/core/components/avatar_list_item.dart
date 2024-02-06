import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarListItem extends StatelessWidget {
  const AvatarListItem({
    super.key, 
    required this.imageId, 
    required this.title, 
    required this.subTitle,
    this.width,
    this.height,
    required this.onTap
  });

  final int imageId;
  final String title;
  final String subTitle;
  final double? width;
  final double? height;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c$imageId/i.jpg?d=high&p=de',
          httpHeaders: const {
            "X-RapidAPI-Key": "2fe6426376mshba6ba3c234ef5e8p122e39jsn331868a1557d",
            "X-RapidAPI-Host": "cricbuzz-cricket.p.rapidapi.com"
          },
          fit: BoxFit.scaleDown,
          imageBuilder: (context, imageProvider) {
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider, fit: BoxFit.scaleDown),
                ),
            );
          },
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(subTitle),
            ]
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 15)
      ],
    );
  }
}