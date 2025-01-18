import 'package:hive/hive.dart';
// This points to the generated file.

@HiveType(typeId: 0)
class AuthHiveModel {
  @HiveField(0)
  final String token;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  AuthHiveModel({
    required this.token,
    required this.username,
    required this.email,
  });
}

// TypeAdapter implementation for Hive
class AuthHiveModelAdapter extends TypeAdapter<AuthHiveModel> {
  @override
  final int typeId = 0;

  @override
  AuthHiveModel read(BinaryReader reader) {
    final fields = Map<int, dynamic>.from(reader.readMap());
    return AuthHiveModel(
      token: fields[0] as String? ?? '',
      username: fields[1] as String? ?? '',
      email: fields[2] as String? ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, AuthHiveModel obj) {
    writer.writeMap({
      0: obj.token,
      1: obj.username,
      2: obj.email,
    });
  }
}
