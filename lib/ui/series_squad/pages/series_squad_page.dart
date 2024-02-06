import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/service/cricbuzz_service.dart';
import 'package:cricbuzz_clone/ui/series_squad/pages/series_squad_layout.dart';
import 'package:cricbuzz_clone/ui/series_squad/widgets/series_squad_list_widget/bloc/series_squad_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesSquadPage extends StatelessWidget {
  const SeriesSquadPage({
    super.key, 
    required this.seriesId, 
    required this.squadId,
    required this.title
  });

  final int seriesId;
  final int squadId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          title, 
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
      ),
      body: RepositoryProvider(
        create: (context) => CricBuzzRepository(service: CricBuzzService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<SeriesSquadListBloc>(
              create: (context) => SeriesSquadListBloc(repository: context.read<CricBuzzRepository>())
              ..add(GetSeriesPlayers(seriesId: seriesId, squadId: squadId))
            )
          ], 
          child: const SeriesSquadLayout()
        ),
      ),
    );
  }
}