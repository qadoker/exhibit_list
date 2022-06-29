import 'package:multiple_result/multiple_result.dart';
import 'package:techincal_task/foundation/models/remote_models/exhibit_model.dart';

abstract class ExhibitsLoader {
  Future<Result<Exception, List<Exhibit>>> getExhibitList();
}
