import 'package:firebase_database/firebase_database.dart';

class Question {
  final int id, answer;
  final String question;
  final List<dynamic> options;

  Question({this.id, this.question, this.answer, this.options});
}

final databaseReference = FirebaseDatabase.instance.reference();
List sample_data = [];
String chosen_category = "";
dynamic chemistry_category = {};
dynamic physic_category = {};
dynamic history_category = {};


Future<void> getList(category) async {
  chosen_category = category;
  var snapshot = await databaseReference.child(category).once();
  sample_data = new List.from(snapshot.value);
  sample_data.removeAt(0);
}

void getQuestionState(category) {
  databaseReference.child(category).once().then((DataSnapshot snapshot) {
    if(category == "chemistry_state") {
      chemistry_category = snapshot.value;
    }
    if(category == "physic_state") {
      physic_category = snapshot.value;
    }
    if(category == "history_state") {
      history_category = snapshot.value;
    }
  });
}

