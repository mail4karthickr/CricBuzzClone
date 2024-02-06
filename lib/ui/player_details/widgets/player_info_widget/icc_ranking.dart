import 'dart:math';

import 'package:cb_ui/widgets/heading.dart';
import 'package:cricbuzz_clone/repository/models/player_info.dart';
import 'package:flutter/material.dart';


class TableDataType {
  TableDataType.title({required this.title}) : rank = null, bestRank = null;  
  TableDataType.ranking({required this.rank, required this.bestRank}) : title = null;

  final String? title;
  final String? rank;
  final String? bestRank;
}

class ICCRanking extends StatefulWidget {
  const ICCRanking({super.key, required this.rankings});

  final Rankings rankings;

  @override
  State<ICCRanking> createState() => _ICCRankingState();
}

class _ICCRankingState extends State<ICCRanking> {
  late List<TableDataType> dataType;

  @override
  void initState() {
    super.initState();
    dataType = [
      TableDataType.title(title: ''),
      TableDataType.title(title: 'TEST'),
      TableDataType.title(title: 'ODI'),
      TableDataType.title(title: 'T20I'),
      TableDataType.title(title: 'Bat'),
      TableDataType.ranking(rank: widget.rankings.bat?.testRank, bestRank: widget.rankings.bat?.testBestRank),
      TableDataType.ranking(rank: widget.rankings.bat?.odiRank, bestRank: widget.rankings.bat?.odiBestRank),
      TableDataType.ranking(rank: widget.rankings.bat?.t20Rank, bestRank: widget.rankings.bat?.t20BestRank),
      TableDataType.title(title: 'Bowl'),
      TableDataType.ranking(rank: widget.rankings.bowl?.testRank, bestRank: widget.rankings.bowl?.testBestRank),
      TableDataType.ranking(rank: widget.rankings.bowl?.odiRank, bestRank: widget.rankings.bowl?.odiBestRank),
      TableDataType.ranking(rank: widget.rankings.bowl?.t20Rank, bestRank: widget.rankings.bowl?.t20BestRank),
      TableDataType.title(title: 'All Round'),
      TableDataType.ranking(rank: widget.rankings.all?.testRank, bestRank: widget.rankings.all?.testBestRank),
      TableDataType.ranking(rank: widget.rankings.all?.odiRank, bestRank: widget.rankings.all?.odiBestRank),
      TableDataType.ranking(rank: widget.rankings.all?.t20Rank, bestRank: widget.rankings.all?.t20BestRank),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading('ICC RANKING'),
        Container(
          color: Theme.of(context).colorScheme.secondary,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 4,
            crossAxisSpacing: 0.5,
            mainAxisSpacing: 0.5,
            childAspectRatio: 1/.4,
            children: dataType.map((type) {
              final title = type.title;
              final rank = type.rank;
              final bestRank = type.bestRank;
              if (title != null) {
                return titleWidget(title);
              } else {
                return rankingWidget(rank: rank, bestRank: bestRank);
              }
            }).toList()
          ),
        ),
      ],
    );
  }

  Widget titleWidget(String title) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Center(child: Text(title))
    );
  }

  Widget rankingWidget({String? rank, String? bestRank}) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(rank ?? '--'),
          Text(bestRank != null ? 'Best: $bestRank' : '--')
        ],
      ),
    );
  }
}