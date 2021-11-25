import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/reportcard/components/courses.dart';
import 'package:suapifba/app/modules/reportcard/models/reportcard_model.dart';
import 'package:suapifba/app/modules/reportcard/stores/reportcard_store.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';
import 'package:suapifba/app/shared/components/dropdownmenu.dart';
import 'package:suapifba/app/shared/components/modal_progress.dart';
import 'package:suapifba/app/shared/models/period_model.dart';
import 'package:suapifba/app/shared/helpers/store_observer.dart';
import 'package:suapifba/app/shared/stores/period_store.dart';

class ReportCard extends StatefulWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  _ReportCardState createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  final periodStore = Modular.get<PeriodStore>();
  final reportcardStore = Modular.get<ReportCardStore>();

  late Disposer _disposerPeriod;
  late Disposer _disposerReportcard;
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
    _disposerReportcard = defaultStoreObserver(
      context: context,
      store: reportcardStore,
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
    _disposerReportcard();
    periodStore.destroy();
    reportcardStore.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault(title: "Boletim"),
      body: Stack(
        children: [
          Column(
            children: [
              ScopedBuilder<PeriodStore, Exception, List<Period>>(
                store: periodStore,
                onState: (context, state) => DropDownMenu(
                  items: state,
                  onChanged: (period) => reportcardStore.getNotes(period!),
                ),
                onError: (context, error) => Container(),
                onLoading: (context) => Container(),
              ),
              ScopedBuilder<ReportCardStore, Exception, List<ReportCardModel>>(
                store: reportcardStore,
                onState: (context, state) => Courses(
                  reportCard: state,
                ),
                onError: (context, error) => Container(),
              ),
            ],
          ),
          isLoading ? const ModalProgress() : Container()
        ],
      ),
    );
  }
}
