import 'package:flutter/widgets.dart';

import 'package:cb_ui/cb_ui_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlSection extends StatelessWidget {
  const HtmlSection({super.key, required this.title, required this.content});

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
          child: HtmlWidget(content),
        ),
      ],
    );
  }
}