import 'package:flutter/material.dart';
import 'package:namaslay_flutter/data/poses_data.dart';
import '../shared/hero_header.dart';

class WorkoutPage extends StatelessWidget {
  final Map<String, dynamic> workoutData;
  WorkoutPage(this.workoutData);

  @override
  Widget build(BuildContext context) {
    Map sequenceRaw = workoutData['sequence'];
    List<dynamic> sequence = _configureSequence(sequenceRaw);
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: HeroHeader(
              minExtent: 250.0,
              maxExtent: 250.0,
              workoutName: workoutData['name'],
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
                        child: Text(workoutData['length'].toString() + ' MIN')),
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
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 5.5,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: Center(child: poseName(sequence[index])),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(width: 1.0, color: Colors.white),
                  ),
                );
              },
              childCount: sequence.length,
            ),
          )
        ]),
        Positioned(
            child: FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.play_arrow),
              label: Text(
                "PLAY",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            top: 220.0,
            left: 130.0,
            width: 150.0,
            height: 60.0)
      ]),
    );
  }
}

Widget poseName(String id) {
  var target = poses.firstWhere((pose) => pose['id'] == id,
      orElse: () => print('Error, pose not found.'));
  return Text(target['name']);
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
