import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import '../providers/get_user_data_provider.dart';
import '../widgets/user_widget.dart';
class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    // call the api here
    //get request to https://reqres.in/api/users?page=2
    Provider.of<GetUsersDataProvider>(context, listen: false).getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        body: Consumer<GetUsersDataProvider>(
          builder: (_, value, __) {
            if (value.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  return UserWidget(
                    firstName: value.fullModel!.data![index].firstName,
                    imageUrl: value.fullModel!.data![index].avatar,
                    lastName: value.fullModel!.data![index].lastName,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: value.fullModel!.data!.length);
          },
        ));
  }
}
