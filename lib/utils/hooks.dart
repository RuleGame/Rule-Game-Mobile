import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rulegamemobile/utils/api.dart';
import 'package:rulegamemobile/utils/rgb.dart';

AsyncSnapshot<T> useQuery<T>(Future<T> Function() create,
    [List<String?>? deps]) {
  deps ??= [];
  final future = useMemoized(create, deps);
  return useFuture(future);
}

Color? useColorRgb<T>(String? colorName) {
  final response = useQuery(getColorMapApi, [colorName]);
  if (response.data != null) {
    final colorRgbTuple = response.data!.colorToRgbMap[colorName]!;
    return rgb(colorRgbTuple[0], colorRgbTuple[1], colorRgbTuple[2]);
  }
}

String? useSvg<T>(String shape) {
  final response = useQuery(() => getShapeApi(shape), [shape]);
  return response.data;
}
