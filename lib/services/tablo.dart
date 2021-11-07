class RequestTablo {
  late String _id;

  RequestTablo({required String id}) {
    _id = id;
  }

  String get id => _id;
  set id(String id) => _id = id;

  RequestTablo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    return data;
  }
}

class ResponseTablo {
  late bool _isDown;
  late bool _isUp;
  late double _bid;
  late double _channge;
  late int _count;
  late double _difference;
  late double _offer;
  late double _highest;
  late double _lowest;
  late double _maximum;
  late double _minimum;
  late double _price;
  late double _volume;
  late String _symbol;
  late List<GraphicData> _graphicData;
  late Status _status;

  ResponseTablo(
      {required bool isDown,
      required bool isUp,
      required double bid,
      required double channge,
      required int count,
      required double difference,
      required double offer,
      required double highest,
      required double lowest,
      required double maximum,
      required double minimum,
      required double price,
      required double volume,
      required String symbol,
      required List<GraphicData> graphicData,
      required Status status}) {
    _isDown = isDown;
    _isUp = isUp;
    _bid = bid;
    _channge = channge;
    _count = count;
    _difference = difference;
    _offer = offer;
    _highest = highest;
    _lowest = lowest;
    _maximum = maximum;
    _minimum = minimum;
    _price = price;
    _volume = volume;
    _symbol = symbol;
    _graphicData = graphicData;
    _status = status;
  }

  bool get isDown => _isDown;
  set isDown(bool isDown) => _isDown = isDown;
  bool get isUp => _isUp;
  set isUp(bool isUp) => _isUp = isUp;
  double get bid => _bid;
  set bid(double bid) => _bid = bid;
  double get channge => _channge;
  set channge(double channge) => _channge = channge;
  int get count => _count;
  set count(int count) => _count = count;
  double get difference => _difference;
  set difference(double difference) => _difference = difference;
  double get offer => _offer;
  set offer(double offer) => _offer = offer;
  double get highest => _highest;
  set highest(double highest) => _highest = highest;
  double get lowest => _lowest;
  set lowest(double lowest) => _lowest = lowest;
  double get maximum => _maximum;
  set maximum(double maximum) => _maximum = maximum;
  double get minimum => _minimum;
  set minimum(double minimum) => _minimum = minimum;
  double get price => _price;
  set price(double price) => _price = price;
  double get volume => _volume;
  set volume(double volume) => _volume = volume;
  String get symbol => _symbol;
  set symbol(String symbol) => _symbol = symbol;
  List<GraphicData> get graphicData => _graphicData;
  set graphicData(List<GraphicData> graphicData) => _graphicData = graphicData;
  Status get status => _status;
  set status(Status status) => _status = status;

  ResponseTablo.fromJson(Map<String, dynamic> json) {
    _isDown = json['isDown'];
    _isUp = json['isUp'];
    _bid = json['bid'];
    _channge = json['channge'];
    _count = json['count'];
    _difference = json['difference'];
    _offer = json['offer'];
    _highest = json['highest'];
    _lowest = json['lowest'];
    _maximum = json['maximum'];
    _minimum = json['minimum'];
    _price = json['price'];
    _volume = json['volume'];
    _symbol = json['symbol'];
    if (json['graphicData'] != null) {
      _graphicData = <GraphicData>[];
      json['graphicData'].forEach((v) {
        _graphicData.add(new GraphicData.fromJson(v));
      });
    }
    _status =
        (json['status'] != null ? new Status.fromJson(json['status']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDown'] = _isDown;
    data['isUp'] = _isUp;
    data['bid'] = _bid;
    data['channge'] = _channge;
    data['count'] = _count;
    data['difference'] = _difference;
    data['offer'] = _offer;
    data['highest'] = _highest;
    data['lowest'] = _lowest;
    data['maximum'] = _maximum;
    data['minimum'] = _minimum;
    data['price'] = _price;
    data['volume'] = _volume;
    data['symbol'] = _symbol;
    if (_graphicData != null) {
      data['graphicData'] = _graphicData.map((v) => v.toJson()).toList();
    }
    if (_status != null) {
      data['status'] = _status.toJson();
    }
    return data;
  }
}

class GraphicData {
  late int _day;
  late double _value;

  GraphicData({required int day,required double value}) {
    _day = day;
    _value = value;
  }

  int get day => _day;
  set day(int day) => _day = day;
  double get value => _value;
  set value(double value) => _value = value;

  GraphicData.fromJson(Map<String, dynamic> json) {
    _day = json['day'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = _day;
    data['value'] = _value;
    return data;
  }
}

class Status {
  late bool _isSuccess;
  late Error _error;

  Status({required bool isSuccess,required Error error}) {
    _isSuccess = isSuccess;
    _error = error;
  }

  bool get isSuccess => _isSuccess;
  set isSuccess(bool isSuccess) => _isSuccess = isSuccess;
  Error get error => _error;
  set error(Error error) => _error = error;

  Status.fromJson(Map<String, dynamic> json) {
    _isSuccess = json['isSuccess'];
    _error = (json['error'] != null ? new Error.fromJson(json['error']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = _isSuccess;
    if (_error != null) {
      data['error'] = _error.toJson();
    }
    return data;
  }
}

class Error {
  late int _code;
  late String _message;

  Error({required int code,required String message}) {
    _code = code;
    _message = message;
  }

  int get code => _code;
  set code(int code) => _code = code;
  String get message => _message;
  set message(String message) => _message = message;

  Error.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = _code;
    data['message'] = _message;
    return data;
  }
}