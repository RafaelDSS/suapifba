import 'package:flutter/material.dart';

class TooltipShapeBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double arrowArc;
  final double radius;

  const TooltipShapeBorder({
    this.radius = 16.0,
    this.arrowWidth = 20.0,
    this.arrowHeight = 10.0,
    this.arrowArc = 0.0,
  }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(
        rect.topLeft, rect.bottomRight - Offset(0, arrowHeight));
    double x = arrowWidth, y = arrowHeight, r = 1 - arrowArc;
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
      ..moveTo(rect.bottomCenter.dx + x / 2, rect.bottomCenter.dy)
      ..relativeLineTo(-x / 2 * r, y * r)
      ..relativeQuadraticBezierTo(
          -x / 2 * (1 - r), y * (1 - r), -x * (1 - r), 0)
      ..relativeLineTo(-x / 2 * r, -y * r);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class HourTable extends StatelessWidget {
  final List<List> hour;
  const HourTable({Key? key, required this.hour}) : super(key: key);

  Widget tableTitleBar(String text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.grey[700], fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  DataCell courseCell({required String sigla, required String descricao}) {
    return DataCell(
      Tooltip(
        decoration: ShapeDecoration(
          color: Colors.grey[700],
          shape: const TooltipShapeBorder(),
        ),
        preferBelow: false,
        triggerMode: TooltipTriggerMode.tap,
        message: descricao,
        child: Text(sigla),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(
            label: tableTitleBar('VESPERTINO'),
          ),
          DataColumn(label: tableTitleBar('Segunda')),
          DataColumn(label: tableTitleBar('Terça')),
          DataColumn(label: tableTitleBar('Quarta')),
          DataColumn(label: tableTitleBar('Quinta')),
          DataColumn(label: tableTitleBar('Sexta')),
          DataColumn(label: tableTitleBar('')),
        ],
        rows: hour.map((item) {
          return DataRow(cells: [
            DataCell(
              Text(
                item[0],
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            courseCell(
              sigla: item[1][0],
              descricao: item[1][1],
            ),
            courseCell(
              sigla: item[2][0],
              descricao: item[2][1],
            ),
            courseCell(
              sigla: item[3][0],
              descricao: item[3][1],
            ),
            courseCell(
              sigla: item[4][0],
              descricao: item[4][1],
            ),
            courseCell(
              sigla: item[5][0],
              descricao: item[5][1],
            ),
            courseCell(sigla: "", descricao: "")
          ]);
        }).toList(),
      ),
    );
  }
}
