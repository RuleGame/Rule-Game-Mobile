import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rulegamemobile/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

AsyncSnapshot<T?> useQuery<T>(Future<T> Function() create,
    [List<Object?>? deps]) {
  deps ??= [];
  final future = useMemoized(create, deps);
  // TODO: Add error handling for the future
  return useFuture<T?>(future, initialData: null);
}

Map<String, List<int>>? colorMap;

Color? useColorRgb<T>(String? colorName, {double? opacity}) {
  final response = useQuery(() async {
    colorMap ??= (await getColorMapApi()).colorToRgbMap;

    final colorRgbTuple = colorMap![colorName];
    if (colorRgbTuple == null) {
      throw Exception(
          'RGB color for "$colorName" is missing in color mapping.');
    }
    return Color.fromRGBO(
      colorRgbTuple[0],
      colorRgbTuple[1],
      colorRgbTuple[2],
      opacity ?? 1.0,
    );
  }, [colorName]);

  return response.data;
}

//Map<String, String> cachedSvgs = {"HAPPY": "hi"};
Map<String, String> svgsMap = {};

String? useSvg<T>(String shape) {
  final response = useQuery(() async {
    svgsMap[shape] ??= await getShapeApi(shape);
    return svgsMap[shape];
  }, [shape]);
  return response.data;
}

void useMount(Dispose Function() effect) {
  useEffect(effect, []);
}

T? useSharedPref<T>(String key, [List<Object?>? deps]) {
  deps ??= [];
  final future = useMemoized(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key) as T;
  }, deps);
  return useFuture(future, initialData: null).data;
}
