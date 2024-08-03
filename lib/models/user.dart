import 'package:hive/hive.dart';

part 'user.g.dart'; // Ensure this matches the filename

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String userName;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  User({
    required this.userName, // Ensure this matches the field name
    required this.email,
    required this.password,
  });
}
