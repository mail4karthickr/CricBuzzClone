import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/service/cricbuzz_service.dart';
import 'package:cricbuzz_clone/ui/player_details/pages/player_details_layout.dart';
import 'package:cricbuzz_clone/ui/player_details/pages/player_details_tab.dart';
import 'package:cricbuzz_clone/ui/player_details/widgets/player_batting_widget/bloc/player_batting_bloc.dart';
import 'package:cricbuzz_clone/ui/player_details/widgets/player_bowling_widget/bloc/player_bowling_bloc.dart';
import 'package:cricbuzz_clone/ui/player_details/widgets/player_carrer_widget/bloc/player_carrer_bloc.dart';
import 'package:cricbuzz_clone/ui/player_details/widgets/player_info_widget/bloc/player_info_bloc.dart';
import 'package:cricbuzz_clone/ui/player_details/widgets/player_news_widget/bloc/player_news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerDetailsPage extends StatefulWidget {
  const PlayerDetailsPage({
    super.key,
    required this.playerId,
    required this.playerName
  });

  final String playerId;
  final String playerName;

  @override
  State<PlayerDetailsPage> createState() => _PlayerDetailsPageState();
}

class _PlayerDetailsPageState extends State<PlayerDetailsPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: PlayerDetailsTabX.tabCount, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(widget.playerName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
          tabs: PlayerDetailsTabX.names.map((e) => Text(e, style: const TextStyle(fontSize: 16))).toList(),
          isScrollable: true,
        ),
      ),
      body: RepositoryProvider(
        create: (context) => CricBuzzRepository(service: CricBuzzService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PlayerInfoBloc>(
              create: (context) => PlayerInfoBloc(
                repository: context.read<CricBuzzRepository>(),
                playerId: widget.playerId
              )
            ),
            BlocProvider<PlayerBattingBloc>(
              create: (context) => PlayerBattingBloc(
                repository: context.read<CricBuzzRepository>(),
                playerId: widget.playerId
              )
            ),
            BlocProvider<PlayerBowlingBloc>(
              create: (context) => PlayerBowlingBloc(
                repository: context.read<CricBuzzRepository>(),
                playerId: widget.playerId
              )
            ),
            BlocProvider<PlayerCarrerBloc>(
              create: (context) => PlayerCarrerBloc(
                repository: context.read<CricBuzzRepository>(),
                playerId: widget.playerId
              )
            ),
            BlocProvider<PlayerNewsBloc>(
              create: (context) => PlayerNewsBloc(
                repository: context.read<CricBuzzRepository>(),
                playerId: widget.playerId
              )
            )
          ],
          child: PlayerDetailsLayout(tabController: _tabController, playerId: widget.playerId),
        ),
      )
    );
  }
}