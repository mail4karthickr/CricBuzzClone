import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/service/cricbuzz_service.dart';
import 'package:cricbuzz_clone/ui/matches/pages/bloc/matches_layout_bloc.dart';
import 'package:cricbuzz_clone/ui/matches/pages/matches_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MatchesTab { live, upcoming, recent }

extension MatchesTabX on MatchesTab {
  static MatchesTab tabFor({required int index}) {
    if (index == 0) {
      return MatchesTab.live;
    } else if (index == 1) {
      return MatchesTab.upcoming;
    } else {
      return MatchesTab.recent;
    }
  }
}

extension on MatchesTab {
  String get name {
    switch (this) {
      case MatchesTab.live:
        return "Live";
      case MatchesTab.upcoming:
        return "Upcoming";
      case MatchesTab.recent:
        return "Recent";
    }
  }
}

class MatchesPage extends StatefulWidget {
  const MatchesPage({Key? key}) : super(key: key);

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          title: const Text(
            'Current Matches',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
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
              tabs: MatchesTab.values.map((e) => Text(e.name)).toList()),
        ),
        body: RepositoryProvider(
          create: (context) => CricBuzzRepository(service: CricBuzzService()),
          child: BlocProvider(
            create: (context) => MatchesLayoutBloc(),
            child: MatchesLayout(tabController: _tabController),
          ),
        ));
  }
}
