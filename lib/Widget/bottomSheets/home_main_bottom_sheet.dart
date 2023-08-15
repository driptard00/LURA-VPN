// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CustomBottomSheet extends GetTickerProviderStateMixin {
//   @override
//   _CustomBottomSheetState createState() => _CustomBottomSheetState();
// }
//
// class _CustomBottomSheetState extends State<CustomBottomSheet> {
//   double _currentHeight = 200.0; // Initial height of the bottom sheet
//   double _expandedHeight = 400.0; // Expanded height of the bottom sheet
//
//   AnimationController _animationController = AnimationController(vsync: this);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onVerticalDragUpdate: (details) {
//         Update the height when dragged vertically
//         setState(() {
//           _currentHeight = (_currentHeight - details.delta.dy)
//               .clamp(_expandedHeight, 200.0); // Clamp the height within limits
//         });
//       },
//       onVerticalDragEnd: (details) {
//         // Snap the bottom sheet to either expanded or initial height based on position
//         setState(() {
//           if (_currentHeight > (_expandedHeight + 200.0) / 2) {
//             _currentHeight = _expandedHeight;
//           } else {
//             _currentHeight = 200.0;
//           }
//         });
//       },
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 300),
//         height: _currentHeight,
//         // child: YourContentWidget(), // Replace with your content widget
//       ),
//     );
//   }
// }
