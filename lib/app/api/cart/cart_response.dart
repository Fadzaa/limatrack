class CartResponse {
  Data? data;

  CartResponse({this.data});

  CartResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? pedagangId;
  String? jajananId;
  String? namaWarung;
  int? jumlah;
  int? totalHarga;
  String? updatedAt;
  String? createdAt;

  Data(
      {this.id,
        this.userId,
        this.pedagangId,
        this.jajananId,
        this.namaWarung,
        this.jumlah,
        this.totalHarga,
        this.updatedAt,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pedagangId = json['pedagang_id'];
    jajananId = json['jajanan_id'];
    namaWarung = json['nama_warung'];
    jumlah = json['jumlah'];
    totalHarga = json['total_harga'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['pedagang_id'] = this.pedagangId;
    data['jajanan_id'] = this.jajananId;
    data['nama_warung'] = this.namaWarung;
    data['jumlah'] = this.jumlah;
    data['total_harga'] = this.totalHarga;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
