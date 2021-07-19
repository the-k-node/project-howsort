import 'package:flutter/material.dart';

import 'modals.dart';


int nombreTri = 10;
int speed = 100;

const Color primary = Colors.lightBlue;
const Color primaryDark = Colors.black;
const Color accent = Color(0xff8A2BE2);
const Color activeData = Color(0xff1DD75F);
const Color newcolor1 = Color(0xfff46188);
const Color newcolor2 = Color(0xff491d7f);



//AlgorithmTitles
const String bubbleSortTitle = 'Bubble Sort';
const String selectionSortTitle = 'Selection Sort';
const String insertionSortTitle = 'Insertion Sort';

//ComplexityString
const bigOh = 'O';
const logN = 'log(n)';
const nsquare = 'n2';
const logNsquare = 'log(n2)';

//Algorithms
final List<SortingAlgorithm> sortingAlgorithmsList = [
  SortingAlgorithm(
    title: selectionSortTitle,
    complexity: nsquare,
  ),
  SortingAlgorithm(
    title: insertionSortTitle,
    complexity: nsquare,
  ),
  SortingAlgorithm(
    title: bubbleSortTitle,
    complexity: logNsquare,
  ),
];
