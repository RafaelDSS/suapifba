import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/virtualclass/components/virtual_class_listview.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclasses_model.dart';
import 'package:suapifba/app/modules/virtualclass/stores/virtualclasses_store.dart';
import 'package:suapifba/app/modules/virtualclass/stores/vistualclass_store.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';
import 'package:suapifba/app/shared/components/dropdownmenu.dart';
import 'package:suapifba/app/shared/components/modal_progress.dart';
import 'package:suapifba/app/shared/helpers/advertisement.dart';

import 'package:suapifba/app/shared/models/period_model.dart';
import 'package:suapifba/app/shared/helpers/store_observer.dart';
import 'package:suapifba/app/shared/stores/period_store.dart';

class VirtualClassPage extends StatefulWidget {
  const VirtualClassPage({Key? key}) : super(key: key);

  @override
  _VirtualClassPageState createState() => _VirtualClassPageState();
}

class _VirtualClassPageState extends State<VirtualClassPage> {
  final periodStore = Modular.get<PeriodStore>();
  final virtualClassesStore = Modular.get<VirtualClassesStore>();
  final virtualClassStore = Modular.get<VirtualClassStore>();

  late Disposer _disposerPeriod;
  late Disposer _disposerVirtualClasses;
  late Disposer _disposerVirtualClass;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    periodStore.getPeriods();

    _disposerPeriod = defaultStoreObserver(
      context: context,
      store: periodStore,
      onLoading: (loading) {
        setState(() {
          isLoading = loading;
        });
      },
    );
    _disposerVirtualClasses = defaultStoreObserver(
      context: context,
      store: virtualClassesStore,
      onLoading: (loading) {
        setState(() {
          isLoading = loading;
        });
      },
    );
    _disposerVirtualClass = defaultStoreObserver(
      context: context,
      store: virtualClassStore,
      onLoading: (loading) {
        setState(() {
          isLoading = loading;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    periodStore.destroy();
    virtualClassesStore.destroy();
    virtualClassStore.destroy();
    _disposerPeriod();
    _disposerVirtualClasses();
    _disposerVirtualClass();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault(title: 'Turmas Virtuais'),
      body: Stack(
        children: [
          Column(
            children: [
              ScopedBuilder<PeriodStore, Exception, List<Period>>(
                store: periodStore,
                onState: (context, state) => DropDownMenu(
                  items: state,
                  onChanged: (period) =>
                      virtualClassesStore.getVirtualClasses(period!),
                ),
                onLoading: (context) => Container(),
              ),
              const NativeAdItem(),
              ScopedBuilder<VirtualClassesStore, Exception,
                  List<VirtualClassesModel>>(
                store: virtualClassesStore,
                onState: (context, state) => VirtualClassesListView(
                  virtualClasses: state,
                  onTap: (virtualClassId) {
                    bool isNotWasPushed = true;
                    virtualClassStore.getVirtualClass(virtualClassId);
                    virtualClassStore.observer(onState: (state) {
                      if (isNotWasPushed) {
                        isNotWasPushed = false;
                        Modular.to.pushNamed("/virtualclass/class/",
                            arguments: state);
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          isLoading ? const ModalProgress() : Container()
        ],
      ),
    );
  }
}
