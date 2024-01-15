import 'dart:convert';

class UserX {
  String nama;
  String password;
  String email;
  String id;
  String createdAt;

  UserX({
    this.nama = '',
    this.password = '',
    this.email = '',
    this.id = '',
    this.createdAt = '',
  });

  UserX copyWith({
    String? nama,
    String? password,
    String? email,
    String? id,
    String? createdAt,
  }) {
    return UserX(
      nama: nama ?? this.nama,
      password: password ?? this.password,
      email: email ?? this.email,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nama': nama});
    result.addAll({'password': password});
    result.addAll({'email': email});
    result.addAll({'id': id});
    result.addAll({'created_at': createdAt});

    return result;
  }

  factory UserX.fromMap(Map<String, dynamic> map) {
    return UserX(
      nama: map['nama'] ?? '',
      password: map['password'] ?? '',
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      createdAt: map['created_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserX.fromJson(String source) => UserX.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserX(nama: $nama, password: $password, email: $email, id: $id, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserX &&
        other.nama == nama &&
        other.password == password &&
        other.email == email &&
        other.id == id &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return nama.hashCode ^ password.hashCode ^ email.hashCode ^ id.hashCode ^ createdAt.hashCode;
  }
}
