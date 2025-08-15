import 'package:flutter/material.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const shell = '/shell';
  static const carDetail = '/car/:id';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _page(const _Placeholder(title: 'Splash / Onboarding'));
      case AppRoutes.login:
        return _page(const _Placeholder(title: 'Login (UI only)'));
      case AppRoutes.shell:
        return _page(
            const _Placeholder(title: 'App Shell (Home/Owner/Settings)'));
      default:
        return _page(
          _Placeholder(title: 'Unknown: ${settings.name}'),
        );
    }
  }

  static MaterialPageRoute _page(Widget child) =>
      MaterialPageRoute(builder: (_) => child);
}

class _Placeholder extends StatelessWidget {
  final String title;
  const _Placeholder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
