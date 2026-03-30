class PredictionService {
  static DateTime predictNext(DateTime lastDate, int cycle) {
    return lastDate.add(Duration(days: cycle));
  }
}