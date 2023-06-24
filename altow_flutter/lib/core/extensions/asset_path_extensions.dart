extension AssetPathExtension on String {
  String get toPNG => 'assets/images/$this.png';
  String get toIcon => 'assets/icons/$this.png';
  String get toJpg => 'assets/images/$this.jpg';
  String get toHomeJpg => 'assets/images/homeJPG/$this.jpg';
  String get toJobsJpg => 'assets/images/jobsJPG/$this.jpg';
  String get toUeberUnsJpg => 'assets/images/ueberUnsJPG/$this.jpg';
  String get toAltowAcademyJpg => 'assets/images/altowAcademyJPG/$this.jpg';
}
