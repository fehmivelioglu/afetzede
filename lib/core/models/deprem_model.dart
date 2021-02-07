class DepremModel {
  String tarih;
  String saat;
  String enlem;
  String boylam;
  String derinlik;
  String buyukluk;
  String yer;
  String sehir;

  DepremModel(
      {this.tarih,
      this.saat,
      this.enlem,
      this.boylam,
      this.derinlik,
      this.buyukluk,
      this.yer,
      this.sehir});

  DepremModel.fromJson(Map<String, dynamic> json) {
    tarih = json['tarih'];
    saat = json['saat'];
    enlem = json['enlem'];
    boylam = json['boylam'];
    derinlik = json['derinlik'];
    buyukluk = json['buyukluk'];
    yer = json['yer'];
    sehir = json['sehir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tarih'] = tarih;
    data['saat'] = saat;
    data['enlem'] = enlem;
    data['boylam'] = boylam;
    data['derinlik'] = derinlik;
    data['buyukluk'] = buyukluk;
    data['yer'] = yer;
    data['sehir'] = sehir;
    return data;
  }
}
