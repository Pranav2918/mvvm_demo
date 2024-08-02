import 'package:flutter/material.dart';
import 'package:mvvm_demo/src/presentation/view_models/user_provider.dart';
import 'package:mvvm_demo/src/presentation/views/common_widgets/appbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserListProvider userListProvider = UserListProvider();

  @override
  void initState() {
    userListProvider.fetchUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appHeaders("Homescreen"),
        body: ChangeNotifierProvider(
          create: (context) => userListProvider,
          child: Consumer<UserListProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: value.users.data!.length,
                    itemBuilder: (context, index) {
                      final data = value.users.data![index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data.avatar.toString()),
                          ),
                          title: Text(data.firstName.toString()),
                          subtitle: Text(data.email.toString()),
                        ),
                      );
                    });
              }
            },
          ),
        ));
  }
}
