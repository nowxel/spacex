// @dart=2.9
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql/client.dart';

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
    final client = GraphQLClient(
      link: HttpLink("https://api.spacex.land/graphql/"),
      cache: GraphQLCache(store: InMemoryStore()),
    );
    String query = """
    query Missions {
      launches {
        mission_name
        details
      }
    }
    """;
    final QueryResult result =
    await client.query(QueryOptions(document: gql(query)));
    if (result.hasException) {
      print(result.exception.toString());
    } else {
      missions = result.data['launches']
          .map<Mission>((e) => Mission.fromJson(e))
          .toList();
      emit(missions);
    }
  }
}