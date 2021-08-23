import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({required this.url, required this.parse});
}

class Webservice {
  var tag = "Webservice----";

  Future<T> loadPostWithoutParam<T>(Resource<T> resource) async {
    //final response = await http.post(resource.url);
    final response = await http.post(Uri.parse(resource.url));
    print("response........................." + response.toString());
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<T> loadPost<T>(Resource<T> resource, Map body) async {
    final response = await http.post(Uri.parse(resource.url), body: body);


    print("response........................." + response.toString());
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<T> loadGET<T>(Resource<T> resource) async {
    final response = await http.get(Uri.parse(resource.url));
    print("response........................." + response.toString());
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<T> loadLocationGET<T>(Resource<T> resource) async {
    final response = await http.get(Uri.parse(resource.url));
    print("response........................." + response.toString());
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<T> loadPostwithHeader<T>(Resource<T> resource, Map body, String token) async {
//    Map<String, String> headers = {"Content-type": "application/json"};
//    String token = await Utils.getBearerToken();
//    print(tag + "token........" + token);
    Map<String, String> headers = {
//      "Content-Type": "application/json",
//      "Accept": "application/json",
      "Authorization": "Bearer $token",

    };

    /*Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };*/
    final response =
        await http.post(Uri.parse(resource.url), headers: headers, body: body);
    print("response........................." + response.toString());
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

}
