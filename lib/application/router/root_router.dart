import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idg/data/model/note_model.dart';
import 'package:idg/presentation/screen/home_screen.dart';
import 'package:idg/presentation/screen/note_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class RootRouter {
  final GoRouter router;
  RootRouter()
      : router = GoRouter(
          navigatorKey: _rootNavigatorKey,
          initialLocation: '/',
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: '/note',
              builder: (context, state) {
                final extraString = (GoRouterState.of(context).extra
                    as Map<String, dynamic>?)?['noteModel'];
                final noteModel = extraString != null
                    ? NoteModel.fromJson(extraString)
                    : null;
                return NoteScreen(
                  noteModel: noteModel,
                );
              },
            ),
          ],
        );
}
