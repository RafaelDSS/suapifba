import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/virtualclass/components/aulatab.dart';
import 'package:suapifba/app/modules/virtualclass/components/materialtab.dart';
import 'package:suapifba/app/modules/virtualclass/components/participantestab.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';

class TabBarViewClass extends StatefulWidget {
  final VirtualClassModel? virtualclass;

  const TabBarViewClass({Key? key, this.virtualclass}) : super(key: key);

  @override
  _TabBarViewClassState createState() => _TabBarViewClassState();
}

class _TabBarViewClassState extends State<TabBarViewClass> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Tooltip(
            triggerMode: TooltipTriggerMode.tap,
            message: widget.virtualclass!.componenteCurricular!.split(' - ')[1],
            child: Text(
                'Turma Virtual - ${widget.virtualclass!.componenteCurricular!.split(' - ')[0]}'),
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Text(
                'Participantes',
              ),
              Tab(
                text: 'Aulas',
              ),
              Tab(
                text: 'Materiais',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ParticipantesTabView(
              participantes: widget.virtualclass!.participantes,
            ),
            AulaTabView(
              aulas: widget.virtualclass!.aulas,
            ),
            MaterialTabView(
              materiais: widget.virtualclass!.materiaisDeAula,
            )
          ],
        ),
      ),
    );
  }
}
