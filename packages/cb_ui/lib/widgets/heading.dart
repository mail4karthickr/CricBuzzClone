import 'package:cb_ui/cb_text.dart';
import 'package:flutter/widgets.dart';

class Heading extends StatelessWidget {
  const Heading(this.heading, {super.key});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 10, 0, 4),
      child: CBText.body(heading)
    );
  }
}