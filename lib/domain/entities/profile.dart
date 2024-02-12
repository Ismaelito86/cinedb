import 'package:isar/isar.dart';

part 'profile.g.dart';

@collection
class Profile {
  Id? isarId;
  String name;
  String email;
  String avatar;

  Profile({
    required this.name,
    required this.email,
    required this.avatar,
  });
}
