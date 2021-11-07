import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestData {
  late String period;

  RequestData({required period});

  RequestData.fromJson(Map<String, dynamic> json) {
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['period'] = period;
    return data;
  }
}

class ResponseData {
  late List<Stocks> _stocks;
  late Status _status;

  ResponseData({required List<Stocks> stocks, required Status status}) {
    _stocks = stocks;
    _status = status;
  }

  List<Stocks> get stocks => _stocks;
  set stocks(List<Stocks> stocks) => _stocks = stocks;
  Status get status => _status;
  set status(Status status) => _status = status;

  ResponseData.fromJson(Map<String, dynamic> json) {
    if (json['stocks'] != null) {
      _stocks = <Stocks>[];
      json['stocks'].forEach((v) {
        _stocks.add(new Stocks.fromJson(v));
      });
    }
    _status =
        (json['status'] != null ? new Status.fromJson(json['status']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (_stocks != null) {
      data['stocks'] = _stocks.map((v) => v.toJson()).toList();
    }
    if (_status != null) {
      data['status'] = _status.toJson();
    }
    return data;
  }
}

class GetDataApi {
    var url = Uri.parse('https://mobilechallenge.veripark.com/api/stocks/list');
    Future<ResponseData> getApi() async {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return ResponseData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load');
      }
    }
}

class Stocks {
  late int _id;
  late bool _isDown;
  late bool _isUp;
  late double _bid;
  late double _difference;
  late double _offer;
  late double _price;
  late double _volume;
  late String _symbol;

  Stocks(
      {required int id,
      required bool isDown,
      required bool isUp,
      required double bid,
      required double difference,
      required double offer,
      required double price,
      required double volume,
      required String symbol}) {
    _id = id;
    _isDown = isDown;
    _isUp = isUp;
    _bid = bid;
    _difference = difference;
    _offer = offer;
    _price = price;
    _volume = volume;
    _symbol = symbol;
  }

  int get id => _id;
  set id(int id) => _id = id;
  bool get isDown => _isDown;
  set isDown(bool isDown) => _isDown = isDown;
  bool get isUp => _isUp;
  set isUp(bool isUp) => _isUp = isUp;
  double get bid => _bid;
  set bid(double bid) => _bid = bid;
  double get difference => _difference;
  set difference(double difference) => _difference = difference;
  double get offer => _offer;
  set offer(double offer) => _offer = offer;
  double get price => _price;
  set price(double price) => _price = price;
  double get volume => _volume;
  set volume(double volume) => _volume = volume;
  String get symbol => _symbol;
  set symbol(String symbol) => _symbol = symbol;

  Stocks.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _isDown = json['isDown'];
    _isUp = json['isUp'];
    _bid = json['bid'];
    _difference = json['difference'];
    _offer = json['offer'];
    _price = json['price'];
    _volume = json['volume'];
    _symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['isDown'] = _isDown;
    data['isUp'] = _isUp;
    data['bid'] = _bid;
    data['difference'] = _difference;
    data['offer'] = _offer;
    data['price'] = _price;
    data['volume'] = _volume;
    data['symbol'] = _symbol;
    return data;
  }
}

class Status {
  late bool _isSuccess;
  late Error _error;

  Status({required bool isSuccess, required Error error}) {
    _isSuccess = isSuccess;
    _error = error;
  }

  bool get isSuccess => _isSuccess;
  set isSuccess(bool isSuccess) => _isSuccess = isSuccess;
  Error get error => _error;
  set error(Error error) => _error = error;

  Status.fromJson(Map<String, dynamic> json) {
    _isSuccess = json['isSuccess'];
    _error =
        (json['error'] != null ? new Error.fromJson(json['error']) : null)!;
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

  Error({required int code, required String message}) {
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
