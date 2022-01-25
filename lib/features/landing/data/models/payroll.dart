import 'dart:convert';

class Payroll {

      String employee_name;
      String address;
      String reference;
      String employer_name;
      String email;
      String job_status;

      String deminimis;
      String basic_salary;
      String overtime;
      String gross_pay;
      String netpay;

      String tax;
      String sss;
      String loan;
      String philhealth_payment;
      String hdmf;
      String deductions;
      String postcode;
      String gender;
      String grade;
      String department;

      String pay_date;
      String tax_period;
      String philhealth_number;
      String philhealth_code;
      String taxable_pay;
      String pension_pay;
      String other_payment_due;

  Payroll({
    required this.employee_name,
    required this.address,
    required this.reference,
    required this.employer_name,
    required this.email,
    required this.job_status,
    required this.deminimis,
    required this.basic_salary,
    required this.overtime,
    required this.gross_pay,
    required this.netpay,
    required this.tax,
    required this.sss,
    required this.loan,
    required this.philhealth_payment,
    required this.hdmf,
    required this.deductions,
    required this.postcode,
    required this.gender,
    required this.grade,
    required this.department,
    required this.pay_date,
    required this.tax_period,
    required this.philhealth_number,
    required this.philhealth_code,
    required this.taxable_pay,
    required this.pension_pay,
    required this.other_payment_due,
  });



  Payroll copyWith({
    String? employee_name,
    String? address,
    String? reference,
    String? employer_name,
    String? email,
    String? job_status,
    String? deminimis,
    String? basic_salary,
    String? overtime,
    String? gross_pay,
    String? netpay,
    String? tax,
    String? sss,
    String? loan,
    String? philhealth_payment,
    String? hdmf,
    String? deductions,
    String? postcode,
    String? gender,
    String? grade,
    String? department,
    String? pay_date,
    String? tax_period,
    String? philhealth_number,
    String? philhealth_code,
    String? taxable_pay,
    String? pension_pay,
    String? other_payment_due,
  }) {
    return Payroll(
      employee_name: employee_name ?? this.employee_name,
      address: address ?? this.address,
      reference: reference ?? this.reference,
      employer_name: employer_name ?? this.employer_name,
      email: email ?? this.email,
      job_status: job_status ?? this.job_status,
      deminimis: deminimis ?? this.deminimis,
      basic_salary: basic_salary ?? this.basic_salary,
      overtime: overtime ?? this.overtime,
      gross_pay: gross_pay ?? this.gross_pay,
      netpay: netpay ?? this.netpay,
      tax: tax ?? this.tax,
      sss: sss ?? this.sss,
      loan: loan ?? this.loan,
      philhealth_payment: philhealth_payment ?? this.philhealth_payment,
      hdmf: hdmf ?? this.hdmf,
      deductions: deductions ?? this.deductions,
      postcode: postcode ?? this.postcode,
      gender: gender ?? this.gender,
      grade: grade ?? this.grade,
      department: department ?? this.department,
      pay_date: pay_date ?? this.pay_date,
      tax_period: tax_period ?? this.tax_period,
      philhealth_number: philhealth_number ?? this.philhealth_number,
      philhealth_code: philhealth_code ?? this.philhealth_code,
      taxable_pay: taxable_pay ?? this.taxable_pay,
      pension_pay: pension_pay ?? this.pension_pay,
      other_payment_due: other_payment_due ?? this.other_payment_due,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'employee_name': employee_name,
      'address': address,
      'reference': reference,
      'employer_name': employer_name,
      'email': email,
      'job_status': job_status,
      'deminimis': deminimis,
      'basic_salary': basic_salary,
      'overtime': overtime,
      'gross_pay': gross_pay,
      'netpay': netpay,
      'tax': tax,
      'sss': sss,
      'loan': loan,
      'philhealth_payment': philhealth_payment,
      'hdmf': hdmf,
      'deductions': deductions,
      'postcode': postcode,
      'gender': gender,
      'grade': grade,
      'department': department,
      'pay_date': pay_date,
      'tax_period': tax_period,
      'philhealth_number': philhealth_number,
      'philhealth_code': philhealth_code,
      'taxable_pay': taxable_pay,
      'pension_pay': pension_pay,
      'other_payment_due': other_payment_due,
    };
  }

  factory Payroll.fromMap(Map<String, dynamic> map) {
    return Payroll(
      employee_name: map['employee_name'] ?? '',
      address: map['address'] ?? '',
      reference: map['reference'] ?? '',
      employer_name: map['employer_name'] ?? '',
      email: map['email'] ?? '',
      job_status: map['job_status'] ?? '',
      deminimis: map['deminimis'] ?? '',
      basic_salary: map['basic_salary'] ?? '',
      overtime: map['overtime'] ?? '',
      gross_pay: map['gross_pay'] ?? '',
      netpay: map['netpay'] ?? '',
      tax: map['tax'] ?? '',
      sss: map['sss'] ?? '',
      loan: map['loan'] ?? '',
      philhealth_payment: map['philhealth_payment'] ?? '',
      hdmf: map['hdmf'] ?? '',
      deductions: map['deductions'] ?? '',
      postcode: map['postcode'] ?? '',
      gender: map['gender'] ?? '',
      grade: map['grade'] ?? '',
      department: map['department'] ?? '',
      pay_date: map['pay_date'] ?? '',
      tax_period: map['tax_period'] ?? '',
      philhealth_number: map['philhealth_number'] ?? '',
      philhealth_code: map['philhealth_code'] ?? '',
      taxable_pay: map['taxable_pay'] ?? '',
      pension_pay: map['pension_pay'] ?? '',
      other_payment_due: map['other_payment_due'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Payroll.fromJson(String source) => Payroll.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Payroll(employee_name: $employee_name, address: $address, reference: $reference, employer_name: $employer_name, email: $email, job_status: $job_status, deminimis: $deminimis, basic_salary: $basic_salary, overtime: $overtime, gross_pay: $gross_pay, netpay: $netpay, tax: $tax, sss: $sss, loan: $loan, philhealth_payment: $philhealth_payment, hdmf: $hdmf, deductions: $deductions, postcode: $postcode, gender: $gender, grade: $grade, department: $department, pay_date: $pay_date, tax_period: $tax_period, philhealth_number: $philhealth_number, philhealth_code: $philhealth_code, taxable_pay: $taxable_pay, pension_pay: $pension_pay, other_payment_due: $other_payment_due)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Payroll &&
      other.employee_name == employee_name &&
      other.address == address &&
      other.reference == reference &&
      other.employer_name == employer_name &&
      other.email == email &&
      other.job_status == job_status &&
      other.deminimis == deminimis &&
      other.basic_salary == basic_salary &&
      other.overtime == overtime &&
      other.gross_pay == gross_pay &&
      other.netpay == netpay &&
      other.tax == tax &&
      other.sss == sss &&
      other.loan == loan &&
      other.philhealth_payment == philhealth_payment &&
      other.hdmf == hdmf &&
      other.deductions == deductions &&
      other.postcode == postcode &&
      other.gender == gender &&
      other.grade == grade &&
      other.department == department &&
      other.pay_date == pay_date &&
      other.tax_period == tax_period &&
      other.philhealth_number == philhealth_number &&
      other.philhealth_code == philhealth_code &&
      other.taxable_pay == taxable_pay &&
      other.pension_pay == pension_pay &&
      other.other_payment_due == other_payment_due;
  }

  @override
  int get hashCode {
    return employee_name.hashCode ^
      address.hashCode ^
      reference.hashCode ^
      employer_name.hashCode ^
      email.hashCode ^
      job_status.hashCode ^
      deminimis.hashCode ^
      basic_salary.hashCode ^
      overtime.hashCode ^
      gross_pay.hashCode ^
      netpay.hashCode ^
      tax.hashCode ^
      sss.hashCode ^
      loan.hashCode ^
      philhealth_payment.hashCode ^
      hdmf.hashCode ^
      deductions.hashCode ^
      postcode.hashCode ^
      gender.hashCode ^
      grade.hashCode ^
      department.hashCode ^
      pay_date.hashCode ^
      tax_period.hashCode ^
      philhealth_number.hashCode ^
      philhealth_code.hashCode ^
      taxable_pay.hashCode ^
      pension_pay.hashCode ^
      other_payment_due.hashCode;
  }
}
