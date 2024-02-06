import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/core/api_status.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/points_table.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:equatable/equatable.dart';

part 'points_table_state.dart';
part 'points_table_event.dart';

class PointsTableBloc extends Bloc<PointsTableEvent, PointsTableState> {
  final CricBuzzRepository repository;
  PointsTableBloc({required this.repository}) : super(const PointsTableState()) {
    on<GetPointsTable>(_mapGetPointsTableEventToState);
  }

  void _mapGetPointsTableEventToState(GetPointsTable event, Emitter<PointsTableState> emit) async {
    try {
      emit(state.copyWith(status: ApiStatus.loading));
      final response = await repository.getPointsTable(seriesId: event.seriesId);
      emit(state.copyWith(status: ApiStatus.success, pointsTable: response));
    } catch (error) {
      emit(state.copyWith(status: ApiStatus.error));
    }
  }
}
