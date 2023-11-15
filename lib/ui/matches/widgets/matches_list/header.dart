import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, this.onTap });

  final String title;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: const Color.fromRGBO(211, 221, 211, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                softWrap: true,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            if (onTap != null)
              const Icon(Icons.arrow_forward_ios, size: 18)
          ],
        ),
      ),
    );
  }
}