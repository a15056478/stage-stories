import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:stage_stories/main.dart';
import 'package:stage_stories/core/model/error/api_response_error.dart';
import 'package:stage_stories/core/model/story/user_stories.dart';

/// FirebaseConfig class to handle database operations on Firestore
class FierbaseConfig {
  // Intsantiating database
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<Either<ApiReponseError, List<UserStories>>> getUserStories() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      List<UserStories> userProfiles = querySnapshot.docs.map((doc) {
        return UserStories.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      dPrint(userProfiles);
      return Right(userProfiles);
    } catch (e) {
      return Left(ApiReponseError(message: 'Something went wrong!!'));
    }
  }
}
