import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techincal_task/foundation/data_sources/remote/exhibit_list/rest_exhibit_list_loader.dart';
import 'package:techincal_task/foundation/helpers/functions/locator.dart';
import 'package:techincal_task/foundation/models/remote_models/exhibit_model.dart';

part 'exhibit_list_state.dart';

class ExhibitListCubit extends Cubit<ExhibitListState> {
  ExhibitListCubit() : super(ExhibitListInitial());

  RestExhibitsLoader get _exhibitLoader => getIt.get<RestExhibitsLoader>();

  Future<void> getExhibits() async {
    emit(ExhibitListLoading());
    final result = await _exhibitLoader.getExhibitList();
    if (result.isSuccess()) emit(ExhibitListLoaded(exhibits: result.getSuccess() ?? []));
    if (result.isError()) emit(ExhibitListAlert());
  }
}
