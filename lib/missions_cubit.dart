import 'package:flutter_bloc/flutter_bloc.dart';

import 'missions.dart';

class MissionsCubit extends Cubit<List<Mission>> {
  List<Mission> missions = List.empty();

  MissionsCubit() : super(List.empty()) {
    _loadMissions();
  }

  void search(String query) {
    emit(query.isEmpty
        ? missions
        : missions
        .where((element) =>
        element.missionName.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }

  void _loadMissions() async {
    missions = [
      Mission("Mission One", "London is the capital of Great Britain"),
      Mission("Mission Two", "Who cares"),
    ];
    emit(missions);
  }
}