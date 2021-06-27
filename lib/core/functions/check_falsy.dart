bool checkFalsy(dynamic param) {
  if (["", "null", null, false, 0].contains(param)) return true;
  if ((param is List) && (param.length == 0)) return true;
  return false;
}
