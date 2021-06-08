import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/virtualclass/components/tabbarclass.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';
import 'package:suapifba/app/modules/virtualclass/virtualclass_controller.dart';

class VirtualClassListView extends StatelessWidget {
  /* 
  Listagem de salas virtuais por período
  */

  final VirtualClassController controller;
  final String token;

  VirtualClassListView({this.controller, this.token});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: controller.virtualClasses.map(
          (item) {
            return ListTile(
              leading: Icon(Icons.video_label),
              title: Text(
                item.descricao,
                style: TextStyle(
                  color: Colors.grey[700],
                  // shadows: [
                  //   Shadow(
                  //     blurRadius: 2,
                  //     color: Colors.black38,
                  //     offset: Offset(1.2, 1.2),
                  //   )
                  // ],
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Text(item.horariosDeAula),
              onTap: () async {
                final VirtualClass data =
                    await controller.getVirtualClass(token, item.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TabBarViewClass(
                      virtualclass: data,
                    ),
                  ),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
