import 'package:evaltech_mobile/Theme/text_theme.dart';
import 'package:evaltech_mobile/models/ClassRoom.dart';
import 'package:evaltech_mobile/screens/Classroom/ClassroomScreen.dart';
import 'package:evaltech_mobile/screens/Home/GetRatings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/provider.dart';
import '../../models/Item.dart';

class ClassroomList extends StatefulWidget {
  final Classroom classroom;

  const ClassroomList({required this.classroom});

  @override
  State<ClassroomList> createState() => _ClassroomListState();
}

class _ClassroomListState extends State<ClassroomList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ClassroomState>(context, listen: false)
            .setGlobalClassroom(widget.classroom);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClassroomScreen(),
          ),
        );
      },
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 12.0,
              child: Image.asset(
                widget.classroom.trailerImg1!,
                fit: BoxFit.fill,
              ),
            ),
            // ignore: unnecessary_new
            new Padding(
              padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(widget.classroom.name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextTheme.gridlisttitle),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(widget.classroom.category!, style: AppTextTheme.caption),
                  SizedBox(height: 2.0),
                  Center(child: GetRatings()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderContent extends StatelessWidget {
  final Item classroom;

  HeaderContent(this.classroom);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(classroom.name,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.gridlisttitle),
                  Text(
                    classroom.category,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 9.0,
                    ),
                  ),
                  GetRatings(),
                  MovieDesc(this.classroom),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDesc extends StatelessWidget {
  final Item classroom;

  MovieDesc(this.classroom);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'RELEASE DATE:',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  classroom.releaseDate,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                Text(
                  'RUNTIME:',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  classroom.runtime,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
