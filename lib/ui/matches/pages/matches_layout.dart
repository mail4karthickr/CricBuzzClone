import 'package:cricbuzz_clone/ui/matches/pages/bloc/matches_layout_bloc.dart';
import 'package:cricbuzz_clone/ui/matches/pages/matches_page.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/live_matches_widget.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/recent_matches_widget.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/upcoming_matches_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchesLayout extends StatefulWidget {
  const MatchesLayout({ Key? key, required this.tabController}) : super(key: key);

  final TabController tabController;

  @override
  _MatchesLayoutState createState() => _MatchesLayoutState();
}

class _MatchesLayoutState extends State<MatchesLayout> {
  
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_handleTabChange);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: const <Widget>[
        LiveMatchesWidget(),
        UpcomingMatchesWidget(),
        RecentMatchesWidget()
      ],
    );
  }

  void _handleTabChange() {
    if (widget.tabController.indexIsChanging) {
      context.read<MatchesLayoutBloc>().add(
        LayoutTabChanged(tab: MatchesTabX.tabFor(index: widget.tabController.index))
      );
    }
  }
}