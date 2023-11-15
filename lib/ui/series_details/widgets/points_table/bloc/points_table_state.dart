// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'points_table_bloc.dart';

class PointsTableState extends Equatable {
   final ApiStatus status;
   final PointsTable? pointsTable;

  const PointsTableState({
    this.status = ApiStatus.initial,
    this.pointsTable
  });
  
  @override
  List<Object?> get props => [status, pointsTable];

  PointsTableState copyWith({
    ApiStatus? status,
    PointsTable? pointsTable
  }) {
    return PointsTableState(
      status: status ?? this.status,
      pointsTable: pointsTable ?? this.pointsTable
    );
  }
}
