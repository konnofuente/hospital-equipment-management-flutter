import 'package:flutter/material.dart';

import '../models/ClassRoom.dart';
import '../models/ClassRoom.dart';
import '../models/Document.dart';
import '../widget/chat_widget/widget_chat_item.dart';

class DB {
  // ignore: non_constant_identifier_names
  final List<Classroom> ClassroomList = [
    Classroom(
        id: 3,
        name: 'ICT',
        category: 'Plus de 550 QCM ',
        desc: 'Thor is imprisoned on the planet Sakaar, and must '
            'and ruthless villain Hela.',
        rating: 7.9,
        directors: 'Teacher: Taika Waititi',
        releaseDate: '3 November 2017',
        releaseDateDesc: 'USA (2017), 2h 10min',
        runtime: '2h 10min',
        bannerUrl: 'assets/Images/ict_back.png',
        imageUrl: 'assets/Images/ic_preview_4.png',
        trailerImg1: 'assets/Images/ict.png',
        quizImg: 'assets/Images/quiz.png',
        quizText: ''),
    Classroom(
        id: 4,
        name: 'Geography ',
        category: 'Plus de 550 QCM ',
        desc: 'Thor is imprisoned on the planet Sakaar, and must '
            'and ruthless villain Hela.',
        rating: 7.9,
        directors: 'Teacher: Taika Waititi',
        releaseDate: '3 November 2017',
        releaseDateDesc: 'USA (2017), 2h 10min',
        runtime: '2h 10min',
        bannerUrl: 'assets/Images/geography_back.png',
        imageUrl: 'assets/Images/ic_preview_4.png',
        trailerImg1: 'assets/Images/ict.png',
        quizImg: 'assets/Images/quiz.png',
        quizText: ''),
    Classroom(
        id: 5,
        name: 'Physics ',
        category: 'Plus de 550 QCM ',
        desc: 'Thor is imprisoned on the planet Sakaar, and must '
            'and ruthless villain Hela.',
        rating: 7.9,
        directors: 'Teacher: Taika Waititi',
        releaseDate: '3 November 2017',
        releaseDateDesc: 'USA (2017), 2h 10min',
        runtime: '2h 10min',
        bannerUrl: 'assets/Images/physics_back.png',
        imageUrl: 'assets/Images/ic_preview_4.png',
        trailerImg1: 'assets/Images/ict.png',
        quizImg: 'assets/Images/quiz.png',
        quizText: ''),
  ];

  List<Document> documents = [
    Document(
      title: "Introduction to ICT and Various Notions",
      subtitle: "Here is list 1 subtitle",
      url: "/assets/pdf/physics.pdf",
      icon: Icon(Icons.picture_as_pdf),
      isLocked: false,
    ),
    Document(
      title: "Chapter 2: A Large View",
      subtitle: "Here is list 2 subtitle",
      url: "/assets/pdf/ict.pdf",
      icon: Icon(Icons.picture_as_pdf),
      isLocked: true,
    ),
    Document(
      title: "What is chemistry",
      subtitle: "Here is list 2 subtitle",
      url: "/assets/pdf/chemistry.pdf",
      icon: Icon(Icons.picture_as_pdf),
      isLocked: true,
    ),
    Document(
      title: "What is Geography",
      subtitle: "Here is list 2 subtitle",
      url: "/assets/pdf/geography.pdf",
      icon: Icon(Icons.picture_as_pdf),
      isLocked: true,
    ),
  ];

  List<Widget> chatItemList = [
    // ChatItems(
    //     "Quiche Hollandaise",
    //     "this is some text message which is sent by the user mentioned",
    //     1,
    //     "15 min",
    //     true),
    ChatItems(
        "Chemistry Class",
        "Have you guys finish all assignment",
        0,
        "32 min",
        false),
    ChatItems("Physics class", "this is ", 10, "49 min", true),
    ChatItems(
        "Mathematic Class ",
        "this is some text message which is sent by the user mentioned",
        0,
        "5 hour",
        true),
    ChatItems(
        "Geography class",
        "this is some text message which is sent by the user mentioned",
        0,
        "Mon",
        false),
  
  ];

}
