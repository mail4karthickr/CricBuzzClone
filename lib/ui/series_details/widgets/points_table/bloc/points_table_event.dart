// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'points_table_bloc.dart';

sealed class PointsTableEvent extends Equatable {
  const PointsTableEvent();

  @override
  List<Object> get props => [];
}

class GetPointsTable extends PointsTableEvent {
  final int seriesId;
  const GetPointsTable({
    required this.seriesId,
  });

  @override
  List<Object> get props => [seriesId];
} 
