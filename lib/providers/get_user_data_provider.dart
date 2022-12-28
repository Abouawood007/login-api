import 'package:flutter/cupertino.dart';

import '../models/full_model.dart';
import '../services/http_services.dart';

class GetUsersDataProvider extends ChangeNotifier {
  FullModel? fullModel;
  bool isLoading = false;

  setSate() {
    notifyListeners();
  }

  getUser() async {
    isLoading = true;
    HttpService httpService = HttpService();
    await httpService.getRequest("api/users?page=2").then((value) {
      print(value
          .data); // this is the response data "{"name":"Ahmed","age":25,"job":"Flutter Developer}"

      fullModel = FullModel.fromJson(value.data);
      isLoading = false;
      setSate();
      //condtion status code 200
    });
  }
}
