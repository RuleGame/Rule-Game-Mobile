import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rulegamemobile/utils/api.dart';

AsyncSnapshot<T> useQuery<T>(Future<T> Function() create, [List<String> deps]) {
  deps ??= [];
  final future = useMemoized(create, deps);
  // TODO: Add error handling for the future
  return useFuture(future);
}

Map<String, List<int>> cachedColorMap;

Color useColorRgb<T>(String colorName, {double opacity}) {
  final response = useQuery(
      () async => cachedColorMap ?? (await getColorMapApi()).colorToRgbMap,
      [colorName]);
  if (response.data != null && colorName != null) {
    cachedColorMap = response.data;
    final colorRgbTuple = response.data[colorName];
    return Color.fromRGBO(
      colorRgbTuple[0],
      colorRgbTuple[1],
      colorRgbTuple[2],
      opacity ?? 1.0,
    );
  }

  return null;
}

//Map<String, String> cachedSvgs = {"HAPPY": "hi"};
Map<String, String> cachedSvgs = {};

String useSvg<T>(String shape) {
  final response =
      useQuery(() async => cachedSvgs[shape] ?? getShapeApi(shape), [shape]);
  cachedSvgs[shape] = response.data as String;
  return response.data;
}

void useMount(Dispose Function() effect) {
  useEffect(effect, []);
}
