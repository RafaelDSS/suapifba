import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/home_controller.dart';
import 'package:suapifba/app/shared/models/period_model.dart';

class DropDownMenu extends StatefulWidget {
  final List<Period>? items;
  final String? title;
  final Function? onChangeFunc;
  String? periodValue;
  final String? token;

  DropDownMenu({this.items, this.title, this.onChangeFunc, this.token});

  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: DropdownButton(
        iconSize: 26,
        hint: Text(widget.title!),
        value: widget.periodValue,
        isExpanded: true,
        items: widget.items!.map((period) {
          final semestre = '${period.anoLetivo}/${period.periodoLetivo}';
          return DropdownMenuItem(
            value: semestre,
            child: Text(semestre),
          );
        }).toList(),
        onChanged: (String? itemSelected) {
          setState(() {
            widget.periodValue = itemSelected;
          });
          widget.onChangeFunc!(widget.token, itemSelected);
        },
      ),
    );
  }
}
