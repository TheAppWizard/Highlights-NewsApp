class Topics {
  static const world = Topic('World');
  static const nation = Topic('Nation');
  static const business = Topic('Business');
  static const technology = Topic('Technology');
  static const entertainment = Topic('Entertainment');
  static const science = Topic('Science');
  static const sports = Topic('Sports');
  static const health = Topic('Health');
  static const politics = Topic('Politics');
  static const education = Topic('Education');
  static const lifestyle = Topic('Lifestyle');
}

class Topic {
  final String value;

  const Topic(this.value);
}


List<Topic> topicList = [
  Topics.world,
  Topics.nation,
  Topics.business,
  Topics.technology,
  Topics.entertainment,
  Topics.science,
  Topics.sports,
  Topics.health,
  Topics.politics,
  Topics.education,
  // Topics.lifestyle,
];