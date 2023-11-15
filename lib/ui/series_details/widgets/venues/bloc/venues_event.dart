// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'venues_bloc.dart';

class VenuesEvent extends Equatable {
  const VenuesEvent();

  @override
  List<Object> get props => [];
}

class GetSeriesVenues extends VenuesEvent {
  final int seriesId;
  const GetSeriesVenues({
    required this.seriesId,
  });
}
