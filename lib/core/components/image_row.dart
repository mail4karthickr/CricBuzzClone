import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageRow extends StatelessWidget {

  const ImageRow({
    super.key, 
    required this.imageId, 
    required this.title, 
    required this.subTitle,
  });

  final String imageId;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(children: [
          CachedNetworkImage(
            alignment: Alignment.center,
            fit: BoxFit.cover,
            width: 100,
            height: 80,
            imageUrl: 'https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c$imageId/i.jpg?d=high&p=de',
            httpHeaders: const {
              "X-RapidAPI-Key": "2fe6426376mshba6ba3c234ef5e8p122e39jsn331868a1557d",
              "X-RapidAPI-Host": "cricbuzz-cricket.p.rapidapi.com"
            }
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(subTitle)
              ]
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 18)
      ]),
    );
  }
}