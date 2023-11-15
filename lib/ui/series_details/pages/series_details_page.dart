import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/model_barrel.dart';
import 'package:cricbuzz_clone/repository/service/cricbuzz_service.dart';
import 'package:cricbuzz_clone/ui/series_details/pages/series_details_layout.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/match_details/bloc/match_details_bloc.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/news/bloc/news_bloc.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/points_table/bloc/points_table_bloc.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/squads/bloc/squads_bloc.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/stats/bloc/stats_bloc.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/venues/bloc/venues_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SeriesDetailsTab {
  matches, table, squads, stats, news, venues
}

extension SeriesDetailsTabX on SeriesDetailsTab {
  static SeriesDetailsTab tabFor({required int index}) {
    if (index == 0) {
      return SeriesDetailsTab.matches;
    } else if (index == 1) {
      return SeriesDetailsTab.table;
    } else if (index == 2) {
      return SeriesDetailsTab.squads;
    } else if (index == 3) {
      return SeriesDetailsTab.stats;
    } else if (index == 4) {
      return SeriesDetailsTab.news;
    } else {
      return SeriesDetailsTab.venues;
    }
  }

  String get name {
    switch (this) {
      case SeriesDetailsTab.matches:
        return "Matches";
      case SeriesDetailsTab.table:
        return "Table";
      case SeriesDetailsTab.squads:
        return "Squads";
      case SeriesDetailsTab.stats:
        return "Stats";
      case SeriesDetailsTab.news:
        return "News";
      case SeriesDetailsTab.venues:
        return "Venues";
    }
  }
}

class SeriesDetailsPage extends StatefulWidget {
  const SeriesDetailsPage({ Key? key, required this.series }) : super(key: key);

  final SeriesAdWrapper series;

  @override
  State<SeriesDetailsPage> createState() => _SeriesDetailsPageState();
}

class _SeriesDetailsPageState extends State<SeriesDetailsPage> with TickerProviderStateMixin  {
  late final TabController _tabController;

    @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(widget.series.seriesName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        bottom: TabBar(
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          padding: const EdgeInsets.only(top: 0),
          controller: _tabController,
          indicatorPadding: const EdgeInsets.only(top: 13),
          tabs: SeriesDetailsTab.values.map((e) => Text(e.name, style: const TextStyle(fontSize: 16))).toList(),
          isScrollable: true,
        ),
      ),
      body: RepositoryProvider(
        create: (context) => CricBuzzRepository(service: CricBuzzService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MatchDetailsBloc>(
              create: (context) => MatchDetailsBloc(
                repository: context.read<CricBuzzRepository>()
              )..add(GetMatches(seriesId: widget.series.seriesId))
            ),
            BlocProvider<PointsTableBloc>(
              create: (context) => PointsTableBloc(
                repository: context.read<CricBuzzRepository>()
              )..add(GetPointsTable(seriesId: widget.series.seriesId))
            ),
            BlocProvider<SquadsBloc>(
              create: (context) => SquadsBloc(
                repository: context.read<CricBuzzRepository>()
              )
            ),
            BlocProvider<StatsBloc>(
              create: (context) => StatsBloc(
                repository: context.read<CricBuzzRepository>()
              )
            ),
            BlocProvider<NewsBloc>(
              create: (context) => NewsBloc(
                repository: context.read<CricBuzzRepository>()
              )
            ),
            BlocProvider<VenuesBloc>(
              create: (context) => VenuesBloc(
                repository: context.read<CricBuzzRepository>()
              )
            )
          ],
          child: SeriesDetailsLayout(tabController: _tabController, seriesId: widget.series.seriesId),
        ),
      )
    );
  }
}