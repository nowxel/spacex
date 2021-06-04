import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'missions_cubit.dart';
import 'missions_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Missions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SpaceX Missions'),
        ),
        body: BlocProvider(
          create: (_) => MissionsCubit(),
          child: MissionsPage(),
        ),
      ),
    );
  }
}