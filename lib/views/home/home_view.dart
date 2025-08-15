import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/car_controller.dart';
import '../../core/widgets/search_field.dart';
import '../../core/widgets/car_card.dart';
import '../../core/router/app_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CarController>();
    final cars = controller.cars;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Browse', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 10),
            SearchField(
              hint: 'Search brand or model…',
              onChanged: controller.setSearch,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: cars.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  final car = cars[i];
                  return CarCard(
                    car: car,
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.carDetail,
                      arguments: car.id,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
