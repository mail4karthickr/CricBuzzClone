import 'package:cb_ui/cb_ui_barrel.dart';
import 'package:flutter/material.dart';

class PlayerBattingWidget extends StatefulWidget {
  const PlayerBattingWidget({super.key});

  @override
  State<PlayerBattingWidget> createState() => _PlayerBattingWidgetState();
}

class _PlayerBattingWidgetState extends State<PlayerBattingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.all(10),
        child: CBDropDown(width: 100, buttonHeight: 25, menuHeight: 50)
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 250,
          itemBuilder: (context, index) {
            return Text('item $index');
          }),
      )
    ]);
  }
}