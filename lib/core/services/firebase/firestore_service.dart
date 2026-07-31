import 'package:cloud_firestore/cloud_firestore.dart';

import '../../error/failures.dart';
import '../../utils/app_result.dart';

/// طبقة وسيطة عامة بين التطبيق و Firestore
/// أي Feature (meals, chat, tips) بيستخدم دي بدل ما يتكلم مع Firestore مباشرة
class FirestoreService {
  final FirebaseFirestore _firestore;
  FirestoreService(this._firestore);

  CollectionReference<Map<String, dynamic>> collection(String path) =>
      _firestore.collection(path);

  Future<AppResult<void>> setDoc({
    required String path,
    required String docId,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    try {
      await _firestore
          .collection(path)
          .doc(docId)
          .set(data, SetOptions(merge: merge));
      return const Success(null);
    } on FirebaseException catch (e) {
      return Err(FirestoreFailure(FailureCode.firestoreSaveFailed, e.message));
    } catch (e) {
      return Err(UnknownFailure(e.toString()));
    }
  }

  Future<AppResult<String>> addDoc({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      final ref = await _firestore.collection(path).add(data);
      return Success(ref.id);
    } on FirebaseException catch (e) {
      return Err(FirestoreFailure(FailureCode.firestoreAddFailed, e.message));
    } catch (e) {
      return Err(UnknownFailure(e.toString()));
    }
  }

  Future<AppResult<void>> updateDoc({
    required String path,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(path).doc(docId).update(data);
      return const Success(null);
    } on FirebaseException catch (e) {
      return Err(FirestoreFailure(FailureCode.firestoreUpdateFailed, e.message));
    } catch (e) {
      return Err(UnknownFailure(e.toString()));
    }
  }

  Future<AppResult<void>> deleteDoc({
    required String path,
    required String docId,
  }) async {
    try {
      await _firestore.collection(path).doc(docId).delete();
      return const Success(null);
    } on FirebaseException catch (e) {
      return Err(FirestoreFailure(FailureCode.firestoreDeleteFailed, e.message));
    } catch (e) {
      return Err(UnknownFailure(e.toString()));
    }
  }

  Future<AppResult<T?>> getDoc<T>({
    required String path,
    required String docId,
    required T Function(Map<String, dynamic> data, String id) fromJson,
  }) async {
    try {
      final snap = await _firestore.collection(path).doc(docId).get();
      if (!snap.exists || snap.data() == null) return const Success(null);
      return Success(fromJson(snap.data()!, snap.id));
    } on FirebaseException catch (e) {
      return Err(FirestoreFailure(FailureCode.firestoreFetchFailed, e.message));
    } catch (e) {
      return Err(UnknownFailure(e.toString()));
    }
  }

  Stream<List<T>> streamCollection<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String id) fromJson,
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
  }) {
    Query<Map<String, dynamic>> query = _firestore.collection(path);
    if (queryBuilder != null) query = queryBuilder(query);

    return query.snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => fromJson(doc.data(), doc.id)).toList(),
        );
  }
}