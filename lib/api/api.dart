import 'package:testapp/model/subject.dart';

import '../utils/request.dart';

typedef RequestCallBack<T> = void Function(T value);

class API {
  final _request = HttpRequest();

  Future<dynamic> getBookList(data,RequestCallBack requestCallBack) async {
    final Map result = await _request.post(
        "/bookApi/selectBookPropertiesList", data,
        headers: {"Content-Type": "application/json"});
    var resultList = result['data']['row'];
    List<Subject> list = resultList;
    requestCallBack({"list": list});
  }
}
