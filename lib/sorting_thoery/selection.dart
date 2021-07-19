import 'package:flutter/material.dart';


class selectionAlgo extends StatefulWidget {
  @override
  _selectionAlgoState createState() => _selectionAlgoState();
}

class ExpansionItem{
  bool isExpanded;
  final String header;
  final String body;

  ExpansionItem({this.isExpanded = false, this.header, this.body});

}

class _selectionAlgoState extends State<selectionAlgo> {
  List<ExpansionItem> items = <ExpansionItem>[
    ExpansionItem(header: 'JAVA', body: 'class SelectionSort \n'
'{ \n'
    'void sort(int arr[]) \n'
    '{ \n'
        'int n = arr.length; \n'
  
        '// One by one move boundary of unsorted subarray \n'
        'for (int i = 0; i < n-1; i++) \n'
        '{  \n'
            '// Find the minimum element in unsorted array \n'
            'int min_idx = i; \n'
            'for (int j = i+1; j < n; j++) \n'
                'if (arr[j] < arr[min_idx]) \n'
                   ' min_idx = j; \n'
  
          
            'int temp = arr[min_idx]; \n'
            'arr[min_idx] = arr[i]; \n'
            'arr[i] = temp; \n'
        '} \n'
    '} \n'
  
    '// Prints the array \n'
    'void printArray(int arr[]) \n'
    '{ \n'
        'int n = arr.length; \n'
        'for (int i=0; i<n; ++i) \n'
            'System.out.print(arr[i]+" "); \n'
        'System.out.println(); \n'
    '} \n'
  
    '// Driver code to test above \n'
    'public static void main(String args[]) \n'
    '{ \n'
        'SelectionSort ob = new SelectionSort(); \n'
        'int arr[] = {64,25,12,22,11}; \n'
        'ob.sort(arr); \n'
        'System.out.println("Sorted array"); \n'
        'ob.printArray(arr); \n'
    '} \n'
'} \n'
 ),
    ExpansionItem(header: 'C', body: '#include <stdio.h> \n'
  
'void swap(int *xp, int *yp) \n'
'{ \n'
    'int temp = *xp; \n'
    '*xp = *yp; \n'
    '*yp = temp; \n'
'} \n'
  
'void selectionSort(int arr[], int n) \n'
'{ \n'
   'int i, j, min_idx; \n'
  
    '// One by one move boundary of unsorted subarray \n'
    'for (i = 0; i < n-1; i++) \n'
    '{ \n'
        '// Find the minimum element in unsorted array \n'
        'min_idx = i; \n'
        'for (j = i+1; j < n; j++) \n'
          'if (arr[j] < arr[min_idx]) \n'
            'min_idx = j; \n'
  
        '// Swap the found minimum element with the first element \n'
        'swap(&arr[min_idx], &arr[i]); \n'
    '} \n'
'} \n' 
  
'/* Function to print an array */ \n'
'void printArray(int arr[], int size) \n'
'{ \n'
    'int i; \n'
    'for (i=0; i < size; i++) \n'
       ' printf("%d ", arr[i]); \n'
    'printf("\n"); \n'
'} \n'
  
'// Driver program to test above functions \n'
'int main() \n'
'{ \n'
    'int arr[] = {64, 25, 12, 22, 11}; \n'
    'int n = sizeof(arr)/sizeof(arr[0]); \n'
    'selectionSort(arr, n); \n'
    'printf("Sorted array: \n"); \n'
    'printArray(arr, n); \n'
    'return 0; \n'
'} \n'
 ),
    ExpansionItem(header: 'PYTHON', body: 'import sys \n'
'A = [64, 25, 12, 22, 11] \n'
  
'# Traverse through all array elements \n'
'for i in range(len(A)): \n'
      
    '# Find the minimum element in remaining \n'
    '# unsorted array \n'
    'min_idx = i \n'
    'for j in range(i+1, len(A)): \n'
        'if A[min_idx] > A[j]: \n'
           ' min_idx = j \n'
              
    '# Swap the found minimum element with \n'
    '# the first element \n'       
    'A[i], A[min_idx] = A[min_idx], A[i] \n'
  
'# Driver code to test above \n'
'print ("Sorted array") \n'
'for i in range(len(A)): \n'
    'print("%d" %A[i]), \n ' )
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
              child: Text(' Selection Sort ',textAlign: TextAlign.center ,style: TextStyle(fontFamily: 'Quantico',fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple), ),
            ),
          ),
          Text(' Definition ', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
          Container(
            padding: EdgeInsets.all(13),
            child: Text('selection sort is an in-place comparison sorting algorithm. It has an O(n2) time complexity, which makes it inefficient on large lists, and generally performs worse than the similar insertion sort. Selection sort is noted for its simplicity and has performance advantages over more complicated algorithms in certain situations, particularly where auxiliary memory is limited.', textAlign: TextAlign.left,style: TextStyle(fontSize: 16  ))
          ),
          Text(' Algorithm ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text('selectionSort(array, size) \n'
  'repeat (size - 1) times \n'
  'set the first unsorted element as the minimum \n'
  'for each of the unsorted elements \n'
    'if element < currentMinimum \n'
      'set element as new minimum \n'
  'swap minimum with first unsorted position \n'
'end selectionSort \n', style: TextStyle(fontSize: 16  )) 
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
                      "https://www.geeksforgeeks.org/selection-sort/ \n"
                      "https://en.wikipedia.org/wiki/Selection_sort \n"
           ,  style: TextStyle(fontSize: 10, color: Colors.grey), ),
        )
  

          ],
          
          ),
          
        ),
      )
    );
  }
}