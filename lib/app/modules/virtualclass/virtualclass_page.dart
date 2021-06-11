import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/virtualclass/components/virtual_class_listview.dart';
import 'package:suapifba/app/modules/virtualclass/virtualclass_controller.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';
import 'package:suapifba/app/shared/components/dropdownmenu.dart';
import 'package:suapifba/app/shared/components/modal_and_dropdown_default.dart';
import 'package:suapifba/app/shared/components/modal_progress.dart';

class VirtualClassPage extends StatefulWidget {
  final String? token;

  VirtualClassPage({Key? key, this.token}) : super(key: key);

  @override
  _VirtualClassPageState createState() => _VirtualClassPageState();
}

class _VirtualClassPageState extends State<VirtualClassPage> {
  VirtualClassController controller = Modular.get<VirtualClassController>();

  @override
  void initState() {
    super.initState();
    controller.getPeriods(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault(title: 'Turmas Virtuais') as PreferredSizeWidget?,
      body: ModalAndDropdownDefault(
        token: widget.token,
        controller: controller,
        getContent: controller.getVirtualClasses,
        content: Observer(
          builder: (context) {
            if (controller.validateData()) {
              // Lista as salas virtual do período selecionado
              return VirtualClassListView(
                controller: controller,
                token: widget.token,
              );
            } else
              return Container(color: Colors.white);
          },
        ),
      ),
    );
  }
}
