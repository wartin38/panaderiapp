// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'item.dart';

// // Esta clase debe de ser un Provider
// class ItemDao {
//   final CollectionReference collection =
//       FirebaseFirestore.instance.collection('items');

//   void saveItem(Item item) {
//     collection.add(item.toJson());
//   }

//   Stream<QuerySnapshot> getItemStream() {
//     return collection.snapshots();
//   }
// }
