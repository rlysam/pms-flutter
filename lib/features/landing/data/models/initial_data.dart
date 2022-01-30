import 'dart:convert';

class InitialData {

   String deductions; 
  String gross_pay; 
  String hdmf; 
  String net_pay; 
  String other_payment_due; 
  String pension_pay; 
  String philhealth_payment; 
  String sss; 
  String tax; 
  String taxable_pay; 

  InitialData({
    required this.deductions,
    required this.gross_pay,
    required this.hdmf,
    required this.net_pay,
    required this.other_payment_due,
    required this.pension_pay,
    required this.philhealth_payment,
    required this.sss,
    required this.tax,
    required this.taxable_pay,
  });
  

  InitialData copyWith({
    String? deductions,
    String? gross_pay,
    String? hdmf,
    String? net_pay,
    String? other_payment_due,
    String? pension_pay,
    String? philhealth_payment,
    String? sss,
    String? tax,
    String? taxable_pay,
  }) {
    return InitialData(
      deductions: deductions ?? this.deductions,
      gross_pay: gross_pay ?? this.gross_pay,
      hdmf: hdmf ?? this.hdmf,
      net_pay: net_pay ?? this.net_pay,
      other_payment_due: other_payment_due ?? this.other_payment_due,
      pension_pay: pension_pay ?? this.pension_pay,
      philhealth_payment: philhealth_payment ?? this.philhealth_payment,
      sss: sss ?? this.sss,
      tax: tax ?? this.tax,
      taxable_pay: taxable_pay ?? this.taxable_pay,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deductions': deductions,
      'gross_pay': gross_pay,
      'hdmf': hdmf,
      'net_pay': net_pay,
      'other_payment_due': other_payment_due,
      'pension_pay': pension_pay,
      'philhealth_payment': philhealth_payment,
      'sss': sss,
      'tax': tax,
      'taxable_pay': taxable_pay,
    };
  }

  factory InitialData.fromMap(Map<String, dynamic> map) {
    return InitialData(
      deductions: map['deductions'] ?? '',
      gross_pay: map['gross_pay'] ?? '',
      hdmf: map['hdmf'] ?? '',
      net_pay: map['net_pay'] ?? '',
      other_payment_due: map['other_payment_due'] ?? '',
      pension_pay: map['pension_pay'] ?? '',
      philhealth_payment: map['philhealth_payment'] ?? '',
      sss: map['sss'] ?? '',
      tax: map['tax'] ?? '',
      taxable_pay: map['taxable_pay'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InitialData.fromJson(String source) => InitialData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InitialData(deductions: $deductions, gross_pay: $gross_pay, hdmf: $hdmf, net_pay: $net_pay, other_payment_due: $other_payment_due, pension_pay: $pension_pay, philhealth_payment: $philhealth_payment, sss: $sss, tax: $tax, taxable_pay: $taxable_pay)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is InitialData &&
      other.deductions == deductions &&
      other.gross_pay == gross_pay &&
      other.hdmf == hdmf &&
      other.net_pay == net_pay &&
      other.other_payment_due == other_payment_due &&
      other.pension_pay == pension_pay &&
      other.philhealth_payment == philhealth_payment &&
      other.sss == sss &&
      other.tax == tax &&
      other.taxable_pay == taxable_pay;
  }

  @override
  int get hashCode {
    return deductions.hashCode ^
      gross_pay.hashCode ^
      hdmf.hashCode ^
      net_pay.hashCode ^
      other_payment_due.hashCode ^
      pension_pay.hashCode ^
      philhealth_payment.hashCode ^
      sss.hashCode ^
      tax.hashCode ^
      taxable_pay.hashCode;
  }
}
