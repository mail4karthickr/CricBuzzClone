import 'package:cb_ui/cb_ui_barrel.dart';
import 'package:cricbuzz_clone/core/api_status.dart';
import 'package:cricbuzz_clone/ui/player_details/widgets/player_info_widget/icc_ranking.dart';
import 'package:cricbuzz_clone/ui/player_details/widgets/player_info_widget/player_info_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cricbuzz_clone/core/components/progress_indicator.dart' as core;

enum Sections {
  avatar, personalInfo, iccRanking, teams, profile
}

class PlayerInfoWidget extends StatefulWidget {
  const PlayerInfoWidget({super.key, required this.playerId});

  final String playerId;

  @override
  State<PlayerInfoWidget> createState() => _PlayerInfoWidgetState();
}

class _PlayerInfoWidgetState extends State<PlayerInfoWidget> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    context.read<PlayerInfoBloc>().add(GetPlayerInfo(playerId: widget.playerId));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PlayerInfoBloc, PlayerInfoState>(
      builder: (context, state) {
        final apiStatus = state.status;
        final playerInfo = state.playerInfo;
        if (apiStatus.isLoading) {
          return const core.ProgressIndicator();
        } else if (apiStatus.isSuccess && playerInfo != null) {
          final faceImageId = playerInfo.faceImageId ?? '';
          return Container(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            color: Theme.of(context).colorScheme.secondary,
            child: ListView.builder(
              itemCount: Sections.values.length,
              itemBuilder: (context, index) {
                const sections = Sections.values;
                switch (sections[index]) {
                  case Sections.avatar:
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: CBAvatarInfo(
                        imageId: faceImageId, 
                        width: 100, 
                        height: 100, 
                        title: playerInfo.name ?? '', 
                        subTitle: playerInfo.intlTeam ?? ''
                      ),
                    );
                  case Sections.personalInfo:
                    return InfoTable(data: [
                      {"Born": playerInfo.doB ?? ''},
                      {"Birth Place": playerInfo.birthPlace ?? ''},
                      {"Nickname": playerInfo.nickName ?? ''},
                      {"Role": playerInfo.role ?? ''},
                      {"Batting Style": playerInfo.bat ?? ''},
                      {"Bowling Style": playerInfo.bowl ?? ''},
                    ]);
                  case Sections.iccRanking:
                    final rankings = playerInfo.rankings;
                    if (rankings != null) {
                      return ICCRanking(rankings: rankings);
                    } else {
                      return const SizedBox.shrink();
                    }
                  case Sections.teams:
                    return InfoSection(title: 'TEAMS', content: playerInfo.teams ?? '');
                  case Sections.profile:
                    return HtmlSection(title: 'PROFILE', content: playerInfo.bio ?? '');
                }
              }
            ),
          );
        } else {
          return const Text('Error');
        }
      },
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}