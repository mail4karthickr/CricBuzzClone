import 'package:cb_ui/cb_ui_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key, required this.title, required this.content});

  final String content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(title),
        Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          padding: const EdgeInsets.all(8),
          child: Text(content),
        ),
      ],
    );
  }
}