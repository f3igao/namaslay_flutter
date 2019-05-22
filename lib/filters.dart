
class Filter {
  const Filter({this.title});
  final String title;
}

const List<Filter> filters = const <Filter>[
  const Filter(title: 'All'),
  const Filter(title: 'Favorites'),
  const Filter(title: 'Recommended'),
  const Filter(title: 'Uplift'),
  const Filter(title: 'Relax'),
  const Filter(title: 'Summer'),
  const Filter(title: 'Stress'),
  const Filter(title: 'Detox'),
];
