class Friend {
  String namef;
  String phonef;
  String emailf;
  String imagef;

  Friend({this.namef, this.phonef, this.emailf, this.imagef});

  Friend.fromJson(Map<String, dynamic> json) {
    namef = json['namef'];
    phonef = json['phonef'];
    emailf = json['emailf'];
    imagef = json['imagef'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namef'] = this.namef;
    data['phonef'] = this.phonef;
    data['emailf'] = this.emailf;
    data['imagef'] = this.imagef;
    return data;
  }
}