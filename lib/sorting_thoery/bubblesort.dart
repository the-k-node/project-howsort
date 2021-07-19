
import 'package:flutter/material.dart';


class bubbleAlgo extends StatefulWidget {
  @override
  _bubbleAlgoState createState() => _bubbleAlgoState();
}

class ExpansionItem{
  bool isExpanded;
  final String header;
  final String body;

  ExpansionItem({this.isExpanded = false, this.header, this.body});

}

class _bubbleAlgoState extends State<bubbleAlgo> {
  List<ExpansionItem> items = <ExpansionItem>[
    ExpansionItem(header: 'JAVA', body: 'class BubbleSort \n'
              '{ \n'
              'void bubbleSort(int arr[]) \n'
              '{ \n'
              'int n = arr.length; \n'
              'for (int i = 0; i < n-1; i++) \n'
              'for (int j = 0; j < n-i-1; j++) \n'
              'if (arr[j] > arr[j+1]) \n'
                  '{ \n'
                  '// swap temp and arr[i] \n'
                  'int temp = arr[j]; \n'
                  ' arr[j] = arr[j+1]; \n'
                  'arr[j+1] = temp; \n'
                  '} \n'
                  '} \n'
 
                  '/* Prints the array */ \n'
                  'void printArray(int arr[]) \n'
                  '{ \n'
                  'int n = arr.length; \n'
                  'for (int i=0; i<n; ++i) \n'
                  'System.out.print(arr[i] + " "); \n'
                  'System.out.println(); \n'
                   '} \n'
 
                  '// Driver method to test above \n'
                  'public static void main(String args[]) \n'
                  '{ \n'
                  'BubbleSort ob = new BubbleSort(); \n'
                   'int arr[] = {64, 34, 25, 12, 22, 11, 90}; \n'
                   'ob.bubbleSort(arr); \n'
                   'System.out.println("Sorted array"); \n'
                   'ob.printArray(arr); \n'
                    '} \n'
'} \n',
 ),
    ExpansionItem(header: 'C', body: '#include <stdio.h> \n'
  
                 'void swap(int *xp, int *yp) \n'
                  '{ \n'
                  'int temp = *xp; \n'
                  '*xp = *yp ; \n'
                  '*yp = temp; \n'
                  '} \n'
  
                   '// A function to implement bubble sort \n'
                    'void bubbleSort(int arr[], int n) \n' 
                  '{ \n'
                  'int i, j; \n'
                   'for (i = 0; i < n-1; i++) \n'  
  
                 '// Last i elements are already in place \n'   
                'for (j = 0; j < n-i-1; j++) \n'
           'if (arr[j] > arr[j+1]) \n'
              'swap(&arr[j], &arr[j+1]); \n'
                '} \n'
  
                 '/* Function to print an array */ \n'
             'void printArray(int arr[], int size) \n'
                    '{ \n'
                'int i; \n'
                'for (i=0; i < size; i++) \n'
                'printf("%d ", arr[i]); \n'
                 'printf("\n"); \n'
                '} \n'
  
                  '// Driver program to test above functions \n'
             'int main() \n'
              '{ \n'
             'int arr[] = {64, 34, 25, 12, 22, 11, 90}; \n'
              'int n = sizeof(arr)/sizeof(arr[0]); \n'
              'bubbleSort(arr, n); \n'
             'printf("Sorted array: \n"); \n'
              'printArray(arr, n); \n'
              'return 0; \n'
               '} \n'
 ),
    ExpansionItem(header: 'PYTHON', body: 'def bubbleSort(arr): \n'
    'n = len(arr) \n'
  
    '# Traverse through all array elements \n'
    'for i in range(n): \n'
  
        '# Last i elements are already in place \n'
        'for j in range(0, n-i-1): \n'
  
            '# traverse the array from 0 to n-i-1 \n'
            '# Swap if the element found is greater \n'
            '# than the next element \n'
            'if arr[j] > arr[j+1] : \n'
                'arr[j], arr[j+1] = arr[j+1], arr[j] \n'
  
          '# Driver code to test above \n'
          'arr = [64, 34, 25, 12, 22, 11, 90] \n'
  
           'bubbleSort(arr) \n'
  
           'print ("Sorted array is:") \n'
            'for i in range(len(arr)): \n'
              'print ("%d" %arr[i]) \n' )
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
              padding: const EdgeInsets.all(16.0),
              child: Text(' Bubble Sort ',textAlign: TextAlign.center ,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple, fontFamily: 'Quantico'), ),
            ),
          ),
          Text(' Definition ', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
          Container(
            padding: EdgeInsets.all(13),
            child: Text('Bubble sort, sometimes referred to as sinking sort, is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements and swaps them if they are in the wrong order. The pass through the list is repeated until the list is sorted.', textAlign: TextAlign.left,style: TextStyle(fontSize: 16  ))
          ),
          Text(' Algorithm ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text('begin BubbleSort(list) \n'
            'for all elements of list \n'
             'if list[i] > list[i+1] \n'
              'swap(list[i], list[i+1]) \n'
               'end if \n'
                'end for \n'
                 'return list end BubbleSort \n', style: TextStyle(fontSize: 16  ))
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
                      "https://www.geeksforgeeks.org/bubble-sort \n"
                      "https://en.wikipedia.org/wiki/Bubble_sort \n"
           ,  style: TextStyle(fontSize: 10, color: Colors.grey), ),
        )
  

          ],
          
          ),
          
        ),
      )
    );
  }
}



