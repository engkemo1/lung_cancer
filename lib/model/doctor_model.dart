class DoctorModel {
  List<DoctorData>? data;
  bool? success;

  DoctorModel({this.data, this.success});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DoctorData>[];
      json['data'].forEach((v) {
        data!.add(new DoctorData.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class DoctorData {
  String? userName;
  String? img;
  int? distance;

  DoctorData({this.userName, this.img, this.distance});

  DoctorData.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    img = json['img'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['img'] = this.img;
    data['distance'] = this.distance;
    return data;
  }
}
