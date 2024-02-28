String convertDateTimeToString(DateTime dateTime){

  String y = dateTime.year.toString();
  String m = dateTime.month.toString();
  if(m.length == 1){
    m = '0$m';
  }
  String d = dateTime.day.toString();
  if(d.length == 1){
    d = '0$d';
  }

  String yyyymmdd = y + m + d;

  return yyyymmdd;
}