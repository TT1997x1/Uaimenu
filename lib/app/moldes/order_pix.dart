import 'dart:convert';

class OrderPix {
  String image;
  String code;
  double totalValue;

  OrderPix({
    required this.image,
    required this.code,
    required this.totalValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'code': code,
      'totalValue': totalValue,
    };
  }

  factory OrderPix.fromMap(Map<String, dynamic> map) {
    return OrderPix(
      image: map['image'] ?? '',
      code: map['code'] ?? '',
      totalValue: map['totalValue']?.toDouble() ?? 0.0,
    );
  }
  String toJason() => json.encode(toMap());

  factory OrderPix.fromJson(String source) =>
      OrderPix.fromMap(jsonDecode(source));

  OrderPix copyWith({String? image, String? code, double? totaValue}) {
    return OrderPix(
        image: image ?? this.image,
        code: code ?? this.code,
        totalValue: totalValue);
  }
}
