class IfscCodeModel {
  String? bankName;
  List<String>? stateList;
  List<City>? city;
  List<Branch>? branch;
  List<IFSCCode>? iFSCCode;

  IfscCodeModel(
      {this.bankName, this.stateList, this.city, this.branch, this.iFSCCode});

  IfscCodeModel.fromJson(Map<String, dynamic> json) {
    bankName = json['BankName'];
    stateList = json['StateList'].cast<String>();
    if (json['City'] != null) {
      city = <City>[];
      json['City'].forEach((v) {
        city!.add(new City.fromJson(v));
      });
    }
    if (json['Branch'] != null) {
      branch = <Branch>[];
      json['Branch'].forEach((v) {
        branch!.add(new Branch.fromJson(v));
      });
    }
    if (json['IFSCCode'] != null) {
      iFSCCode = <IFSCCode>[];
      json['IFSCCode'].forEach((v) {
        iFSCCode!.add(new IFSCCode.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BankName'] = this.bankName;
    data['StateList'] = this.stateList;
    if (this.city != null) {
      data['City'] = this.city!.map((v) => v.toJson()).toList();
    }
    if (this.branch != null) {
      data['Branch'] = this.branch!.map((v) => v.toJson()).toList();
    }
    if (this.iFSCCode != null) {
      data['IFSCCode'] = this.iFSCCode!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  String? state;
  List<String>? cityList;

  City({this.state, this.cityList});

  City.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    cityList = json['cityList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['cityList'] = this.cityList;
    return data;
  }
}

class Branch {
  String? city;
  List<String>? branchList;

  Branch({this.city, this.branchList});

  Branch.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    branchList = json['branchList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['branchList'] = this.branchList;
    return data;
  }
}

class IFSCCode {
  String? branch;
  List<IFSCCodeList>? iFSCCodeList;

  IFSCCode({this.branch, this.iFSCCodeList});

  IFSCCode.fromJson(Map<String, dynamic> json) {
    branch = json['branch'];
    if (json['IFSCCodeList'] != null) {
      iFSCCodeList = <IFSCCodeList>[];
      json['IFSCCodeList'].forEach((v) {
        iFSCCodeList!.add(new IFSCCodeList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch'] = this.branch;
    if (this.iFSCCodeList != null) {
      data['IFSCCodeList'] = this.iFSCCodeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IFSCCodeList {
  String? iFSCCodeText;
  String? mICRCode;
  String? phoneNo;
  String? address;

  IFSCCodeList({this.iFSCCodeText, this.mICRCode, this.phoneNo, this.address});

  IFSCCodeList.fromJson(Map<String, dynamic> json) {
    iFSCCodeText = json['IFSCCodeText'];
    mICRCode = json['MICRCode'];
    phoneNo = json['PhoneNo'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IFSCCodeText'] = this.iFSCCodeText;
    data['MICRCode'] = this.mICRCode;
    data['PhoneNo'] = this.phoneNo;
    data['Address'] = this.address;
    return data;
  }
}