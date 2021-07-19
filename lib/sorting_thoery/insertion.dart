
import 'package:flutter/material.dart';


class insertAlgo extends StatefulWidget {
  @override
  _insertAlgoState createState() => _insertAlgoState();
}

class ExpansionItem{
  bool isExpanded;
  final String header;
  final String body;

  ExpansionItem({this.isExpanded = false, this.header, this.body});

}

class _insertAlgoState extends State<insertAlgo> {
  List<ExpansionItem> items = <ExpansionItem>[
    ExpansionItem(header: 'JAVA', body: ' class InsertionSort { \n'
    '/*Function to sort array using insertion sort*/ \n'
    'void sort(int arr[]) \n'
    '{ \n'
        'int n = arr.length; \n'
        'for (int i = 1; i < n; ++i) { \n'
            'int key = arr[i]; \n'
            'int j = i - 1; \n'

            'while (j >= 0 && arr[j] > key) { \n'
                'arr[j + 1] = arr[j]; \n'
                'j = j - 1; \n'
           ' } \n'
            'arr[j + 1] = key; \n'
        '} \n'
   ' } \n'
 
    'static void printArray(int arr[]) \n'
    '{ \n'
        'int n = arr.length; \n'
        'for (int i = 0; i < n; ++i) \n'
            'System.out.print(arr[i] + " "); \n'
 
        'System.out.println(); \n'
    '} \n'

    'public static void main(String args[]) \n'
    '{ \n'
       ' int arr[] = { 12, 11, 13, 5, 6 }; \n'
 
        'InsertionSort ob = new InsertionSort(); \n'
        'ob.sort(arr); \n'
 
        'printArray(arr); \n'
    '} \n'
'}  \n', 
 ),
    ExpansionItem(header: 'C', body: '#include <math.h> \n'
'#include <stdio.h> \n'
 

'void insertionSort(int arr[], int n) \n'
'{ \n'
    'int i, key, j; \n'
    'for (i = 1; i < n; i++) { \n'
        'key = arr[i]; \n'
        'j = i - 1; \n'

        'while (j >= 0 && arr[j] > key) { \n'
           ' arr[j + 1] = arr[j]; \n'
            'j = j - 1; \n'
        '} \n'
        'arr[j + 1] = key; \n'
    '}'
'} \n'
 
'// A utility function to print an array of size n \n'
'void printArray(int arr[], int n) \n'
'{  \n'
    'int i; \n'
    'for (i = 0; i < n; i++) \n'
        'printf("%d ", arr[i]); \n'
    'printf("\n"); \n'
'} \n'
 

'int main() \n'
'{ \n'
    'int arr[] = { 12, 11, 13, 5, 6 }; \n'
    'int n = sizeof(arr) / sizeof(arr[0]); \n'
    'insertionSort(arr, n); \n'
    'printArray(arr, n); \n'
 
    'return 0; \n'
'}\n'
 ),
    ExpansionItem(header: 'PYTHON', body: 'def insertionSort(arr): \n'
 
    '# Traverse through 1 to len(arr) \n'
    'for i in range(1, len(arr)): \n'
 
        'key = arr[i] \n'
 
        '# Move elements of arr[0..i-1], that are \n'
        '# greater than key, to one position ahead \n'
        '# of their current position \n'
        'j = i-1 \n'
        'while j >= 0 and key < arr[j] : \n'
                'arr[j + 1] = arr[j] \n'
                'j -= 1 \n'
       ' arr[j + 1] = key \n'
 
 
'# Driver code to test above \n'
'arr = [12, 11, 13, 5, 6] \n'
'insertionSort(arr) \n'
'for i in range(len(arr)): \n '
    'print ("% d" % arr[i]) \n' )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Align(
          alignment: Alignment.topCenter,
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Insertion Sort ',textAlign: TextAlign.center ,style: TextStyle(fontFamily: 'Quantico',fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple), ),
            ),
          ),
          Text(' Definition ', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
          Container(
            padding: EdgeInsets.all(13),
            child: Text('Insertion sort is a simple sorting algorithm that builds the final sorted array (or list) one item at a time. It is much less efficient on large lists than more advanced algorithms such as quicksort, heapsort, or merge sort. ', textAlign: TextAlign.left,style: TextStyle(fontSize: 16  ))
          ),
          Text(' Algorithm ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(' insertionSort(array) \n'
  'mark first element as sorted \n'
  'for each unsorted element X \n'
    ' extract the element X \n'
    'for j <- lastSortedIndex down to 0 \n'
      'if current element j > X \n'
        'move sorted element to the right by 1 \n'
    'break loop and insert X here \n'
'end insertionSort \n', style: TextStyle(fontSize: 16  ))
          ),
          Text(' Code ',textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
          Container(
              child:
                  ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
            children: items.map((ExpansionItem item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded){
                          return Container(
                            child: Text(item.header)
                          );
                        },
                        isExpanded: item.isExpanded,
                        body: Container(
                          child: Text(item.body),
                        )
                      );
                    }).toList()
                  )
                
              ),
              Align(
          alignment: Alignment.bottomRight,
          child: Text("sources: \n"
                      "https://www.geeksforgeeks.org/insertion-sort \n"
                      "https://en.wikipedia.org/wiki/Insertion_sort \n"
           ,  style: TextStyle(fontSize: 10, color: Colors.grey), ),
        )
  

          ],
          
          ),
          
        ),
      )
    );
  }
}



