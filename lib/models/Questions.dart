import 'package:firebase_database/firebase_database.dart';

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Vào các quán photocopy bạn ngửi thấy một mùi khí đặc trưng, đó là khí nào?",
    "options": ['CO2', 'O3', 'N2', 'Cl2'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Kim loại nào được Hans Christian Oersted phát hiện vào năm 1825?",
    "options": ['Nhôm', 'Sắt', 'Đồng', 'Bạc'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "Ký hiệu hóa học của bạc là gì?",
    "options": ['Mg', 'Ag', 'Au', 'Al'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Hexaclo xiclohecxan được dùng để:",
    "options": ['Làm thuốc nổ', 'Làm chất xúc tác', 'Làm thuốc trừ sâu', 'Tất cả các đáp án trên'],
    "answer_index": 2,
  },
  
];
