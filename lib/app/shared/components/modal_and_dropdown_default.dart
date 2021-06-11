import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:suapifba/app/shared/components/dropdownmenu.dart';
import 'package:suapifba/app/shared/components/modal_progress.dart';

class ModalAndDropdownDefault extends StatelessWidget {
  final String? token;
  final dynamic controller;
  final Function? getContent;
  final Widget? content;

  ModalAndDropdownDefault(
      {this.token, this.controller, this.getContent, this.content});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Observer(
                builder: (context) {
                  final periods = controller.periods;
                  if (periods != null)
                    // Menu dropdown para seleção do periodo letivo
                    return DropDownMenu(
                      items: periods,
                      title: 'Periodos Letivos',
                      onChangeFunc: getContent,
                      token: token,
                    );
                  else
                    return Center(
                      child: Container(color: Colors.red),
                    );
                },
              ),
              content!
            ],
          ),
        ),
        Observer(
          // Mostra icone de progresso enquanto a conexão com a api não é finalizada.
          builder: (context) =>
              controller.loading ? ModalProgress() : Container(),
        )
      ],
    );
  }
}
