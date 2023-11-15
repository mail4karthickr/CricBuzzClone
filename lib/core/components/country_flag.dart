import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CountryFlag extends StatelessWidget {
  const CountryFlag({super.key, required this.imageId});

  final int imageId;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 25,
      height: 13,
      imageUrl: 'https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c$imageId/i.jpg?d=high',
      httpHeaders: const {
        "X-RapidAPI-Key": "2fe6426376mshba6ba3c234ef5e8p122e39jsn331868a1557d",
        "X-RapidAPI-Host": "cricbuzz-cricket.p.rapidapi.com"
      }
    );
  }
}