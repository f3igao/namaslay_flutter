import 'package:flutter/material.dart';
import 'package:namaslay_flutter/controller/workout_controller.dart';
import 'package:namaslay_flutter/shared/poses_list.dart';
import '../shared/hero_header.dart';

class WorkoutPage extends StatefulWidget {
  final Map<String, dynamic> workoutData;
  WorkoutPage({this.workoutData});

  @override
  State<StatefulWidget> createState() {
    return _WorkoutPageState();
  }
}

class _WorkoutPageState extends State<WorkoutPage> {
  bool isPlaying = false;
  String buttonText = 'PLAY';

  void _playWorkout() {
    setState(() {
      isPlaying = !isPlaying;
      buttonText = isPlaying ? 'PAUSE' : 'PLAY';
    });
  }

  @override
  Widget build(BuildContext context) {
    Map sequenceRaw = widget.workoutData['sequence'];
    List<dynamic> sequence = _configureSequence(sequenceRaw);
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: HeroHeader(
              minExtent: 250.0,
              maxExtent: 250.0,
              workoutName: widget.workoutData['name'],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4,
            ),
            delegate: SliverChildListDelegate(
              [
                Container(
                    child: Center(
                        child: Text(
                            widget.workoutData['length'].toString() + ' MIN')),
                    margin: EdgeInsets.only(top: 15.0, right: 60.0)),
                Container(
                    child: Center(child: Text('BEGINNER')),
                    margin: EdgeInsets.only(top: 15.0, left: 60.0)),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                child: Center(
                    child: Text(
                  'Lorem ipsum dolor sit amet, ne quo wisi labore civibus, ex sanctus copiosae qui, cu nec melius tacimates salutandi. Nec oratio possim id, ut dicunt nominavi per. At ius blandit tacimates reprehendunt, quo dictas appetere pertinax ut, et vero aperiam perpetua mea. Cu pro qualisque evertitur, in usu nihil fierent. Est te novum fastidii lucilius, legendos praesent contentiones ad cum. Facete suavitate ut sea, sit te autem mollis sensibus, sea te quis deseruisse. Eos no epicurei incorrupte. Sed verear deserunt id, te affert dicunt mea, cu summo aliquando vix. Vitae vocent vivendum eam eu. Est ne graece debitis, sea et sententiae interpretaris. Modus everti inermis duo in, nec no dictas delicata dissentiunt. Ne usu mutat oratio explicari, altera insolens temporibus id nam.',
                  textAlign: TextAlign.justify,
                )),
                padding: EdgeInsets.all(15.0),
              )
            ],
          )),
          posesList(context, sequence),
        ]),
        WorkoutControl(playWorkout: _playWorkout, text: buttonText)
      ]),
    );
  }
}

List<dynamic> _configureSequence(data) {
  List<dynamic> sequence = [];
  List<dynamic> sections = data.keys.toList();
  sections.sort();
  sections.forEach((section) {
    sequence.addAll(data[section]);
  });
  return sequence;
}
