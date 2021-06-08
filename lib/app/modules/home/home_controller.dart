import 'package:mobx/mobx.dart';
import 'package:suapifba/app/shared/repositories/localstore_repository.dart';
import 'models/home_model.dart';
import 'repositories/home_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  HomeRepository repository;
  LocalStoreRepository repositoryStore = LocalStoreRepository();
  String token;

  _HomeControllerBase(this.repository);

  @observable
  StudentData data = StudentData( 
    matricula: null,
    nomeUsual: null,
    urlFoto: null,
    vinculo: Vinculo(  
      campus: null,
      cotaMec: null,
      curso: null,
      nome: null,
      situacao: null
    )
  );

  validateData() {
    if (data.matricula != null)
      return true;
    else 
      return false;
  }
  
  @action
  getData() async {
    this.token = await repositoryStore.getToken();
    final studentdata = await repository.fethData(token);
    data = studentdata;
  }
}
