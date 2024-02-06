import 'package:cricbuzz_clone/core/api_status.dart';
import 'package:cricbuzz_clone/core/components/image_row.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/venues/bloc/venues_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cricbuzz_clone/core/components/progress_indicator.dart' as core;

class VenuesWidget extends StatefulWidget {
  const VenuesWidget({super.key, required this.seriesId});

  final int seriesId;

  @override
  State<VenuesWidget> createState() => _VenuesWidgetState();
}

class _VenuesWidgetState extends State<VenuesWidget> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    context.read<VenuesBloc>().add(GetSeriesVenues(seriesId: widget.seriesId));
  }

  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: const Color.fromRGBO(227, 234, 235, 1),
      child: BlocConsumer<VenuesBloc, VenuesState>(
        listener: (context, state) {}, 
        builder: (context, state) {
           if (state.status.isLoading) {
            return const core.ProgressIndicator();
          } else if (state.status.isError) {
            return const Text("Error");
          } else {
            final venues = state.venues?.seriesVenue ?? [];
            final length = venues.length;
            return ListView.builder(
              itemCount: length,
              itemBuilder: (context, index) {
                final venue = venues[index];
                final imageId = venue.imageId ?? '';
                final ground = venue.ground ?? '';
                final city = venue.city ?? '';
                return ImageRow(imageId: imageId, title: ground, subTitle: city);
              }
            );
          }
        }
      ),
    );
  }
}