import 'dart:convert';

class ModelPaket {
  String judul;
  String deskripsi;
  String id;
  String createdAt;
  String image;
  double harga;
  ModelPaket({
    this.judul = '',
    this.deskripsi = '',
    this.id = '',
    this.createdAt = '',
    this.image = '',
    this.harga = 0,
  });

  ModelPaket copyWith({
    String? judul,
    String? deskripsi,
    String? id,
    String? createdAt,
    String? image,
    double? harga,
  }) {
    return ModelPaket(
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      image: image ?? this.image,
      harga: harga ?? this.harga,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'judul': judul});
    result.addAll({'deskripsi': deskripsi});
    result.addAll({'id': id});
    result.addAll({'created_at': createdAt});
    result.addAll({'image': image});
    result.addAll({'harga': harga});

    return result;
  }

  factory ModelPaket.fromMap(Map<String, dynamic> map) {
    return ModelPaket(
      judul: map['judul'] ?? '',
      deskripsi: map['deskripsi'] ?? '',
      id: map['id'] ?? '',
      createdAt: map['created_at'] ?? '',
      image: map['image'] ?? '',
      harga: map['harga']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelPaket.fromJson(String source) => ModelPaket.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelPaket(judul: $judul, deskripsi: $deskripsi, id: $id, createdAt: $createdAt, image: $image, harga: $harga)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelPaket &&
        other.judul == judul &&
        other.deskripsi == deskripsi &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.image == image &&
        other.harga == harga;
  }

  @override
  int get hashCode {
    return judul.hashCode ^ deskripsi.hashCode ^ id.hashCode ^ createdAt.hashCode ^ image.hashCode ^ harga.hashCode;
  }
}
