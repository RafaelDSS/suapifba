import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/hour/components/hour_table.dart';
import 'package:suapifba/app/modules/hour/models/hour_model.dart';
import 'package:suapifba/app/modules/hour/stores/hour_store.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';
import 'package:suapifba/app/shared/components/dropdownmenu.dart';
import 'package:suapifba/app/shared/components/modal_progress.dart';
import 'package:suapifba/app/shared/models/period_model.dart';
import 'package:suapifba/app/shared/helpers/store_observer.dart';
import 'package:suapifba/app/shared/stores/period_store.dart';

class HourPage extends StatefulWidget {
  const HourPage({Key? key}) : super(key: key);

  @override
  _HourPageState createState() => _HourPageState();
}

class _HourPageState extends State<HourPage> {
  final periodStore = Modular.get<PeriodStore>();
  final hourStore = Modular.get<HourStore>();

  late Disposer _disposerPeriod;
  late Disposer _disposerHour;

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
    _disposerHour = defaultStoreObserver(
      context: context,
      store: hourStore,
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
    _disposerPeriod();
    _disposerHour();
    periodStore.destroy();
    hourStore.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault(title: "Horários"),
      body: Stack(
        children: [
          Column(
            children: [
              ScopedBuilder<PeriodStore, Exception, List<Period>>(
                store: periodStore,
                onState: (context, state) => DropDownMenu(
                  items: state,
                  onChanged: (period) => hourStore.getHour(period!),
                ),
                onError: (context, error) => Container(),
              ),
              ScopedBuilder<HourStore, Exception, HourModel>(
                store: hourStore,
                onState: (context, state) => state.hours.isEmpty
                    ? Container()
                    : HourTable(hourModel: state),
                onError: (context, error) => Container(),
              )
            ],
          ),
          isLoading ? const ModalProgress() : Container()
        ],
      ),
    );
  }
}
