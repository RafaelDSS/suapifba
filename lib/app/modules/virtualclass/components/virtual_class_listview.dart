import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclasses_model.dart';

class VirtualClassesListView extends StatelessWidget {
  final List<VirtualClassesModel> virtualClasses;
  final Function onTap;

  const VirtualClassesListView(
      {Key? key, required this.virtualClasses, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: virtualClasses.map(
          (item) {
            return ListTile(
              leading: const Icon(Icons.video_label),
              title: Text(
                item.descricao!,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Text(item.horariosDeAula!),
              onTap: () => onTap(item.id),
            );
          },
        ).toList(),
      ),
    );
  }
}
