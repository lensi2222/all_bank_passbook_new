class BankInformationBalanceCheck {
  String? bankName;
  List<BankNumberDetail>? bankNumberDetail;

  BankInformationBalanceCheck({this.bankName, this.bankNumberDetail});

  BankInformationBalanceCheck.fromJson(Map<String, dynamic> json) {
    bankName = json['BankName'];
    if (json['bank_number_detail'] != null) {
      bankNumberDetail = <BankNumberDetail>[];
      json['bank_number_detail'].forEach((v) {
        bankNumberDetail!.add(new BankNumberDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BankName'] = this.bankName;
    if (this.bankNumberDetail != null) {
      data['bank_number_detail'] =
          this.bankNumberDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankNumberDetail {
  String? bankBalance;
  String? miniStatement;
  String? customerCare;

  BankNumberDetail({this.bankBalance, this.miniStatement, this.customerCare});

  BankNumberDetail.fromJson(Map<String, dynamic> json) {
    bankBalance = json['bank_balance'];
    miniStatement = json['mini_statement'];
    customerCare = json['customer_care'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_balance'] = this.bankBalance;
    data['mini_statement'] = this.miniStatement;
    data['customer_care'] = this.customerCare;
    return data;
  }
}
