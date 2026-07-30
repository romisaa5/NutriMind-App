import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore;

  FirestoreService(this.firestore);

  Future<void> set({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(collection).doc(documentId).set(data);
  }

  Future<void> update({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(collection).doc(documentId).update(data);
  }

  Future<void> delete({
    required String collection,
    required String documentId,
  }) async {
    await firestore.collection(collection).doc(documentId).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDocument({
    required String collection,
    required String documentId,
  }) {
    return firestore.collection(collection).doc(documentId).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(String collection) {
    return firestore.collection(collection).get();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamDocument({
    required String collection,
    required String documentId,
  }) {
    return firestore.collection(collection).doc(documentId).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamCollection(
    String collection,
  ) {
    return firestore.collection(collection).snapshots();
  }
}
