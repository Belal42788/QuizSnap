import 'questions.dart';

class AppQuestions {
  final List<Questions> _questionsList = [
    Questions(
      'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
      'assets/images/image-1.jpg',
      true,
    ),
    Questions(
      'القطط هي حيوانات لاحمة',
      'assets/images/image-2.jpg',
      true,
    ),
    Questions(
      'الصين موجودة في القارة الإفريقية',
      'assets/images/image-3.jpg',
      false,
    ),
    Questions(
      'الأرض مسطحة وليست كروية',
      'assets/images/image-4.jpg',
      false,
    ),
    Questions(
      'بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
      'assets/images/image-5.jpg',
      true),
    Questions(
      'الشمس تدور حول الأرض والأرض تدور حول القمر',
      'assets/images/image-6.jpg',
      false
    ),
    Questions(
      'الحيوانات لا تشعر بالألم',
      'assets/images/image-7.jpg',  
      false
    ),
  ];
  int _questionNumber = 0;
  String getQuestionText() {
    return _questionsList[_questionNumber].qustionText;
  }

  String getQuestionImage() {
    return _questionsList[_questionNumber].qustionImage;
  }

  bool getQuestionAnswer() {
    return _questionsList[_questionNumber].answer;
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  void nextQustion() {
    if (_questionNumber < _questionsList.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    return _questionNumber >= _questionsList.length - 1 ? true : false;
  }

  void reset() {
    _questionNumber = 0;
  }
}
