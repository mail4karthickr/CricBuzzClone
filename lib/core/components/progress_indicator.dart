import 'package:flutter/material.dart';

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(227, 234, 235, 1),
      child: const Center(
        child: CircularProgressIndicator()
      )
    ); 
  }
}