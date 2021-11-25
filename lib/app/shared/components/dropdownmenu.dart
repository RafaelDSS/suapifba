import 'package:flutter/material.dart';
import 'package:suapifba/app/shared/models/period_model.dart';

class DropDownMenu extends StatefulWidget {
  final List<Period>? items;
  final Function(String?)? onChanged;

  DropDownMenu({Key? key, this.items, this.onChanged}) : super(key: key);

  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? periodValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField(
        iconSize: 26,
        hint: periodValue == null
            ? const Text("Períodos letivos")
            : Text("$periodValue"),
        value: periodValue,
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
            periodValue = itemSelected;
          });
          widget.onChanged!(itemSelected);
        },
      ),
    );
  }
}
