import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'missions.dart';
import 'missions_cubit.dart';

class MissionsPage extends StatelessWidget {
  final searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    searchInputController.addListener(() {
      final query = searchInputController.text;
      context.read<MissionsCubit>().search(query);
    });
    return Stack(
      children: [
        BlocBuilder<MissionsCubit, List<Mission>>(
          builder: (context, missions) => Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: missions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    child: Center(child: Text(missions[index].missionName)),
                  );
                }),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AnimSearchBar(
              color: Colors.amber[200],
              width: 400,
              rtl: true,
              textController: searchInputController,
              onSuffixTap: () {
                print("hui");
                searchInputController.clear();
                context.read<MissionsCubit>().search("");
              },
            ),
          ),
        ),
      ],
    );
  }
}