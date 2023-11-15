import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {

  const DetailRow({
    super.key, 
    required this.imageId, 
    required this.title, 
    required this.subTitle, 
    required this.description
  });

  final int imageId;
  final String title;
  final String subTitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(children: [
        Container(
          color: Colors.white,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.bas,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                alignment: Alignment.topLeft,
                fit: BoxFit.cover,
                width: 150,
                height: 100,
                imageUrl: 'https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c$imageId/i.jpg?d=high&p=de',
                httpHeaders: const {
                  "X-RapidAPI-Key": "2fe6426376mshba6ba3c234ef5e8p122e39jsn331868a1557d",
                  "X-RapidAPI-Host": "cricbuzz-cricket.p.rapidapi.com"
                }
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    Text(subTitle)
                  ]
                ),
              )
          ]),
        ),
        Text(description)
      ]),
    );
  }
}