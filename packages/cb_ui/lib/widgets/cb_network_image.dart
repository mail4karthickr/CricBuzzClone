import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class CBNetworkImage extends StatelessWidget {
  const CBNetworkImage({
    super.key,
    required this.imageId,
    required this.width,
    required this.height
  });

  final String imageId;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c$imageId/i.jpg?d=high&p=de',
      httpHeaders: const {
        "X-RapidAPI-Key": "2fe6426376mshba6ba3c234ef5e8p122e39jsn331868a1557d",
        "X-RapidAPI-Host": "cricbuzz-cricket.p.rapidapi.com"
      },
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider, fit: BoxFit.fitHeight),
            ),
        );
      },
    );
  }
}