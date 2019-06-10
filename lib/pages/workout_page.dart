import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WorkoutPage extends StatelessWidget {
  final String workoutName;
  WorkoutPage(this.workoutName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CustomScrollView(slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: WorkoutHeader(
            // layoutGroup: layoutGroup,
            // onLayoutToggle: onLayoutToggle,
            minExtent: 150.0,
            maxExtent: 250.0,
            workoutName: workoutName,
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5.5,
          ),
          delegate: SliverChildListDelegate(
            [
              Center(child: Text('60MIN')),
              Center(child: Text('DIFFICULT')),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            Container(
              child: Center(child: Text(
                'Lorem ipsum dolor sit amet, ne quo wisi labore civibus, ex sanctus copiosae qui, cu nec melius tacimates salutandi. Nec oratio possim id, ut dicunt nominavi per. At ius blandit tacimates reprehendunt, quo dictas appetere pertinax ut, et vero aperiam perpetua mea. Cu pro qualisque evertitur, in usu nihil fierent. Est te novum fastidii lucilius, legendos praesent contentiones ad cum. Facete suavitate ut sea, sit te autem mollis sensibus, sea te quis deseruisse. Eos no epicurei incorrupte. Sed verear deserunt id, te affert dicunt mea, cu summo aliquando vix. Vitae vocent vivendum eam eu. Est ne graece debitis, sea et sententiae interpretaris. Modus everti inermis duo in, nec no dictas delicata dissentiunt. Ne usu mutat oratio explicari, altera insolens temporibus id nam. Dicta putant dignissim an per, ius congue libris indoctum te, eruditi mediocrem nec et. Pro propriae theophrastus cu, mei feugiat appareat te, ne qui harum aperiam albucius. Ne pri quas partiendo, cum eu modus assueverit, numquam copiosae democritum eu qui. No cum nemore vidisse vituperatoribus. Ea mel esse officiis. Quod corpora epicurei ex nec, ei quas definiebas voluptatibus vel. Mei iusto graecis delicatissimi id, enim illud dicta pro in. Doming detraxit interesset te sit, per te dissentiunt contentiones. Mei aliquip feugiat in, at consulatu comprehensam nec. Modo mollis impetus pro an. Sint laboramus sea ex. Eros animal quo id, est cu modo option assueverit. Impetus philosophia mea id, est ex laoreet honestatis.',
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
      ])),
    );
  }

  // Widget _scrollView(BuildContext context) {
  //   return Container(
  //     childrow: CustomScrollView(
  //       slivers: <Widget>[
  //         SliverPersistentHeader(
  //           pinned: true,
  //           delegate: WorkoutHeader(
  //             // layoutGroup: layoutGroup,
  //             // onLayoutToggle: onLayoutToggle,
  //             minExtent: 150.0,
  //             maxExtent: 250.0,
  //           ),
  //         ),
  // SliverGrid(
  //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
  //     maxCrossAxisExtent: 200.0,
  //     mainAxisSpacing: 0.0,
  //     crossAxisSpacing: 0.0,
  //     childAspectRatio: 0.75,
  //   ),
  //   delegate: SliverChildBuilderDelegate(
  //     (BuildContext context, int index) {
  //       return Text('...');
  //     },
  //     childCount: 2,
  //   ),
  //   (BuildContext context, int index) {
  //     return Container(
  //       alignment: Alignment.center,
  //       padding: _edgeInsetsForIndex(index),
  //       child: Image.asset(
  //         assetNames[index % assetNames.length],
  //       ),
  //     );
  //   },
  //   childCount: assetNames.length * 2
  // ),
  // ),
  //       ],
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Container(
  //           child: CustomScrollView(slivers: <Widget>[
  //     SliverPersistentHeader(
  //       pinned: true,
  //       delegate: WorkoutHeader(
  //         // layoutGroup: layoutGroup,
  //         // onLayoutToggle: onLayoutToggle,
  //         minExtent: 150.0,
  //         maxExtent: 250.0,
  //         workoutName: workoutName,
  //       ),
  //     ),
  //   ])));
  // }
}

class WorkoutHeader implements SliverPersistentHeaderDelegate {
  // final LayoutGroup layoutGroup;
  // final VoidCallback onLayoutToggle;
  final String workoutName;
  double maxExtent;
  double minExtent;

  WorkoutHeader(
      {
      // this.layoutGroup,
      // this.onLayoutToggle,
      this.minExtent,
      this.maxExtent,
      this.workoutName});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/eneko-urunuela-646064-unsplash.jpg',
          fit: BoxFit.cover,
        ),
        // darkens image to make title more apparent
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              // begin: Alignment.topCenter,
              // end: Alignment.bottomCenter,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        // cancel X icon
        Positioned(
            left: 0.0,
            top: 0.0,
            child: SafeArea(
                child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ))),
        // workout title
        Center(
          child: Text(
            workoutName,
            style: TextStyle(fontSize: 36.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}
