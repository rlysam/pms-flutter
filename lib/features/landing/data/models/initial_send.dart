import 'dart:convert';

class InitialSend {
    String basic_salary; 
	String deminimis; 
	String overtime; 
	String loan; 

  InitialSend({
    required this.basic_salary,
    required this.deminimis,
    required this.overtime,
    required this.loan,
  });
  

  InitialSend copyWith({
    String? basic_salary,
    String? deminimis,
    String? overtime,
    String? loan,
  }) {
    return InitialSend(
      basic_salary: basic_salary ?? this.basic_salary,
      deminimis: deminimis ?? this.deminimis,
      overtime: overtime ?? this.overtime,
      loan: loan ?? this.loan,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'basic_salary': basic_salary,
      'deminimis': deminimis,
      'overtime': overtime,
      'loan': loan,
    };
  }

  factory InitialSend.fromMap(Map<String, dynamic> map) {
    return InitialSend(
      basic_salary: map['basic_salary'] ?? '',
      deminimis: map['deminimis'] ?? '',
      overtime: map['overtime'] ?? '',
      loan: map['loan'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InitialSend.fromJson(String source) => InitialSend.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InitialSend(basic_salary: $basic_salary, deminimis: $deminimis, overtime: $overtime, loan: $loan)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is InitialSend &&
      other.basic_salary == basic_salary &&
      other.deminimis == deminimis &&
      other.overtime == overtime &&
      other.loan == loan;
  }

  @override
  int get hashCode {
    return basic_salary.hashCode ^
      deminimis.hashCode ^
      overtime.hashCode ^
      loan.hashCode;
  }
}
