import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/hour/hour_controller.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';
import 'package:suapifba/app/shared/components/dropdownmenu.dart';
import 'package:suapifba/app/shared/components/modal_and_dropdown_default.dart';

class HourPage extends StatefulWidget {
  final String token;

  HourPage({Key key, this.token}) : super(key: key);

  @override
  _HourPageState createState() => _HourPageState();
}

class _HourPageState extends State<HourPage> {
  HourController controller = Modular.get<HourController>();

  Widget tableTitleBar(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black87, fontSize: 14),
    );
  }

  @override
  void initState() {
    super.initState();
    controller.getPeriods(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault(title: "Horários"),
      body: ModalAndDropdownDefault(
        token: widget.token,
        controller: controller,
        getContent: controller.getVirtualClasses,
        content: Observer(
          builder: (context) {
            if (controller.validateData()) {
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
                    DataColumn(label: tableTitleBar('Sexta	')),
                  ],
                  rows: controller.hoursClass.map((item) {
                    return DataRow(cells: [
                      DataCell(Text(item[0])),
                      DataCell(Text(item[1])),
                      DataCell(Text(item[2])),
                      DataCell(Text(item[3])),
                      DataCell(Text(item[4])),
                      DataCell(Text(item[5])),
                    ]);
                  }).toList(),
                ),
              );
            } else
              return Container();
          },
        ),
      ),
    );
  }
}
