
class Country{
  bool success =false;
  int statusCode =0;
  String message="";
 List<Data> datalist=[];
  Country({required this.success, required this.statusCode, required this.message, required this.datalist});

   Country.fromJson(Map<String, dynamic> json) {
    success = json['status'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        datalist.add(new Data.fromJson(v));
      });
    }
  }


}
class Data {
  String id="";
  String title="";

  Data({required this.id,required this.title});

    Data.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    title= json['title'];
  }


}

