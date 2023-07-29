import 'package:go_router/go_router.dart';
import 'package:master_source_flutter/src/routing/common_route.dart';

final routerController = GoRouter(
  initialLocation: '/splash-screen',
  routes: [...commonRoute],
);
