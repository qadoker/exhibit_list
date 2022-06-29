part of 'exhibit_list_cubit.dart';

abstract class ExhibitListState extends Equatable {
  const ExhibitListState();

  @override
  List<Object> get props => [];
}

class ExhibitListInitial extends ExhibitListState {}

class ExhibitListLoading extends ExhibitListState {}

class ExhibitListLoaded extends ExhibitListState {
  final List<Exhibit> exhibits;
  const ExhibitListLoaded({required this.exhibits});

  @override
  List<Object> get props => [exhibits];
}

class ExhibitListAlert extends ExhibitListState {}
