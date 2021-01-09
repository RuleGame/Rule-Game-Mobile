import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ReqQuery {
  Map<String, dynamic?> toMap();
}

class DummyQuery implements ReqQuery {
  @override
  Map<String, dynamic?> toMap() => {};
}

class ShapeReqQuery implements ReqQuery {
  final String shape;

  ShapeReqQuery({required this.shape});

  @override
  Map<String, dynamic?> toMap() => {'shape': shape};
}

abstract class ResBody {}

class GetColorMapRes implements ResBody {
  final String errmsg;
  final bool? error;
  final Map<String, List<int>> colorToRgbMap;

  GetColorMapRes(
      {required this.errmsg, required this.colorToRgbMap, this.error});

  factory GetColorMapRes.fromJson(Map<String, dynamic> json) {
    final colorToRgbMap = Map.castFrom<String, dynamic, String, List<int>>({
      for (var k in json.keys)
        if (k != 'error' && k != 'errmsg')
          k: List.castFrom<dynamic, int>(json[k])
    });

    return GetColorMapRes(
      errmsg: json['errmsg'],
      error: json['error'],
      colorToRgbMap: colorToRgbMap,
    );
  }
}

final API_HOST_ORIGIN = '10.0.2.2:7150';
final BASE_ROUTE = '/w2020-dev';

Future<GetColorMapRes> getColorMapApi() async => GetColorMapRes.fromJson(
      jsonDecode(
        await getApi('/game-data/GameService2/colorMap'),
      ),
    );

Future<String> getShapeApi(shape) async =>
    (await getApi('/admin/getSvg.jsp', ShapeReqQuery(shape: shape)))
        .replaceAll('currentColor', 'black');

Future<String> getApi(String route, [ReqQuery? query]) async {
  query ??= DummyQuery();
  final queryMap = query.toMap();
  final uri = Uri.http(
    API_HOST_ORIGIN,
    '${BASE_ROUTE}${route}',
    {for (var k in queryMap.keys) k: queryMap[k]?.toString() ?? ''},
  );
  final response = await http.get(uri);
  return response.body;
}
