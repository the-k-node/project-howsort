import 'package:flutter/material.dart';
import 'package:howsort/visualizer/constants.dart';
import 'package:howsort/Misc/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
  

import 'resulequiz.dart';
import 'quizclass.dart';
import 'package:firebase_auth/firebase_auth.dart';


    
class MyAppQuiz extends StatefulWidget {
  @override
  _MyAppQuizState createState() => _MyAppQuizState();
}

class _MyAppQuizState extends State<MyAppQuiz> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   if( FirebaseAuth.instance.currentUser == null)
     {
       /*Navigator.push(context, MaterialPageRoute(
         builder: (context) => LoginPage(),
       ),   );
       Navigator.of(context).popAndPushNamed("/login");*/
     }
  }
  final _questions = const [
    {
      'questionText': 'Q1. What is the worst case complexity of bubble sort?',
      'answers': [
        {'text': 'O(nlogn)', 'score': 0},
        {'text': 'O(logn)', 'score': 0},
        {'text': ' O(n2)', 'score': 1},
        {'text': 'O(n)', 'score': 0},
      ],
    },
    {
      'questionText': 'Q2. Assume that we use Bubble Sort to sort n distinct elements in ascending order. When does the best case of Bubble Sort occur?',
      'answers': [
        {'text': 'When elements are sorted in descending order', 'score': 0},
        {'text': '	When elements are not sorted by any order', 'score': 0},
        {'text': 'There is no best case for Bubble Sort. It always takes O(n*n) time', 'score': 0},
        {
          'text':
              'When elements are sorted in ascending order',
          'score': 1
        },
      ],
    },
    {
      'questionText': ' Q3.The number of swappings needed to sort the numbers 8, 22, 7, 9, 31, 5, 13 in ascending order, using bubble sort is',
      'answers': [
        {'text': '11', 'score': 0},
        {'text': '10', 'score': 1},
        {'text': '12', 'score': 0},
        {'text': '13', 'score': 0},
      ],
    },
    {
      'questionText': 'Q4. Which of the following sorting algorithms has the lowest worst-case complexity',
      'answers': [
        {'text': 'Merge Sort', 'score': 1},
        {'text': 'Heap sort', 'score': 0},
        {'text': 'Bubble Sort', 'score': 0},
        {'text': 'Insertion Sort', 'score': 0},
      ],
    },
    {
      'questionText':
          'Q5. In a selection sort structure, there is/are?', 'answers': [
        {
          'text': 'Two separate for loops',
          'score': 0,
        },
        { 'text':'Three for loops, all separate', 'score': 0},
        {'text': 'Two for loops, one nested in the othe', 'score': 1},
        {'text': 'A for loop nested inside a while loop', 'score': 1},
      ],
    },
        {
      'questionText':
          'Q6. Which sorting algorithm will take least time when all elements of input array are identical? Consider typical implementations of sorting algorithms.',
      'answers': [
        
        {  'text': 'Insertion', 'score': 1},
        {  'text': 'Heap', 'score': 0}, 
        {  'text': 'Merge', 'score': 0},
        {  'text': 'Selection', 'score': 0},
      ],
    },
    {
      'questionText':
          'Q7. Which of the following examples represent the worst case input for an insertion sort?',
        'answers':   [
        
        {  'text': 'aray sorted in order', 'score': 0},
        {  'text': 'array sorted in reverse order', 'score': 1}, 
        {  'text': 'normal unsorted array', 'score': 0},
        {  'text': 'large array', 'score': 0},
      ],
    },
    {
      'questionText':
          'Q8. Which one of the following in-place sorting algorithms needs the minimum number of swaps?',
        'answers':   [
        
        {  'text': 'Quick', 'score': 0},
        {  'text': 'Insertion', 'score': 0}, 
        {  'text': 'Heap', 'score': 0},
        {  'text': 'Selection', 'score': 1},
      ],
    },
    {
      'questionText':
          'Q9. The given array is arr = {3,4,5,2,1}. The number of iterations in bubble sort and selection sort respectively are?',
        'answers':   [
        
        {  'text': '5 and 4', 'score': 1},
        {  'text': '4 and 5', 'score': 0}, 
        {  'text': '2 and 4', 'score': 0},
        {  'text': '2 and 5', 'score': 0},
      ],
    },
    {
      'questionText':
          '10. What is the advantage of selection sort over other sorting techniques?', 
          'answers':   [
        
        {  'text': 'It requires no additional storage space', 'score': 1},
        {  'text': 'It is scalable', 'score': 0}, 
        {  'text': 'It works best for inputs which are already sorted', 'score': 0},
        {  'text': 'It is faster than any other sorting technique', 'score': 0},
      ],
    },
    {
      'questionText':
          '11. How many passes does an insertion sort algorithm consist of?', 
          'answers':   [
        
        {  'text': 'N', 'score': 0},
        {  'text': 'N-1', 'score': 1}, 
        {  'text': 'N+1', 'score': 0},
        {  'text': 'N^2', 'score': 0},
      ],
    },

    {
      'questionText':
          '12. Which of the following algorithm implementations is similar to that of an insertion sort?', 
          'answers' :  [
        
        {  'text': 'Binary heap', 'score': 1},
        {  'text': 'Quick sort', 'score': 0}, 
        {  'text': 'Merge sort', 'score': 0},
        {  'text': 'Radix sort', 'score': 0},
      ],
    },  
     {
      'questionText':
          '13. What is the average number of inversions in an array of N distinct numbers?', 
          'answers' :  [
        
        {  'text': 'N(N-1)/4', 'score': 1},
        {  'text': 'N(N+1)/2', 'score': 0}, 
        {  'text': 'N(N-1)/2', 'score': 0},
        {  'text': 'N(N-1)/3', 'score': 0},
      ],
    },   
    {
      'questionText':
          '14. Any algorithm that sorts by exchanging adjacent elements require O(N2) on average.', 
          'answers' :  [
        
        {  'text': 'True', 'score': 1},
        {  'text': 'False', 'score': 0}, 
        
      ],
    },   
    {
      'questionText':
          '15. What is the running time of an insertion sort algorithm if the input is pre-sorted?', 
          'answers' :  [
        
        {  'text': 'O(N2)', 'score': 0},
        {  'text': 'O(N log N)', 'score': 0}, 
        {  'text': 'O(N)', 'score': 1}, 
        {  'text': 'O(M log N)', 'score': 0}, 
      ],
    },  
    {
      'questionText':
          '16. Which of the following real time examples is based on insertion sort?' ,
          'answers' :  [
        
        {  'text': 'arranging a pack of playing cards', 'score': 1},
        {  'text': 'database scenarios and distributes scenarios', 'score': 0}, 
        {  'text': 'arranging books on a library shelf', 'score': 0}, 
        {  'text': 'real-time systems', 'score': 0}, 
      ],
    },  
    {
      'questionText':
          '17. What is the best case efficiency of bubble sort in the improvised version?' ,
          'answers' :  [
        
        {  'text': 'O(nlogn)', 'score': 0},
        {  'text': 'O(logn)', 'score': 0}, 
        {  'text': 'O(n)', 'score': 1}, 
        {  'text': 'O(n^2)', 'score': 0}, 
      ],
    },  
    {
      'questionText':
          '18. Which of the following is not an advantage of optimised bubble sort over other sorting techniques in case of sorted elements?' ,
          'answers' :  [
        
        {  'text': 'It is faster', 'score': 0},
        {  'text': 'Consume less memory', 'score': 0}, 
        {  'text': 'Detects wether the input is already sorted', 'score': 1}, 
        {  'text': 'consume less time', 'score': 0}, 
      ],
    },  
    {
      'questionText':
          '19. What is an internal sorting algorithm?' ,
          'answers' :  [
        
        {  'text': 'Algorithm that uses tape or disk during the sort', 'score': 0},
        {  'text': 'Algorithm that involves swapping', 'score': 0}, 
        {  'text': 'Algorithm that consider in ', 'score': 0}, 
        {  'text': 'Algorithm that uses main memory during the sort', 'score': 1}, 
      ],
    },  
    {
      'questionText':
          '20. How many passes are required to sort an array with five elements by using bubble sort algorithm?' ,
          'answers' :  [
        
        {  'text': '0', 'score': 0},
        {  'text': '5', 'score': 0}, 
        {  'text': '4', 'score': 1}, 
        {  'text': '1', 'score': 0}, 
      ],
    },  
  ];
  
  
  var _questionIndex = 0;
  var _totalScore = 0;
 
  
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  
  void _answerQuestion(int score) {
    _totalScore += score;
  
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }
  Future<void> _authDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This email is not registered'),
                Text('Please try with another email ID'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).popAndPushNamed("/login");
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
       appBar: AppBar(
          backgroundColor: newcolor1,
          title: Center(
child: Row(mainAxisAlignment: MainAxisAlignment.center,

children: [
 
     Image.asset("asset/ICON.png",fit: BoxFit.contain,height: 60,),
 
  
], 
),
),),
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
           Align(
          alignment: Alignment.topCenter,
            
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(' Quiz ',textAlign: TextAlign.center ,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple, fontFamily: 'Quantico'), ),
            )
          ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ),
          ] 
        )
        )
        //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
