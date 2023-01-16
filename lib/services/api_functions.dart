import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Constants/utilities.dart';
import '../Widgets/custom_loader.dart';

class ApiFunctions {
  final String _baseUrl;

  ApiFunctions(this._baseUrl);

  Future<dynamic> getAsync(String endPoint,
      {bool showLoader = true, bool showSuccessMessage = false}) async {
    log('$_baseUrl$endPoint');
    try {
      if (showLoader) Get.dialog(const CustomLoader());

      var response = await http.get(Uri.parse('$_baseUrl$endPoint'), headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": "Client-ID 0JBoaEda4EwXk3CAamYJlLzQvoZTms-zp7RZ_Duq46g"
      });
      log(response.body);

      var result = json.decode(response.body);
      if (showLoader) Get.back();

      if (response.statusCode == 200) {
        return result;
      }

      Utilities.showErrorMessage();
      return null;
    } catch (e, trace) {
      if (showLoader) Get.back();
      Utilities.showErrorMessage(error: e.toString());
      log(e.toString());
      log(trace.toString());
      return null;
    }
  }
}
