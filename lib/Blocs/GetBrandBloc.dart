import 'package:flutterapicalls/Models/BrandModel.dart';
import 'package:flutterapicalls/resources/Repository.dart';
import 'package:rxdart/rxdart.dart';

class GetBrandBloc {
  final _repository = Repository();
  final _brandsFetcher = PublishSubject<BrandModel>();

  Observable<BrandModel> get allBrands => _brandsFetcher.stream;

  fetchAllBrands() async {
    BrandModel itemModel = await _repository.fetchAllBrands();
    _brandsFetcher.sink.add(itemModel);
  }

  dispose() {
    _brandsFetcher.close();
  }
}

final bloc = GetBrandBloc();
