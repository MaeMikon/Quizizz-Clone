import 'package:firebase_database/firebase_database.dart';

class Question {
  final int id, answer;
  final String question;
  final List<dynamic> options;

  Question({this.id, this.question, this.answer, this.options});
}

final databaseReference = FirebaseDatabase.instance.reference();
List sample_data = [];

Future<void> getList(catergory) async {
  var snapshot = await databaseReference.child(catergory).once();
  sample_data = new List.from(snapshot.value);
  sample_data.removeAt(0);
}