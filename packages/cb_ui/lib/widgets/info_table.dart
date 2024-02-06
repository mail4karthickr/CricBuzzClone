import 'package:cb_ui/cb_text.dart';
import 'package:cb_ui/cb_ui_barrel.dart';
import 'package:flutter/material.dart';

class InfoTable extends StatelessWidget {
  const InfoTable({super.key, required this.data});

  final List<Map<String, String>> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading('PERSONAL INFORMATION'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items(context)
        ),
      ],
    );
  }

  List<Widget> items(BuildContext context) {
    return data.map((entry) {
        final key = entry.keys.first;
        final value = entry.values.first;
        return Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.secondaryContainer,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(key),
                  const Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    alignment: Alignment.centerLeft,
                    child: Text(value, textAlign: TextAlign.start)
                  )
                ]
              ),
            ),
            const Divider(height: 0.3)
          ],
        );
      }
    ).toList();
  }
}