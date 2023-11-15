// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'venues_bloc.dart';

class VenuesState extends Equatable {
  const VenuesState({
    this.status = ApiStatus.initial,
    this.venues 
  });

  final ApiStatus status;
  final SeriesVenue? venues;
  
  @override
  List<Object?> get props => [status, venues];

  VenuesState copyWith({
    ApiStatus? status,
    SeriesVenue? venues,
  }) {
    return VenuesState(
      status: status ?? this.status,
      venues: venues ?? this.venues,
    );
  }
}
