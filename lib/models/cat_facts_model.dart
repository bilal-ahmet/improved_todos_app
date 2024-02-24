import 'dart:convert';

class CatFactsModel {
  final String fact;
  final int lenght;
  CatFactsModel({
    required this.fact,
    required this.lenght,
  });

  CatFactsModel copyWith({
    String? fact,
    int? lenght,
  }) {
    return CatFactsModel(
      fact: fact ?? this.fact,
      lenght: lenght ?? this.lenght,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fact': fact,
      'lenght': lenght,
    };
  }

  factory CatFactsModel.fromMap(Map<String, dynamic> map) {
    return CatFactsModel(
      fact: map['fact'] ?? '',
      lenght: map['lenght']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatFactsModel.fromJson(String source) => CatFactsModel.fromMap(json.decode(source));

  @override
  String toString() => 'CatFactsModel(fact: $fact, lenght: $lenght)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CatFactsModel &&
      other.fact == fact &&
      other.lenght == lenght;
  }

  @override
  int get hashCode => fact.hashCode ^ lenght.hashCode;
}
