class Tour {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;

  Tour({
    this.id,
    this.title,
    this.subtitle,
    this.imageUrl,
    this.description = '',
  });

  static List<Tour> get defaultList => [
        Tour(
          id: 'tour_1',
          title: 'Mountain Mongolia',
          subtitle: 'Extraordinary five star outdoor activities',
          imageUrl: 'assets/tour1.jpg',
          description:
              'Massif of Tsast Uul-Tsambargarev Italians Gianni Pais Becher, Gastone Lorenzini and Elziro Moline climbed in western Mongolia in June and July. In late June, they first...',
        ),
        Tour(
          id: 'tour_2',
          title: 'Lake Hallstat',
          subtitle: 'Well-known by its breath-taking beauty',
          imageUrl: 'assets/tour2.jpg',
          description:
              'Massif of Tsast Uul-Tsambargarev Italians Gianni Pais Becher, Gastone Lorenzini and Elziro Moline climbed in western Mongolia in June and July. In late June, they first...',
        ),
        Tour(
          id: 'tour_3',
          title: 'Lake Hallstat',
          subtitle: 'Well-known by its breath-taking beauty',
          imageUrl: 'assets/tour3.jpg',
          description:
              'Massif of Tsast Uul-Tsambargarev Italians Gianni Pais Becher, Gastone Lorenzini and Elziro Moline climbed in western Mongolia in June and July. In late June, they first...',
        ),
        Tour(
          id: 'tour_4',
          title: 'Lake Hallstat',
          subtitle: 'Well-known by its breath-taking beauty',
          imageUrl: 'assets/tour4.jpg',
          description:
              'Massif of Tsast Uul-Tsambargarev Italians Gianni Pais Becher, Gastone Lorenzini and Elziro Moline climbed in western Mongolia in June and July. In late June, they first...',
        ),
        Tour(
          id: 'tour_5',
          title: 'Mountain Mongolia',
          subtitle: 'Extraordinary five star outdoor activities',
          imageUrl: 'assets/tour1.jpg',
          description:
              'Massif of Tsast Uul-Tsambargarev Italians Gianni Pais Becher, Gastone Lorenzini and Elziro Moline climbed in western Mongolia in June and July. In late June, they first...',
        ),
        Tour(
          id: 'tour_6',
          title: 'Lake Hallstat',
          subtitle: 'Well-known by its breath-taking beauty',
          imageUrl: 'assets/tour2.jpg',
          description:
              'Massif of Tsast Uul-Tsambargarev Italians Gianni Pais Becher, Gastone Lorenzini and Elziro Moline climbed in western Mongolia in June and July. In late June, they first...',
        ),
        Tour(
          id: 'tour_7',
          title: 'Lake Hallstat',
          subtitle: 'Well-known by its breath-taking beauty',
          imageUrl: 'assets/tour3.jpg',
          description:
              'Massif of Tsast Uul-Tsambargarev Italians Gianni Pais Becher, Gastone Lorenzini and Elziro Moline climbed in western Mongolia in June and July. In late June, they first...',
        ),
        Tour(
          id: 'tour_8',
          title: 'Lake Hallstat',
          subtitle: 'Well-known by its breath-taking beauty',
          imageUrl: 'assets/tour4.jpg',
          description:
              'Massif of Tsast Uul-Tsambargarev Italians Gianni Pais Becher, Gastone Lorenzini and Elziro Moline climbed in western Mongolia in June and July. In late June, they first...',
        ),
      ];
}
