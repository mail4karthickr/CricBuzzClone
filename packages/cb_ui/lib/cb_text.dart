import 'package:cb_ui/cb_text_styles.dart';
import 'package:flutter/widgets.dart';

class CBText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const CBText.headingOne(this.text, {super.key}) : style = heading1Style;
  const CBText.headingTwo(this.text, {super.key}) : style = heading2Style;
  const CBText.headingThree(this.text, {super.key}) : style = heading3Style;
  const CBText.headline(this.text, {super.key}) : style = headlineStyle;
  const CBText.subheading(this.text, {super.key}) : style = subheadingStyle;
  const CBText.caption(this.text, {super.key}) : style = captionStyle;
  const CBText.body(this.text, {super.key}): style = bodyStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}