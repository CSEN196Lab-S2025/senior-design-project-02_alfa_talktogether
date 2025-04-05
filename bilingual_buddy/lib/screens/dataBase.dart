import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'student_info.dart';

const String STUDENTID_COLLECTION_REF = "studentID";



class DataBase {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _studentIDRef;
  late final DocumentReference _students;

  DataBase(){
    _studentIDRef = _firestore.collection(STUDENTID_COLLECTION_REF).withConverter<Student>(
      fromFirestore: (snapshots, _) => Student.fromJson(snapshots.data()!,), 
      toFirestore: (Student, _) => Student.toJson());
  }

  Stream<QuerySnapshot> getStudentID(){

    return _studentIDRef.snapshots();
  }

}