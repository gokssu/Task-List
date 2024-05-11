import 'package:task_list/interface/add_task/add_task_screen.dart';
import 'package:task_list/interface/edit_task/edit_task_screen.dart';
import 'package:task_list/interface/home/home_screen.dart';
import 'package:task_list/interface/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Routes {
  static const initial = '/';
  static const main = '/home';
  static const addTask = '/add-task';
  static const editTask = '/edit-task';

  static String build(String route, List<String> params) => [route, ...params].join('/');
}

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
      buildRoute(Routes.initial, const SplashScreen()),
      buildRoute(Routes.main, const HomeScreen()),
      buildRoute(Routes.addTask, const AddTaskScreen()),
      GoRoute(
        path: '${Routes.editTask}/:id',
        builder: (BuildContext context, GoRouterState state) => EditTaskScreen(id: int.parse(state.pathParameters['id']!)),
      ),
    ],
  );
});

GoRoute buildRoute(String path, Widget screen) => GoRoute(
      path: path,
      builder: (BuildContext context, GoRouterState state) => screen,
    );
