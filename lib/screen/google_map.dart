// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class GoolgeMap extends StatefulWidget {
//   const GoolgeMap({Key? key}) : super(key: key);
//
//   @override
//   _GoolgeMapState createState() => _GoolgeMapState();
// }
//
// class _GoolgeMapState extends State<GoolgeMap> {
//   GoogleMapController? _controller;
//
//   get cameraUpdate => null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           TextField(
//             decoration: InputDecoration(hintText: "Search Location"),
//           ),
//           Container(
//             height: 400,
//             child: GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(21.1702, 72.8311),
//               ),
//               mapType: MapType.hybrid,
//               myLocationEnabled: true,
//             ),
//           ),
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {},
//       // ),
//     );
//   }
// }
