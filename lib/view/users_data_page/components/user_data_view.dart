import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konquer_test/view/users_data_page/components/user_data_card.dart';

import '../../../repository/domain/api_client/api_services/user_data_services.dart';

class UserDataView extends ConsumerWidget {
  final AgeLimit? ageLimit;

  const UserDataView({super.key, this.ageLimit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue  config  = ref.watch(UserDataService.userDataProvider);
    //final  userDataService =  ref.read(UserDataService.userDataServiceProvider);

    return Center(
      child: config.when(
        data: (data) => data?.usersList != null
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: (data?.usersList ?? []).length,
                itemBuilder: (context, index) =>
                    ProfileCard(user: data?.usersList?.elementAt(index)),
              )
            : const Text('Data not available'),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
