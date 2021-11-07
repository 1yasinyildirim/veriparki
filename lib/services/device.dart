class Requestdev {
  late String deviceId;
  late String systemVersion;
  late String platformName;
  late String deviceModel;
  late String manifacturer;

  Requestdev(
      {required this.deviceId,
      required this.systemVersion,
      required this.platformName,
      required this.deviceModel,
      required this.manifacturer});

  Requestdev.fromJson(Map<String, dynamic> json) {
    deviceId = json['deviceId'];
    systemVersion = json['systemVersion'];
    platformName = json['platformName'];
    deviceModel = json['deviceModel'];
    manifacturer = json['manifacturer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceId'] = this.deviceId;
    data['systemVersion'] = this.systemVersion;
    data['platformName'] = this.platformName;
    data['deviceModel'] = this.deviceModel;
    data['manifacturer'] = this.manifacturer;
    return data;
  }
}

class Responsedev {
  late String aesKey;
  late String aesIV;
  late String authorization;
  late String lifeTime;
  late Status status;

  Responsedev(
      {required this.aesKey,
      required this.aesIV,
      required this.authorization,
      required this.lifeTime,
      required this.status});

  Responsedev.fromJson(Map<String, dynamic> json) {
    aesKey = json['aesKey'];
    aesIV = json['aesIV'];
    authorization = json['authorization'];
    lifeTime = json['lifeTime'];
    status =
        (json['status'] != null ? new Status.fromJson(json['status']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aesKey'] = this.aesKey;
    data['aesIV'] = this.aesIV;
    data['authorization'] = this.authorization;
    data['lifeTime'] = this.lifeTime;
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}

class Status {
  late bool isSuccess;
  late Error error;

  Status({required this.isSuccess,required this.error});

  Status.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    error = (json['error'] != null ? new Error.fromJson(json['error']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    return data;
  }
}

class Error {
  late int code;
  late String message;

  Error({required this.code,required this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}