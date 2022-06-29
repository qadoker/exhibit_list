import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:techincal_task/foundation/data_sources/remote/exhibit_list/exhibit_list_loader.dart';
import 'package:techincal_task/foundation/helpers/classes/app_logger.dart';
import 'package:techincal_task/foundation/models/remote_models/exhibit_model.dart';
import 'package:techincal_task/supplies/constants/restful_endpoints.dart';

class RestExhibitsLoader implements ExhibitsLoader {
  final _dio = Dio();

  @override
  Future<Result<Exception, List<Exhibit>>> getExhibitList() async {
    try {
      final result = await _dio.get(restfulEndpoints.exhibitList);
      final exhibits = (result.data as List).map((e) => Exhibit.fromJson(e)).toList();
      return Success(exhibits);
    } catch (e, s) {
      logger.d(e);
      logger.d(s);
      return Error(Exception());
    }
  }
}
