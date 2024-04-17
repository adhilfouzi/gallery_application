// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_masonry_view/flutter_masonry_view.dart';
// import 'package:get/get.dart';

// import '../../viewmodel/repository/pixa_repository.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     List image = [];
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Pixabay",
//           style: TextStyle(
//               color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
//         ),
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             CupertinoIcons.sun_min,
//             color: Colors.black,
//             size: 30,
//           ),
//         ),
//         actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 15,
//         ),
//         child: Column(
//           children: [
//             Container(
//               width: width,
//               height: 50,
//               padding: const EdgeInsets.all(10),
//               decoration: const BoxDecoration(color: Colors.white),
//               child: const Row(
//                 children: [
//                   Icon(Icons.search),
//                   Expanded(
//                       child: Text(
//                     'search..',
//                     style: TextStyle(color: Colors.grey, fontSize: 18),
//                   ))
//                 ],
//               ),
//             ),
//             GetBuilder<PixaRepository>(builder: (controller) {
//                   var imageData = controller.fetchImages();
//               // List image= PixaRepository()
//               return MasonryView(
//                 listOfItem:imageData,
//                 numberOfColumn: 2,
//                 itemBuilder: (index) {
//                   return GestureDetector(
//                     onTap: () {
//                       // Handle image tap
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         image: DecorationImage(
//                           image: NetworkImage(imageData['previewURL']),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       margin: EdgeInsets.all(4),
//                       height: 200, // Set your desired height
//                       // You can adjust the height based on the image aspect ratio
//                     ),
//                   );
//                 },
//               );
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }
