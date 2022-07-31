String formattedStopwatch(double value, [String separator = ":"]) {
  int h, m, s;
  h = value ~/ 3600;
  m = ((value - h * 3600)) ~/ 60;
  s = value.ceil() - (h * 3600) - (m * 60);
  h = h.ceil();
  String result =
      "${h.toString().padLeft(2, '0')}$separator${m.toString().padLeft(2, '0')}$separator${s.toString().padLeft(2, '0')}";
  return result;
}
