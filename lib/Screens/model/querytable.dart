import 'package:password/password.dart';

class QueryTable {
  late int queryid,userid,doctorid;
  late String description, answer, timestamp;

  QueryTable(
      this.userid, this.doctorid, this.description, this.answer,this.timestamp) {

  }

  QueryTable.db(
      this.queryid, this.userid, this.doctorid, this.description, this.answer,this.timestamp);


  QueryTable.def() {
    description = '';
    answer = '';
    timestamp = '';
  }

}
