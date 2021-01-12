import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rulegamemobile/utils/models.dart';

final API_HOST_ORIGIN = '10.0.2.2:7150';
final BASE_ROUTE = '/w2020-dev';

Future<GetColorMapResBody> getColorMapApi() async =>
    GetColorMapResBody.fromJson(
      await getApiJson('/game-data/GameService2/colorMap'),
    );

Future<DummyResBody> postWriteFileApi(
        {required PostWriteFileReqBody body}) async =>
    DummyResBody.fromJson(
      await postApiJson('/game-data/GameService/writeFile', body: body),
    );

Future<PostPlayerResBody> postPlayerApi(
        {required PostPlayerReqBody body}) async =>
    PostPlayerResBody.fromJson(
      await postApiJson('/game-data/GameService2/player', body: body),
    );

Future<PostMostRecentEpisodeResBody> postMostRecentEpisodeApi(
        {required PostMostRecentEpisodeReqBody body}) async =>
    PostMostRecentEpisodeResBody.fromJson(
      await postApiJson('/game-data/GameService2/mostRecentEpisode',
          body: body),
    );

Future<PostNewEpisodeResBody> postNewEpisodeApi(
        {required PostNewEpisodeReqBody body}) async =>
    PostNewEpisodeResBody.fromJson(
      await postApiJson('/game-data/GameService2/newEpisode', body: body),
    );

Future<GetDisplayResBody> getDisplayApi() async => GetDisplayResBody.fromJson(
      await getApiJson('/game-data/GameService2/display'),
    );

Future<PostMoveResBody> postMoveApi({required PostMoveReqBody body}) async =>
    PostMoveResBody.fromJson(
      await postApiJson('/game-data/GameService2/move', body: body),
    );

Future<PostPickResBody> postPickApi({required PostPickReqBody body}) async =>
    PostPickResBody.fromJson(
      await postApiJson('/game-data/GameService2/pick', body: body),
    );

Future<PostActivateBonusResBody> postActivateBonusApi(
        {required PostPickReqBody body}) async =>
    PostActivateBonusResBody.fromJson(
      await postApiJson('/game-data/GameService2/activateBonus', body: body),
    );

Future<PostGiveUpResBody> PostGiveUpBonusApi(
        {required PostGiveUpReqBody body}) async =>
    PostGiveUpResBody.fromJson(
      await postApiJson('/game-data/GameService2/giveUp', body: body),
    );

Future<PostGuessResBody> PostGuessApi({required PostGuessReqBody body}) async =>
    PostGuessResBody.fromJson(
      await postApiJson('/game-data/GameService2/guess', body: body),
    );

Future<String> getShapeApi(shape) async =>
    (await getApi('/admin/getSvg.jsp', query: GetShapeReqQuery(shape: shape)))
        .replaceAll('currentColor', 'black');

Future<String> getApi(String route, {ReqQuery? query}) async {
  query ??= DummyReqQuery();
  final queryMap = query.toMap();
  final uri = Uri.http(
    API_HOST_ORIGIN,
    '${BASE_ROUTE}${route}',
    {for (var k in queryMap.keys) k: queryMap[k]?.toString() ?? ''},
  );
  final response = await http.get(uri);
  return response.body;
}

Future<Map<String, String>> getApiJson(String route, {ReqQuery? query}) async {
  Map<String, String> json = jsonDecode(await getApi(route, query: query));
  return json;
}

Future<String> postApi(String route, {ReqQuery? query, ReqBody? body}) async {
  body ??= DummyReqBody();
  query ??= DummyReqQuery();
  final queryMap = query.toMap();
  final uri = Uri.http(
    API_HOST_ORIGIN,
    '${BASE_ROUTE}${route}',
    {for (var k in queryMap.keys) k: queryMap[k]?.toString() ?? ''},
  );
  final response = await http.post(uri, body: body.toMap());
  return response.body;
}

Future<dynamic> postApiJson(String route,
    {ReqQuery? query, ReqBody? body}) async {
  Map<String, String> json =
      jsonDecode(await postApi(route, query: query, body: body));
  return json;
}
