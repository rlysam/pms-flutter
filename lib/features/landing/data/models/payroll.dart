import 'dart:convert';

class Payroll {

      String employeeName;
      String address;
      String ref;
      String employerName;
      String email;
      String jobstatus;

      String deminimis;
      String basicSalary;
      String overtime;
      String grossPay;
      String netPAy;

      String tax;
      String sSS;
      String loan;
      String philHealthPayment;
      String hDmf;
      String deductions;
      String postCode;
      String gender;
      String grade;
      String dEpartmanet;

      String paydate;
      String taxperdio;
      String philhealthnumber;
      String pihileahlcode;
      String taxablepay;
      String pensionpay;
      String otherpaymentdue;

  Payroll({
    required this.employeeName,
    required this.address,
    required this.ref,
    required this.employerName,
    required this.email,
    required this.jobstatus,
    required this.deminimis,
    required this.basicSalary,
    required this.overtime,
    required this.grossPay,
    required this.netPAy,
    required this.tax,
    required this.sSS,
    required this.loan,
    required this.philHealthPayment,
    required this.hDmf,
    required this.deductions,
    required this.postCode,
    required this.gender,
    required this.grade,
    required this.dEpartmanet,
    required this.paydate,
    required this.taxperdio,
    required this.philhealthnumber,
    required this.pihileahlcode,
    required this.taxablepay,
    required this.pensionpay,
    required this.otherpaymentdue,
  });



  Payroll copyWith({
    String? employeeName,
    String? address,
    String? ref,
    String? employerName,
    String? email,
    String? Jobstatus,
    String? deminimis,
    String? basicSalary,
    String? overtime,
    String? grossPay,
    String? netPAy,
    String? tax,
    String? sSS,
    String? loan,
    String? philHealthPayment,
    String? hDmf,
    String? deductions,
    String? postCode,
    String? gender,
    String? grade,
    String? dEpartmanet,
    String? paydate,
    String? taxperdio,
    String? philhealthnumber,
    String? pihileahlcode,
    String? taxablepay,
    String? pensionpay,
    String? otherpaymentdue,
  }) {
    return Payroll(
      employeeName: employeeName ?? this.employeeName,
      address: address ?? this.address,
      ref: ref ?? this.ref,
      employerName: employerName ?? this.employerName,
      email: email ?? this.email,
      jobstatus: Jobstatus ?? this.jobstatus,
      deminimis: deminimis ?? this.deminimis,
      basicSalary: basicSalary ?? this.basicSalary,
      overtime: overtime ?? this.overtime,
      grossPay: grossPay ?? this.grossPay,
      netPAy: netPAy ?? this.netPAy,
      tax: tax ?? this.tax,
      sSS: sSS ?? this.sSS,
      loan: loan ?? this.loan,
      philHealthPayment: philHealthPayment ?? this.philHealthPayment,
      hDmf: hDmf ?? this.hDmf,
      deductions: deductions ?? this.deductions,
      postCode: postCode ?? this.postCode,
      gender: gender ?? this.gender,
      grade: grade ?? this.grade,
      dEpartmanet: dEpartmanet ?? this.dEpartmanet,
      paydate: paydate ?? this.paydate,
      taxperdio: taxperdio ?? this.taxperdio,
      philhealthnumber: philhealthnumber ?? this.philhealthnumber,
      pihileahlcode: pihileahlcode ?? this.pihileahlcode,
      taxablepay: taxablepay ?? this.taxablepay,
      pensionpay: pensionpay ?? this.pensionpay,
      otherpaymentdue: otherpaymentdue ?? this.otherpaymentdue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'employeeName': employeeName,
      'address': address,
      'ref': ref,
      'employerName': employerName,
      'email': email,
      'Jobstatus': jobstatus,
      'deminimis': deminimis,
      'basicSalary': basicSalary,
      'overtime': overtime,
      'grossPay': grossPay,
      'netPAy': netPAy,
      'tax': tax,
      'sSS': sSS,
      'loan': loan,
      'philHealthPayment': philHealthPayment,
      'hDmf': hDmf,
      'deductions': deductions,
      'postCode': postCode,
      'gender': gender,
      'grade': grade,
      'dEpartmanet': dEpartmanet,
      'paydate': paydate,
      'taxperdio': taxperdio,
      'philhealthnumber': philhealthnumber,
      'pihileahlcode': pihileahlcode,
      'taxablepay': taxablepay,
      'pensionpay': pensionpay,
      'otherpaymentdue': otherpaymentdue,
    };
  }

  factory Payroll.fromMap(Map<String, dynamic> map) {
    return Payroll(
      employeeName: map['employeeName'] ?? '',
      address: map['address'] ?? '',
      ref: map['ref'] ?? '',
      employerName: map['employerName'] ?? '',
      email: map['email'] ?? '',
      jobstatus: map['Jobstatus'] ?? '',
      deminimis: map['deminimis'] ?? '',
      basicSalary: map['basicSalary'] ?? '',
      overtime: map['overtime'] ?? '',
      grossPay: map['grossPay'] ?? '',
      netPAy: map['netPAy'] ?? '',
      tax: map['tax'] ?? '',
      sSS: map['sSS'] ?? '',
      loan: map['loan'] ?? '',
      philHealthPayment: map['philHealthPayment'] ?? '',
      hDmf: map['hDmf'] ?? '',
      deductions: map['deductions'] ?? '',
      postCode: map['postCode'] ?? '',
      gender: map['gender'] ?? '',
      grade: map['grade'] ?? '',
      dEpartmanet: map['dEpartmanet'] ?? '',
      paydate: map['paydate'] ?? '',
      taxperdio: map['taxperdio'] ?? '',
      philhealthnumber: map['philhealthnumber'] ?? '',
      pihileahlcode: map['pihileahlcode'] ?? '',
      taxablepay: map['taxablepay'] ?? '',
      pensionpay: map['pensionpay'] ?? '',
      otherpaymentdue: map['otherpaymentdue'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Payroll.fromJson(String source) => Payroll.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Payroll(employeeName: $employeeName, address: $address, ref: $ref, employerName: $employerName, email: $email, Jobstatus: $jobstatus, deminimis: $deminimis, basicSalary: $basicSalary, overtime: $overtime, grossPay: $grossPay, netPAy: $netPAy, tax: $tax, sSS: $sSS, loan: $loan, philHealthPayment: $philHealthPayment, hDmf: $hDmf, deductions: $deductions, postCode: $postCode, gender: $gender, grade: $grade, dEpartmanet: $dEpartmanet, paydate: $paydate, taxperdio: $taxperdio, philhealthnumber: $philhealthnumber, pihileahlcode: $pihileahlcode, taxablepay: $taxablepay, pensionpay: $pensionpay, otherpaymentdue: $otherpaymentdue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Payroll &&
      other.employeeName == employeeName &&
      other.address == address &&
      other.ref == ref &&
      other.employerName == employerName &&
      other.email == email &&
      other.jobstatus == jobstatus &&
      other.deminimis == deminimis &&
      other.basicSalary == basicSalary &&
      other.overtime == overtime &&
      other.grossPay == grossPay &&
      other.netPAy == netPAy &&
      other.tax == tax &&
      other.sSS == sSS &&
      other.loan == loan &&
      other.philHealthPayment == philHealthPayment &&
      other.hDmf == hDmf &&
      other.deductions == deductions &&
      other.postCode == postCode &&
      other.gender == gender &&
      other.grade == grade &&
      other.dEpartmanet == dEpartmanet &&
      other.paydate == paydate &&
      other.taxperdio == taxperdio &&
      other.philhealthnumber == philhealthnumber &&
      other.pihileahlcode == pihileahlcode &&
      other.taxablepay == taxablepay &&
      other.pensionpay == pensionpay &&
      other.otherpaymentdue == otherpaymentdue;
  }

  @override
  int get hashCode {
    return employeeName.hashCode ^
      address.hashCode ^
      ref.hashCode ^
      employerName.hashCode ^
      email.hashCode ^
      jobstatus.hashCode ^
      deminimis.hashCode ^
      basicSalary.hashCode ^
      overtime.hashCode ^
      grossPay.hashCode ^
      netPAy.hashCode ^
      tax.hashCode ^
      sSS.hashCode ^
      loan.hashCode ^
      philHealthPayment.hashCode ^
      hDmf.hashCode ^
      deductions.hashCode ^
      postCode.hashCode ^
      gender.hashCode ^
      grade.hashCode ^
      dEpartmanet.hashCode ^
      paydate.hashCode ^
      taxperdio.hashCode ^
      philhealthnumber.hashCode ^
      pihileahlcode.hashCode ^
      taxablepay.hashCode ^
      pensionpay.hashCode ^
      otherpaymentdue.hashCode;
  }
}
