part of 'list_base_bloc.dart';
abstract class ListBaseState extends Equatable {
  const ListBaseState();
}
class ListBaseInitial extends ListBaseState {
  @override
  List<Object> get props => [];
}
