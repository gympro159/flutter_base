import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'list_base_event.dart';
part 'list_base_state.dart';
class ListBaseBloc extends Bloc<ListBaseEvent, ListBaseState> {
  ListBaseBloc() : super(ListBaseInitial());
  @override
  Stream<ListBaseState> mapEventToState(
    ListBaseEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
