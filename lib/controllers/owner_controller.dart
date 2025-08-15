import 'package:flutter/foundation.dart';

class OwnerInfo {
  final String name;
  final String handle;
  final String avatarUrl;
  final String email;
  final String website;
  final String locationHint;

  const OwnerInfo({
    required this.name,
    required this.handle,
    required this.avatarUrl,
    required this.email,
    required this.website,
    required this.locationHint,
  });
}

class OwnerController extends ChangeNotifier {
  final OwnerInfo _owner = const OwnerInfo(
    name: 'TechHive Owner',
    handle: '@ratecars',
    avatarUrl: 'https://i.pravatar.cc/200?img=12',
    email: 'owner@example.com',
    website: 'https://example.com',
    locationHint: 'Common meetup spots: Downtown Auto Plaza, Wed 6–8 PM.',
  );

  OwnerInfo get owner => _owner;
}
