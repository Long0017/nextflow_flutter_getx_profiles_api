import 'package:get/get.dart';

class ProfileController extends GetxController {
  var loading = false.obs;

  void loadDataFromWebAPI() {
    loading.value = true;

    loading.value = false;
  }
}
