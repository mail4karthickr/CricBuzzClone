import 'dart:io';

import 'package:cricbuzz_clone/repository/models/model_barrel.dart';
import 'package:cricbuzz_clone/ui/app_theme.dart';
import 'package:cricbuzz_clone/ui/matches/pages/matches_page.dart';
import 'package:cricbuzz_clone/ui/series_details/pages/series_details_page.dart';
import 'package:cricbuzz_clone/utils/app_bloc_observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorMatchesKey = GlobalKey<NavigatorState>(debugLabel: 'shellMatches');

final goRouter = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
         return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Home()
              ),
            )
          ]
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMatchesKey,
          routes: [
            GoRoute(
              path: '/matches',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: MatchesPage()
              ),
              routes: [
                GoRoute(
                  path: 'series-details',
                  builder: (BuildContext context, GoRouterState state) {
                    print('Details navigation ${state.matchedLocation} ${state.path}');
                    return SeriesDetailsPage(series: state.extra as SeriesAdWrapper);
                //    return SeriesDetailsPage(series: state.extra as SeriesAdWrapper);
                  }
                ),
              ]
            )
          ]
        )
      ]
    )
  ]
);

Future main() async {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({ 
    Key? key,
    required this.navigationShell
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index, 
      initialLocation: index == navigationShell.currentIndex
    );
  }
  
  @override
  Widget build(BuildContext context){
    return ScaffoldWithNavigationBar(
      body: navigationShell,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: materialNavigationBar(),
    );
  }

  NavigationBar materialNavigationBar() {
    return NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
          NavigationDestination(label: 'Matches', icon: Icon(Icons.settings)),
        ],
        onDestinationSelected: onDestinationSelected,
      );
  }

  CupertinoTabScaffold tabScaffold() {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Matches',
          ),
        ],
      ), 
      tabBuilder: (BuildContext context, int index) { 
        return CupertinoTabView(
          builder: (context) {
            if (index == 0) {
              return const Home();
            }
            if (index == 1) {
              return const MatchesPage();
            }
            return const Text("invalid index");
          },
        );
      },
    );
  }
}

class Home extends StatelessWidget {
const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      )
    );
  }
}