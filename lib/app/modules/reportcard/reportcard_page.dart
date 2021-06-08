import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:suapifba/app/modules/reportcard/components/discipline_item.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';
import 'package:suapifba/app/shared/components/dropdownmenu.dart';
import 'package:suapifba/app/modules/reportcard/reportcard_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/shared/components/modal_and_dropdown_default.dart';

class ReportCard extends StatefulWidget {
  final String token;

  ReportCard({Key key, this.token}) : super(key: key);

  @override
  _ReportCardState createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  ReportcardController controller = Modular.get<ReportcardController>();

  void initState() {
    super.initState();
    controller.getPeriods(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault(title: "Boletim"),
      body: ModalAndDropdownDefault(
        token: widget.token,
        controller: controller,
        getContent: controller.getNotes,
        content: Observer(
          builder: (context) {
            if (controller.validateData()) {
              return DisciplineItem(
                controller: controller,
              );
            } else
              return Container(color: Colors.white);
          },
        ),
      ),
    );
  }
}
