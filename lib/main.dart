import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RateCarsApp());
}

class RateCarsApp extends StatelessWidget {
  const RateCarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RateCars',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
