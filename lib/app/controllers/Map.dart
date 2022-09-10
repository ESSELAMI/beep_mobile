// // ignore_for_file: file_names

// import 'dart:async';
// import 'package:back_button_interceptor/back_button_interceptor.dart';
// import 'package:beep_mobile/app/models/center/center.dart';
// import 'package:beep_mobile/app/models/wilaya/wilaya.dart';
// import 'package:beep_mobile/app/services/local/user.dart';
// import 'package:beep_mobile/app/services/remote/center.dart';
// import 'package:beep_mobile/base/controllers/map.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:maps_launcher/maps_launcher.dart';

// class MapController extends BaseMapController {
//   List<Wilaya> statesQuery = List.empty();
//   late String stateQuery;
//   late Wilaya pickedState;
//   late int selectedState;
//   late List<Wilaya> states;
//   int indexState = 1;
//   static MapController get to => Get.find();
//   late GoogleMapController mapController;

//   late ThemeData theme;
//   final PageController pageController =
//       PageController(initialPage: 0, viewportFraction: 0.85);
//   int currentPage = 0;
//   int validCenterIndex = 0;
//   late String mainQuery;
//   // Set<Marker> marker = {};
//   List<Marker> marker = [];
//   List<Centre> centers = [];
//   List<Centre> mainListQuery = [];
//   List<Centre> validCenters = [];
//   String userCenter = "";
//   double initPosLat = 36.77719847485915;
//   double initPosLong = 3.0541516163665237;
//   bool isLoading = false;
//   bool isok = false;
//   @override
//   void onInit() async {
//     BackButtonInterceptor.add(myInterceptor, name: "map");
//     pickedState = Wilaya();
//     states = Wilaya().getWilayas();
//     statesQuery = states;
//     UserLocalService().getUser().then((user) {
//       isLoading = true;
//       change(isLoading, status: RxStatus.success());
//       userCenter = user!.center.toString();
//       CentreService().getCentres().then((value) {
//         if (value != null) {
//           centers = value;
//           centers.asMap().forEach((index, center) {
//             if (center.latitude != null &&
//                 center.latitude!.isNotEmpty &&
//                 center.latitude != "null") {
//               if (isNumeric(center.longitude!) && isNumeric(center.latitude!)) {
//                 validCenters.add(center);
//                 if (center.code != null) {
//                   if (center.code.toString().substring(1, 3).toString() ==
//                       userCenter.toString().substring(1, 3).toString()) {
//                     mainListQuery.add(center);
//                     marker.add(
//                       Marker(
//                         flat: true,
//                         icon: center.code == userCenter
//                             // icon: index == validCenters.indexOf(center)
//                             ? BitmapDescriptor.defaultMarkerWithHue(200)
//                             : BitmapDescriptor.defaultMarker,
//                         markerId: MarkerId(center.code.toString()),
//                         position: LatLng(double.parse(center.latitude!),
//                             double.parse(center.longitude!)),
//                         infoWindow: InfoWindow(
//                           title: center.name.toString(),
//                           snippet: center.address.toString(),
//                           onTap: () {
//                             MapsLauncher.launchCoordinates(
//                                 double.parse(center.latitude!),
//                                 double.parse(center.longitude!),
//                                 center.name.toString());
//                           },
//                         ),
//                         onTap: () {
//                           onMarkerTap(mainListQuery.indexOf(center));
//                         },
//                       ),
//                     );
//                   }
//                 }

//                 if (center.code == userCenter) {
//                   initPosLat = double.parse(center.latitude!);
//                   initPosLong = double.parse(center.longitude!);
//                   onMarkerTap(getIndex(center.code.toString()));
//                 }
//                 validCenterIndex = validCenterIndex + 1;
//               }
//             }
//           });
//           isLoading = false;
//           // mainListQuery = validCenters;
//           change(centers, status: RxStatus.success());
//         } else {
//           isLoading = false;
//           change(isLoading, status: RxStatus.empty());
//         }
//       });
//     });

//     change(currentPage, status: RxStatus.success());
//     super.onInit();
//   }

//   Future<void> loadData() async {
//     Timer(const Duration(milliseconds: 500), () {
//       statesQuery = states;

//       selectedState = states
//           .indexWhere((state) => state.code.toString() == pickedState.code);

//       isok = true;
//       change(selectedState, status: RxStatus.success());
//     });
//     isok = false;
//   }

//   changeState(int index) {
//     selectedState = index;

//     // pickedState = statesQuery[index];

//     states.asMap().forEach((indexValue, value) {
//       if (value.code == state.toString()) {
//         indexState = indexValue;
//       }
//     });

//     change(selectedState, status: RxStatus.success());
//   }

//   void searchState(String query) {
//     selectedState = -1;
//     List<Wilaya> statesQuery1;
//     statesQuery1 = states.where((element) {
//       final titleLower = element.nomFr?.toLowerCase();
//       final searchLower = query.toLowerCase();

//       return titleLower!.contains(searchLower);
//     }).toList();

//     stateQuery = query;
//     statesQuery = statesQuery1;
//     change(statesQuery, status: RxStatus.success());
//   }

//   void apply() {
//     if (selectedState == -1) {
//     } else {
//       pickedState = statesQuery[selectedState];
//       change(pickedState, status: RxStatus.success());
//       List<Centre> tempListQuery = List.empty();
//       // validCenters= validCenters.where((center) =>
//       //     center.code.toString().substring(1, 3).toString() ==
//       //     pickedState.code.toString());
//       tempListQuery = validCenters.where((element) {
//         if (element.code != null) {
//           return element.code.toString().substring(1, 3).toString() ==
//               pickedState.code.toString();
//         } else {
//           return false;
//         }
//       }).toList();

//       // mainListQuery.clear();
//       mainListQuery = (tempListQuery);
//       marker.clear();

//       mainListQuery.asMap().forEach((index, center) {
//         if (center.latitude != null &&
//             center.latitude!.isNotEmpty &&
//             center.latitude != "null") {
//           if (isNumeric(center.longitude!) && isNumeric(center.latitude!)) {
//             // validCenters.add(center);
//             marker.add(
//               Marker(
//                 flat: true,
//                 icon: BitmapDescriptor.defaultMarker,
//                 markerId: MarkerId(center.code.toString()),
//                 position: LatLng(double.parse(center.latitude!),
//                     double.parse(center.longitude!)),
//                 infoWindow: InfoWindow(
//                   title: center.name.toString(),
//                   snippet: center.address.toString(),
//                   onTap: () {
//                     MapsLauncher.launchCoordinates(
//                         double.parse(center.latitude!),
//                         double.parse(center.longitude!),
//                         center.name.toString());
//                   },
//                 ),
//                 onTap: () {
//                   onMarkerTap(mainListQuery.indexOf(center));
//                 },
//               ),
//             );
//           }
//         }
//       });
//       onMarkerTap(0);
//       change(mainListQuery, status: RxStatus.success());
//     }
//   }

//   void searchMain(String query) {
//     pickedState = Wilaya();
//     changeState(-1);
//     List<Centre> tempListQuery = List.empty();
//     // validCenters= validCenters.where((center) =>
//     //     center.code.toString().substring(1, 3).toString() ==
//     //     pickedState.code.toString());
//     tempListQuery = validCenters.where((element) {
//       if (element.name != null) {
//         final titleLower =
//             element.name!.toLowerCase() + " " + element.address!.toLowerCase();

//         final searchLower = query.toLowerCase();
//         return titleLower.contains(searchLower);
//       } else {
//         return false;
//       }
//     }).toList();
//     mainQuery = query;
//     // mainListQuery.clear();
//     mainListQuery = (tempListQuery);
//     marker.clear();

//     mainListQuery.asMap().forEach((index, center) {
//       if (center.latitude != null &&
//           center.latitude!.isNotEmpty &&
//           center.latitude != "null") {
//         if (isNumeric(center.longitude!) && isNumeric(center.latitude!)) {
//           // validCenters.add(center);
//           marker.add(
//             Marker(
//               flat: true,
//               icon: BitmapDescriptor.defaultMarker,
//               markerId: MarkerId(center.code.toString()),
//               position: LatLng(double.parse(center.latitude!),
//                   double.parse(center.longitude!)),
//               infoWindow: InfoWindow(
//                 title: center.name.toString(),
//                 snippet: center.address.toString(),
//                 onTap: () {
//                   MapsLauncher.launchCoordinates(double.parse(center.latitude!),
//                       double.parse(center.longitude!), center.name.toString());
//                 },
//               ),
//               onTap: () {
//                 onMarkerTap(mainListQuery.indexOf(center));
//               },
//             ),
//           );
//         }
//       }
//     });
//     change(mainListQuery, status: RxStatus.success());
//   }

//   void changePage() {
//     // final thenTo =
//     //     Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
//     // Get.rootDelegate.toNamed(thenTo ?? Routes.HOME);

//     // final thenTo =
//     //     Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
//     Get.rootDelegate.history.removeLast();

//     Get.rootDelegate.offNamed(Get.rootDelegate
//         .history[Get.rootDelegate.history.length - 1].currentPage!.name
//         .toString());
//   }

//   onMarkerTap(int position) {
//     if (currentPage < marker.length) {
//       marker[currentPage] = marker[currentPage].copyWith(
//           iconParam:
//               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
//     }

//     currentPage = position;

//     // mainListQuery = validCenters;

// //changing page with animation
//     // pageController.animateToPage(
//     //   currentPage,
//     //   duration: const Duration(milliseconds: 800),
//     //   curve: Curves.ease,
//     // );

//     // changing page without animation
//     pageController.jumpToPage(position);
//     marker[position] = marker[position]
//         .copyWith(iconParam: BitmapDescriptor.defaultMarkerWithHue(200));
//     mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//         target: marker.toList()[position].position, zoom: 10.5)));
//     change(currentPage, status: RxStatus.success());
//   }

//   onPageChange(int position) {
//     if (currentPage < marker.length) {
//       marker[currentPage] = marker[currentPage].copyWith(
//           iconParam:
//               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
//     }
//     currentPage = position;

//     mapController
//         .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//             target: marker.toList()[position].position, zoom: 10.5)))
//         .then((value) {
//       marker[position] = marker[position]
//           .copyWith(iconParam: BitmapDescriptor.defaultMarkerWithHue(200));
//       change(currentPage, status: RxStatus.success());
//     });
//   }

//   void onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//     change(mapController, status: RxStatus.success());
//   }

//   bool isNumeric(String s) {
//     if (s.isEmpty) {
//       return false;
//     }
//     return double.tryParse(s) != null;
//   }

//   int getIndex(String code) {
//     return mainListQuery.indexWhere((element) => element.code == code);
//   }

//   bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
//     changePage();
//     return true;
//   }

//   @override
//   void onClose() {
//     BackButtonInterceptor.removeByName("map");
//     super.onClose();
//   }
// }
