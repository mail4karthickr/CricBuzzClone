import 'package:cricbuzz_clone/ui/series_details/widgets/match_details/match_details_widget.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/news/news_widget.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/points_table/points_table_widget.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/squads/squads_widget.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/stats/stats_widget.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/venues/venues_widget.dart';
import 'package:flutter/material.dart';

class SeriesDetailsLayout extends StatefulWidget {
  const SeriesDetailsLayout({ Key? key, required this.tabController, required this.seriesId}) : super(key: key);

  final TabController tabController;
  final int seriesId;

  @override
  _SeriesDetailsLayoutState createState() => _SeriesDetailsLayoutState();
}

class _SeriesDetailsLayoutState extends State<SeriesDetailsLayout> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: <Widget>[
        const MatchDetailsWidget(),
        const PointsTableWidget(),
        SquadsWidget(seriesId: widget.seriesId),
        StatsWidget(seriesId: widget.seriesId),
        NewsWidget(seriesId: widget.seriesId),
        VenuesWidget(seriesId: widget.seriesId)
      ],
    );
  }
}