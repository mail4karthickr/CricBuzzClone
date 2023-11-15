import 'package:cricbuzz_clone/repository/models/match_details.dart';
import 'package:cricbuzz_clone/core/components/country_flag.dart';
import 'package:flutter/material.dart';

class SeriesMatchesList extends StatelessWidget {
  const SeriesMatchesList({super.key, required this.matches});

  final List<MatchDetails> matches;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children horizontally to the start
        children: matches.map((match) {
        final desc = "${match.matchInfo.matchDesc} \u2022 ${match.matchInfo.venueInfo.city}";
        final matchInfo = match.matchInfo;
        final matchScore = match.matchScore;
        final team1 = match.matchInfo.team1;
        final team2 = match.matchInfo.team2;
        final team1Inngs = matchScore?.team1Score?.inngs1;
        final team2Inngs = matchScore?.team2Score?.inngs2;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(desc),
                    const SizedBox(height: 5),
                    scoreRow(inngs: team1Inngs, team: team1),
                    const SizedBox(height: 5),
                    scoreRow(inngs: team2Inngs, team: team2),
                    const SizedBox(height: 5),
                    Text(matchInfo.status),
                  ],
                ),
              ),
              if (matches.length > 1)
                const Divider(
                  color: Color.fromRGBO(211, 221, 211, 1),
                  height: 1,
                )
            ]
          );
        }).toList(),
      ),
    );
  }

  Widget teamNameRow({required Team team}) {
    return Row(children: [
      CountryFlag(imageId: team.imageId),
      const SizedBox(width: 5),
      Text(team.teamSName)
    ]);
  }

  Widget scoreRow({required Inngs? inngs, required Team team}) {
    return Row(children: [
      teamNameRow(team: team),
      const SizedBox(width: 30),
      if (inngs != null)
        Text("${inngs.runs} - ${inngs.wickets ?? 0} (${inngs.overs})")
    ]);
  }
}
