import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextflow_flutter_getx_profiles_api/controllers/profile_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    controller.loadDataFromWebAPI();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
      ),
      // the body contains filter text field and list of profiles
      body: Obx(() {
        if (controller.loading.value == true) {
          return Center(child: CircularProgressIndicator());
        } else {
          var profiles = controller.profiles;

          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(profiles[index].name!),
                subtitle: Text(profiles[index].phone!),
                onTap: () {
                  print(profiles[index].name);
                  print(profiles[index].phone);
                },
              );
            },
          );
        }
      }),
    );
  }
}
