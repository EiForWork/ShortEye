class Question {
  final String questionText;
  final List<Answer> answerList;



  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  // Add questions and answers
  list.add(Question(   
    "คุณมีอาการมองเห็นภาพที่ไม่ชัดเจนหรือไม่เมื่อมองไกล?",
    [
      Answer("Yes",false),
      Answer("No",true),
    ],
  
  )); //1

  list.add(Question(
    "คุณรู้สึกตาเมื่อยหรือไม่เมื่อใช้สายตาเป็นเวลานาน?",
    [
      Answer("Yes", false),
      Answer("No", true),
    ],
   
  ));// 2

  list.add(Question(
    "คุณมีอาการที่รู้สึกว่าต้องหลิมตาเพื่อมองเห็นชัดเจนมากขึ้นหรือไม่?",
    [
      Answer("Yes", false),
      Answer("No", true),
    ],
   
  ));// 3

  list.add(Question(
    "คุณมีอาการเวียนวนหรือเปลี่ยนแปลงจากมุมมองที่ต่างกันอยู่บ่อยครั้งหรือไม่?",
    [
      Answer("Yes", false),
      Answer("No", true),
    ],
  ));// 4

  list.add(Question(
    "คุณรู้สึกตาพร่ามัวหรือมัวเมื่อเริ่มต้นใช้สายตาในตอนเช้าหรือตอนเย็น?",
    [
      Answer("Yes", false),
      Answer("No", true),
    ],
  ));// 5

  list.add(Question(
    "คุณรู้สึกตาแห้งหรือไม่เมื่อใช้สายตาเป็นเวลานาน?",
    [
      Answer("Yes", false),
      Answer("No", true),
    ],
  ));//6 

    list.add(Question(
    "คุณมีอาการอ่านหนังสือชิดตามากผิดปกติไหม",
    [
      Answer("Yes", false),
      Answer("No", true),
    ],
  ));//7 

  list.add(Question(
    "ขยี้ตาบ่อยๆเมื่อเพ่งมอง",
    [
      Answer("Yes", false),
      Answer("No", true),
    ],
  ));//8 



  return list;
}
