import 'package:cricbuzz_clone/core/components/country_flag.dart';
import 'package:cricbuzz_clone/core/components/header.dart';
import 'package:cricbuzz_clone/core/components/numeric_text.dart';
import 'package:cricbuzz_clone/repository/models/points_table.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/points_table/bloc/points_table_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cricbuzz_clone/core/components/progress_indicator.dart' as core;

class PointsTableWidget extends StatelessWidget {
  const PointsTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PointsTableBloc, PointsTableState>(
      listener: (context, state) {},
      builder: (context, state) {
        final pointsTableInfo =  state.pointsTable?.pointsTable?.first.pointsTableInfo ?? [];
        return Container(
          color: const Color.fromRGBO(227, 234, 235, 1),
          child: Column(children: [
            Container(
              color: const Color.fromRGBO(211, 221, 211, 1),
              padding: const EdgeInsets.all(0),
              child: header(),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: pointsTableInfo.length,
                itemBuilder: (context, index) {
                  return row(pointsTableInfo[index], index);
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Color.fromRGBO(211, 221, 211, 1),
                    height: 1,
                  );
                },
              )
            )
          ]),
        );
      } 
    );
  }

  Widget header() {
    const double spacing = 20;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(children: [
        Container(
          width: 100,
          child: titleItem("Team")
        ),
        Spacer(),
        Row(children: [
          titleItem('P'),
          titleItem('W'),
          titleItem("L"),
          titleItem("NR"),
          titleItem("Pts"),
          Container(
            width: 50,
            alignment: Alignment.centerRight,
            child: const HeaderText("NRR"),
          ),
        ])
      ]),
    );
  }

  Widget row(PointsTableInfo info, int index) {
    const double spacing = 20;
    final imageId = info.teamImageId;
    final teamName = info.teamName ?? '';
    final teamQualifyStatus = info.teamQualifyStatus;
    final nrr = info.nrr;
    String teamNameWithStatus;
    if (teamQualifyStatus != null) {
      teamNameWithStatus = '$teamName ($teamQualifyStatus)';
    } else {
      teamNameWithStatus = teamName;
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 7, 20, 7),
      child: Row(children: [
        Container(
          child: SizedBox(
            width: 110,
            child: Row(children: [
              Text("${index+1}"),
              const SizedBox(width: 5),
              if (imageId != null) 
                CountryFlag(imageId: imageId),
              const SizedBox(width: 5),
              Text(teamNameWithStatus),
              ]
            ),
          ),
        ),
        const Spacer(),
        Container(
          child: Row(children: [
            intText(info.matchesPlayed),
            intText(info.matchesWon),
            intText(info.matchesLost, defaultValue: '0'),
            intText(info.noRes, defaultValue: '0'),
            intText(info.points),
            Container(
              alignment: Alignment.centerLeft,
              width: 50,
              child: Text(nrr ?? '')
            ),
          ]),
        ),
      ]),
    );
  }

  Widget titleItem(String title) {
     return Container(
      width: 38,
      child: HeaderText(title)
    );
  }

  Widget intText(int? text, {String? defaultValue}) {
    return Container(
      width: 38,
      child: NumericText.fromInt(text, defaultValue: defaultValue)
    );
  }
}