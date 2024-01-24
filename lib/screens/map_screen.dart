import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../app_constants.dart';
import '../data/data_provider.dart';
import '../data/data_repo.dart';
import '../model/business_near_by.dart';
import 'list_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markerList = [];
  Set<Marker> markerSet = {};
  late BusinessNearBy response;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    MapDataProvider mapDataProvider = MapDataProvider();
    MapRepository mapRepository = MapRepository();

    response = await mapRepository.getNearByPlaces(mapDataProvider);

    if (response.places != null) {
      for (int i = 0; i < response.places!.length; i++) {
        var item = response.places![i];
        markerList.add(
          Marker(
            markerId: MarkerId(item.displayName!.text.toString()),
            position:
                LatLng(item.location!.latitude!, item.location!.longitude!),
            infoWindow: InfoWindow(
              title: item.displayName!.text.toString(),
              snippet: item.formattedAddress.toString(),
            ),
          ),
        );
      }
      setState(() {
        markerSet = Set<Marker>.from(markerList);
        markerSet.add(
          Marker(
            markerId: MarkerId("current Location"),
            position: center,
            infoWindow: InfoWindow(
              title: "My Location",
              snippet: "i'm here",
            ),
          ),
        );
      });
    }

    debugPrint(markerSet.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Sample App'),
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BusinessListScreen(
                        businessNearBy: response,
                      )));
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 11.0,
          ),
          markers: markerSet),
    );
  }
}
