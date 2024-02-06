import 'package:cricbuzz_clone/ui/player_details/widgets/player_batting_widget/player_batting_widget.dart';
import 'package:cricbuzz_clone/ui/player_details/widgets/player_bowling_widget/player_bowling_widget.dart';
import 'package:cricbuzz_clone/ui/player_details/widgets/player_carrer_widget/player_carrer_widget.dart';
import 'package:cricbuzz_clone/ui/player_details/widgets/player_info_widget/player_info_barrel.dart';
import 'package:cricbuzz_clone/ui/player_details/widgets/player_news_widget/player_news_widget.dart';
import 'package:flutter/material.dart';

class PlayerDetailsLayout extends StatefulWidget {
  final TabController tabController;
  final String playerId;

  const PlayerDetailsLayout({super.key, required this.tabController, required this.playerId});

  @override
  State<PlayerDetailsLayout> createState() => _PlayerDetailsLayoutState();
}

class _PlayerDetailsLayoutState extends State<PlayerDetailsLayout> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: <Widget> [
        PlayerInfoWidget(playerId: widget.playerId),
        PlayerBattingWidget(),
        PlayerBowlingWidget(),
        PlayerCarrerWidget(),
        PlayerNewsWidget()
      ]
    );
  }
}