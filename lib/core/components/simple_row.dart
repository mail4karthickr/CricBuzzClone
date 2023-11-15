import 'package:flutter/material.dart';

class SimpleRow extends StatelessWidget {
  const SimpleRow({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                const Icon(Icons.arrow_forward_ios, size: 18)
              ]
            ),
          ),
          const Divider(
            color: Color.fromRGBO(211, 221, 211, 1),
            height: 1,
          ),
        ],
      ),
    );
  }
}