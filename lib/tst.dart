// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pixabay Gallery',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: const MyHomePage(title: 'Pixabay Gallery'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Map<String, dynamic>> _images = {};

//   @override
//   void initState() {
//     super.initState();
//     _fetchImages();
//   }

//   Future<void> _fetchImages() async {
//     final response = await http.get(Uri.parse(
//         'https://pixabay.com/api/?key=37775942-8c9d29341ec492be8cdeb5544')); // Replace YOUR_API_KEY with your actual Pixabay API key
//     if (response.statusCode == 200) {
//       final decodedResponse = json.decode(response.body);
//       setState(() {
//         _images = List<Map<String, dynamic>>.from(decodedResponse['hits']);
//       });
//     } else {
//       throw Exception('Failed to load images');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: _images.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: MediaQuery.of(context).size.width ~/ 150,
//                 crossAxisSpacing: 4.0,
//                 mainAxisSpacing: 4.0,
//               ),
//               itemCount: _images.length,
//               itemBuilder: (context, index) {
//                 final image = _images[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => FullScreenImagePage(
//                           imageUrl: image['largeImageURL'],
//                           likes: image['likes'],
//                           views: image['views'],
//                         ),
//                       ),
//                     );
//                   },
//                   child: GridTile(
//                     footer: GridTileBar(
//                       backgroundColor: Colors.black54,
//                       title: Text('Likes: ${image['likes']}'),
//                       subtitle: Text('Views: ${image['views']}'),
//                     ),
//                     child: Image.network(
//                       image['previewURL'],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

// class FullScreenImagePage extends StatelessWidget {
//   final String imageUrl;
//   final int likes;
//   final int views;

//   const FullScreenImagePage({
//     super.key,
//     required this.imageUrl,
//     required this.likes,
//     required this.views,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Center(
//           child: Image.network(
//             imageUrl,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.black54,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Likes: $likes',
//                   style: const TextStyle(color: Colors.white)),
//               Text('Views: $views',
//                   style: const TextStyle(color: Colors.white)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
