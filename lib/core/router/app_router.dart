import 'package:flutter/material.dart';
import '../../views/splash/splash_view.dart';
import '../../views/auth/login_view.dart';
import '../../views/shell/app_shell.dart';
import '../../views/car/car_detail_view.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const shell = '/shell';
  static const carDetail = '/car';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _page(const SplashView());
      case AppRoutes.login:
        return _page(const LoginView());
      case AppRoutes.shell:
        return _page(const AppShell());
      case AppRoutes.carDetail:
        final id = settings.arguments as String?;
        if (id == null) {
          return _page(const _ErrorPage(message: 'Car id required'));
        }
        return _page(CarDetailView(carId: id));
      default:
        return _page(_ErrorPage(message: 'Unknown route: ${settings.name}'));
    }
  }

  static MaterialPageRoute _page(Widget child) =>
      MaterialPageRoute(builder: (_) => child);
}

class _ErrorPage extends StatelessWidget {
  final String message;
  const _ErrorPage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route error')),
      body: Center(child: Text(message)),
    );
  }
}
