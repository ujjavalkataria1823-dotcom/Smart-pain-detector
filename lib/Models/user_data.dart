class UserData {
  final String lastPeriodDate;
  final int cycleLength;

  UserData({required this.lastPeriodDate, required this.cycleLength});

  Map<String, dynamic> toJson() => {
        "lastPeriodDate": lastPeriodDate,
        "cycleLength": cycleLength,
      };

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      lastPeriodDate: json['lastPeriodDate'],
      cycleLength: json['cycleLength'],
    );
  }
}