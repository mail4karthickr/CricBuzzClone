import 'package:flutter/material.dart';

enum MatchCategory {
  all, international, league, domestic, women
}

extension MatchCategoryX on MatchCategory {
  String get name {
    switch (this) {
      case MatchCategory.all:
      return "All";
      case MatchCategory.international:
      return "International";
      case MatchCategory.league:
      return "League";
      case MatchCategory.domestic:
      return "Domestic";
      case MatchCategory.women:
      return "Women";
    }
  }

  Color colorFor(MatchCategory selectedCategory) {
    if (this == selectedCategory) {
      return const Color.fromRGBO(8, 171, 126, 1);
    } else {
      return Colors.white;
    }
  }

  Color textColorFor(MatchCategory selectedCategory) {
    if (this == selectedCategory) {
      return Colors.white;
    } else {
      return const Color.fromRGBO(89, 89, 89, 1);
    }
  }

  bool get isAll => this == MatchCategory.all;
}

class MatchesCategories extends StatefulWidget {
  const MatchesCategories({ Key? key, required this.onTap }) : super(key: key);

  final Function(MatchCategory) onTap;

  @override
  State<MatchesCategories> createState() => _MatchesCategoriesState();
}

class _MatchesCategoriesState extends State<MatchesCategories> {
  var selectedCategory = MatchCategory.all;

  @override
  Widget build(BuildContext context){
      return Container(
        color: const Color.fromRGBO(227, 234, 235, 1),
      height: 60, // Set the desired height
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Wrap(
            spacing: 8.0, // Space between chips
            runSpacing: 8.0, // Space between rows
            children: MatchCategory.values.map((item) {
              return InputChip(
                onPressed: () {
                  setState(() { selectedCategory = item; });
                  widget.onTap(item);
                },
                label: Text(
                  item.name,
                  style: TextStyle(color: item.textColorFor(selectedCategory)),
                ),
                 backgroundColor: item.colorFor(selectedCategory),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}