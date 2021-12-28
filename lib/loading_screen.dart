// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter/material.dart';
// import 'package:coinex/coin_data.dart';
// import 'package:coinex/price_screen.dart';
//
// class Loading_screen extends StatefulWidget {
//   const Loading_screen({Key? key}) : super(key: key);
//
//   @override
//   _Loading_screenState createState() => _Loading_screenState();
// }
//
// class _Loading_screenState extends State<Loading_screen> {
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   void getData() async {
//     Data data = Data();
//     var remoteData = await data.fetchRemoteData();
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => const PriceScreen()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: SpinKitDoubleBounce(
//         color: Colors.white,
//         size: 100.0,
//       ),
//     );
//   }
// }
