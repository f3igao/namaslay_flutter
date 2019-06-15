import 'package:flutter/material.dart';
import '../shared/hero_header.dart';

class WorkoutPage extends StatelessWidget {
  final String workoutName;
  WorkoutPage(this.workoutName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: HeroHeader(
              minExtent: 250.0,
              maxExtent: 250.0,
              workoutName: workoutName,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5,
            ),
            delegate: SliverChildListDelegate(
              [
                Container(
                    child: Center(child: Text('60MIN')),
                    margin: EdgeInsets.only(top: 10.0)),
                Container(
                    child: Center(child: Text('BEGINNER')),
                    margin: EdgeInsets.only(top: 10.0)),
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
                  child: Center(child: Text('POSTURE 123')),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(width: 1.0, color: Colors.white),
                  ),
                );
              },
              childCount: 30,
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

