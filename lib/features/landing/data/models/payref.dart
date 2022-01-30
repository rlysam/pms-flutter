// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class PayRefData {
  String pay_date;
  String reference;
  String philhealth_number;

  PayRefData({
    required this.pay_date,
    required this.reference,
    required this.philhealth_number,
  });

  PayRefData copyWith({
    String? pay_date,
    String? reference,
    String? philhealth_number,
  }) {
    return PayRefData(
      pay_date: pay_date ?? this.pay_date,
      reference: reference ?? this.reference,
      philhealth_number: philhealth_number ?? this.philhealth_number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pay_date': pay_date,
      'reference': reference,
      'philhealth_number': philhealth_number,
    };
  }

  factory PayRefData.fromMap(Map<String, dynamic> map) {
    return PayRefData(
      pay_date: map['pay_date'] ?? '',
      reference: map['reference'] ?? '',
      philhealth_number: map['philhealth_number'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PayRefData.fromJson(String source) =>
      PayRefData.fromMap(json.decode(source));

  @override
  String toString() =>
      'PayRefData(pay_date: $pay_date, reference: $reference, philhealth_number: $philhealth_number)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PayRefData &&
        other.pay_date == pay_date &&
        other.reference == reference &&
        other.philhealth_number == philhealth_number;
  }

  @override
  int get hashCode =>
      pay_date.hashCode ^ reference.hashCode ^ philhealth_number.hashCode;
}
