enum PlayerDetailsTab {
  info, batting, bowling, career, news
}

extension CapitalizeString on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
}

extension PlayerDetailsTabX on PlayerDetailsTab {
  static List<String> get names {
    return PlayerDetailsTab.values.map((e) => e.toString().split('.').elementAt(1).capitalize()).toList();
  }

  static int get tabCount {
    return PlayerDetailsTab.values.length;
  }
}