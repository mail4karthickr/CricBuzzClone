import 'package:cricbuzz_clone/core/api_status.dart';
import 'package:cricbuzz_clone/core/components/avatar_list_item.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/header.dart';
import 'package:cricbuzz_clone/ui/series_squad/widgets/series_squad_list_widget/bloc/series_squad_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SeriesSquadListWidget extends StatefulWidget {
  const SeriesSquadListWidget({super.key});

  @override
  State<SeriesSquadListWidget> createState() => _SeriesSquadListWidgetState();
}

class _SeriesSquadListWidgetState extends State<SeriesSquadListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesSquadListBloc, SeriesSquadListState>(
      builder: (context, state) {
        final players = state.players.player ?? [];
        final isLoading = state.status.isLoading;
        final isError = state.status.isError;
        final isSuccess = state.status.isSuccess;

        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (isError) {
          return const Text('error');
        } else if (isSuccess) {
          return Container(
            color: const Color.fromRGBO(227, 234, 235, 1),
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (BuildContext context, int index) {
                final player = players[index];
                final isHeader = player.isHeader ?? false;
                final name = player.name ?? '';
                final role = player.role ?? '';
                final imageId = player.imageId ?? 0;
                final playerId = player.id;
                if (isHeader) {
                  return Header(title: name);
                } else {
                  return GestureDetector(
                    onTap: () {
                      if (playerId == null) { return; }
                      context.push(
                        '/matches/series-details/squads/players/playerDetails', 
                        extra: {'playerId': playerId, 'playerName': name}
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: AvatarListItem(
                            imageId: imageId, 
                            title: name, 
                            subTitle: role, 
                            width: 40, 
                            height: 40, 
                            onTap: () {
                            
                            }
                          ),
                        ),
                        const Divider(
                          color: Color.fromRGBO(211, 221, 211, 1),
                          height: 1, 
                          thickness: 0.5
                        )
                      ],
                    ),
                  );
                }
              }
            ),
          );
        } else {
          return const Placeholder();
        }
      }, 
    );
  }
}