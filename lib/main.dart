// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'controllers/auth_controller.dart';
import 'controllers/car_controller.dart';
import 'controllers/owner_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RateCarsApp());
}

class RateCarsApp extends StatelessWidget {
  const RateCarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => CarController()),
        ChangeNotifierProvider(create: (_) => OwnerController()),
      ],
      child: MaterialApp(
        title: 'RateCars',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
