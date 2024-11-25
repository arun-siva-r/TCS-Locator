import 'package:flutter/material.dart';
import 'package:flutter_app_demo/screens/location_details_screen.dart';
import 'package:flutter_app_demo/utils/location_helper.dart';
import 'package:flutter_app_demo/widgets/common_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/location_bloc.dart';
import '../blocs/location_event.dart';
import '../blocs/location_state.dart';
import '../models/location.dart';

class LocationListScreen extends StatefulWidget {
  const LocationListScreen({super.key});

  @override
  State<LocationListScreen> createState() => _LocationListingScreenState();
}

class _LocationListingScreenState extends State<LocationListScreen> {
  final TextEditingController _searchFieldController = TextEditingController();
  List<Location> _locationList = [];
  String _filterOption = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 15),
          child: const CommonAppBar(),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: _searchFieldController,
                      onChanged: (String value) {
                        context
                            .read<LocationBloc>()
                            .add(SearchLocations(value));
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        fillColor: Colors.white24,
                        filled: true,
                        hintText: 'Search here...',
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _showFilterOptions(
                          context, Helper.getCountryNames(_locationList));
                    },
                    icon: const Icon(
                      Icons.sort,
                      size: 20,
                    ))
              ],
            ),
            Expanded(child: BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
              return _getChild(state);
            }))
          ],
        ));
  }

  Widget _getChild(LocationState state) {
    if (state is LocationLoading || state is LocationInitial) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is LocationLoaded) {
      _locationList = _filterOption == "All" ? state.locations : _locationList;
      return ListView.builder(
        shrinkWrap: true,
        itemCount: state.locations.length,
        itemBuilder: (context, index) {
          final location = state.locations[index];
          return ListTile(
            title: Text(
              location.area ?? "",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(location.location ?? ""),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LocationDetailsScreen(location: state.locations[index]),
                ),
              );
            },
          );
        },
      );
    } else if (state is LocationError) {
      return Center(child: Text(state.message));
    }
    return const Center(child: Text('TCS Locator'));
  }

  void _showFilterOptions(BuildContext context, List<String> countryNames) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView.builder(
            itemBuilder: (context, index) {
              String country = "All";
              if (index != 0) {
                country = countryNames[index - 1];
              }
              return ListTile(
                title: Text(country),
                onTap: () {
                  _filterOption = country;
                  context.read<LocationBloc>().add(FilterLocations(country));
                  Navigator.pop(context);
                },
              );
            },
            shrinkWrap: true,
            itemCount: countryNames.length + 1,
          );
        });
  }
}
