class BinCheckerModel {
  String? scheme;
  String? type;
  String? brand;
  Country? country;
  Bank? bank;

  BinCheckerModel(
      {this.scheme, this.type, this.brand, this.country, this.bank});

  BinCheckerModel.fromJson(Map<String, dynamic> json) {
    scheme = json['scheme'];
    type = json['type'];
    brand = json['brand'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    bank = json['bank'] != null ? new Bank.fromJson(json['bank']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['scheme'] = this.scheme;
    data['type'] = this.type;
    data['brand'] = this.brand;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    return data;
  }
}

class Country {
  String? numeric;
  String? alpha2;
  String? name;
  String? emoji;
  String? currency;
  int? latitude;
  int? longitude;

  Country(
      {this.numeric,
      this.alpha2,
      this.name,
      this.emoji,
      this.currency,
      this.latitude,
      this.longitude});

  Country.fromJson(Map<String, dynamic> json) {
    numeric = json['numeric'];
    alpha2 = json['alpha2'];
    name = json['name'];
    emoji = json['emoji'];
    currency = json['currency'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numeric'] = this.numeric;
    data['alpha2'] = this.alpha2;
    data['name'] = this.name;
    data['emoji'] = this.emoji;
    data['currency'] = this.currency;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Bank {
  String? name;
  String? url;
  String? city;
  String? phone;

  Bank({this.name, this.url, this.phone, this.city});

  Bank.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    city = json['city'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['city'] = this.city;

    data['phone'] = this.phone;
    return data;
  }
}
