import 'package:flutterapicalls/Models/Responces/MyApplianceModel.dart';
import 'package:flutterapicalls/resources/Repository.dart';
import 'package:rxdart/rxdart.dart';

class MyApplianceBloc {
  final _repository = Repository();
  final _myappliancesFetcher = PublishSubject<MyApplianceModel>();

  Observable<MyApplianceModel> get allMyAppliance =>
      _myappliancesFetcher.stream;

  fetchMyAppliances(int movieId) async {
    MyApplianceModel itemModel = await _repository.fetchMyAppliance(movieId);
    _myappliancesFetcher.sink.add(itemModel);
  }

  dispose() {
    _myappliancesFetcher.close();
  }
}

final myappliancesbloc = MyApplianceBloc();
