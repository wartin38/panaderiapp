// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'dart:io';

// class Item {
//   final String title;
//   final String description;
//   final double price;
//   final String imageUrl;
//   final DateTime creationDate;
//   final DateTime updateDate;
//   DocumentReference? reference;
//   File? imageFile;
//   XFile? _pickedFile;
//   final ImagePicker _picker = ImagePicker();

//   Item(
//       {required this.title,
//       required this.description,
//       required this.price,
//       required this.imageUrl,
//       required this.creationDate,
//       required this.updateDate,
//       this.reference});

//   factory Item.fromJson(Map<dynamic, dynamic> json) => Item(
//       title: json['title'] as String,
//       description: json['description'] as String,
//       price: json['price'] as double,
//       imageUrl: json['imageUrl'] as String,
//       creationDate: DateTime.parse(json['creationDate'] as String),
//       updateDate: DateTime.parse(json['updateDate'] as String));

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'title': title,
//         'description': description,
//         'price': price,
//         'imageUrl': imageUrl,
//         'creationDate': creationDate.toString(),
//         'updateDate': updateDate.toString()
//       };

//   factory Item.fromSnapshot(DocumentSnapshot snapshot) {
//     final item = Item.fromJson(snapshot.data() as Map<String, dynamic>);
//     item.reference = snapshot.reference;
//     return item;
//   }

//   // NOTA: Mejor pasar estos tres métodos al wigdet.
//   Future<void> retrieveLostData() async {
//     final LostDataResponse response = await _picker.retrieveLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     if (response.file != null) {
//       _pickedFile = response.file;
//       // // TODO: Poner los setStates también en el widget donde se van a utilizar
//       // setState(() {
//       //   _pickedFile = response.file;
//       // });
//     }
//   }

//   Future<void> getFromGallery() async {
//     _pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//       // maxHeight: 480,
//       // maxWidth: 480,
//       imageQuality: 15,
//     );
//     await retrieveLostData();
//     // setState(() {
//     //   imageFile = File(pickedFile!.path);
//     // });
//     await cropper(_pickedFile!.path);
//     // // TODO: Este método lo ponemos ya en el widget donde se van a utilizar
//     // Navigator.canPop(context) ? Navigator.pop(context) : null;
//   }

//   Future<void> cropper(filePath) async {
//     File? croppedImage = await ImageCropper.cropImage(
//         sourcePath: filePath,
//         // maxHeight: 480,
//         // maxWidth: 480,
//         compressQuality: 15);
//     if (croppedImage != null) {
//       imageFile = croppedImage;
//       // // TODO: Poner los setStates también en el widget donde se va a utilizar
//       // setState(() {
//       //   imageFile = croppedImage;
//       // });
//     }
//   }
// }
