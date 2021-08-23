
class City{
  bool success =false;
  int statusCode =0;
  String message="";
 List<DataCity> datalist=[];
  City({required this.success, required this.statusCode, required this.message, required this.datalist});

  City.fromJson(Map<String, dynamic> json) {
    success = json['status'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        datalist.add(new DataCity.fromJson(v));
      });
    }
  }


}
class DataCity {
  String id="";
  String title="";

  DataCity({required this.id,required this.title});

  DataCity.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    title= json['title'];
  }


}

