import 'package:password/password.dart';

class QueryTable {
  int queryid,userid,doctorid;
  String description, answer, timestamp;

  QueryTable(
      this.userid, this.doctorid, this.description, this.answer,this.timestamp) {

  }

  QueryTable.db(
      this.queryid, this.userid, this.doctorid, this.description, this.answer,this.timestamp);


  QueryTable.def() {
    queryid = null;
    userid = null;
    doctorid = null;
    description = '';
    answer = '';
    timestamp = '';
  }

}
