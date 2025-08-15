import '../../models/car.dart';

final seededCars = <Car>[
  const Car(
    id: 'audi-r8',
    name: 'R8',
    brand: 'Audi',
    heroImage:
        'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?q=80&w=1200&auto=format&fit=crop',
    specs: {
      'Year': '2023',
      'HP': '602',
      '0–100': '3.2s',
      'Drivetrain': 'AWD',
      'Class': 'Supercar',
    },
  ),
  const Car(
    id: 'bmw-m4',
    name: 'M4 Competition',
    brand: 'BMW',
    heroImage:
        'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?q=80&w=1200&auto=format&fit=crop',
    specs: {
      'Year': '2022',
      'HP': '503',
      '0–100': '3.9s',
      'Drivetrain': 'RWD',
      'Class': 'Coupe',
    },
  ),
  const Car(
    id: 'porsche-911',
    name: '911 Carrera S',
    brand: 'Porsche',
    heroImage:
        'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=1200&auto=format&fit=crop',
    specs: {
      'Year': '2021',
      'HP': '443',
      '0–100': '3.5s',
      'Drivetrain': 'RWD',
      'Class': 'Sports',
    },
  ),
  const Car(
    id: 'mercedes-amg-gt',
    name: 'AMG GT',
    brand: 'Mercedes',
    heroImage:
        'https://images.unsplash.com/photo-1511910849309-0dffb31f8448?q=80&w=1200&auto=format&fit=crop',
    specs: {
      'Year': '2020',
      'HP': '523',
      '0–100': '3.7s',
      'Drivetrain': 'RWD',
      'Class': 'Grand Tourer',
    },
  ),
  const Car(
    id: 'nissan-gtr',
    name: 'GT-R',
    brand: 'Nissan',
    heroImage:
        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=1200&auto=format&fit=crop',
    specs: {
      'Year': '2019',
      'HP': '565',
      '0–100': '2.9s',
      'Drivetrain': 'AWD',
      'Class': 'Supercar',
    },
  ),
  const Car(
    id: 'tesla-model-s',
    name: 'Model S Plaid',
    brand: 'Tesla',
    heroImage:
        'https://images.unsplash.com/photo-1619767886558-8cc265d6a726?q=80&w=1200&auto=format&fit=crop',
    specs: {
      'Year': '2022',
      'HP': '1,020',
      '0–100': '2.1s',
      'Drivetrain': 'AWD',
      'Class': 'EV',
    },
  ),
];
