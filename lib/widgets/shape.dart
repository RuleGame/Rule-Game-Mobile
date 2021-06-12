import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rulegamemobile/utils/hooks.dart';

class Shape extends HookWidget {
  Shape({required this.shape, this.color, this.opacity});

  final String? color;
  final String shape;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    final colorRgb = useColorRgb(color, opacity: opacity);
    final svg = useSvg(shape);

    return svg != null && !(color != null && colorRgb == null)
        ? SvgPicture.string(svg, color: colorRgb)
        : Container();
  }
}
