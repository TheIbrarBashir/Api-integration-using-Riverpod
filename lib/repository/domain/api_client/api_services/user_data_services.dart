import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konquer_test/repository/domain/api_client/api_client.dart';
import 'package:konquer_test/repository/models/users_data.dart';

class UserDataService extends LoadingStatus {
  UsersData? usersData;

  Future<void> getUsersData({UserQuery? userQuery}) async {
    Response response;
    try {
      response = await ApiClient().getData(userQuery: userQuery);
      if (response.statusCode == 200) {
        usersData = UsersData.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static final userDataServiceProvider = Provider<UserDataService>((ref) {
    return UserDataService();
  });
  static final userDataProvider =
      FutureProvider.family<UsersData?, AgeLimit>((ref, ageLimit) async {
    final userDataService = ref.watch(userDataServiceProvider);
    await userDataService.getUsersData(
        userQuery: UserQuery(ageGTE: ageLimit.ageGTE, ageLTE: ageLimit.ageLTE));
    return userDataService.usersData;
  });
}

class AgeLimit extends Equatable {
  final int? ageGTE;
  final int? ageLTE;

  const AgeLimit({
    this.ageGTE,
    this.ageLTE,
  });

  @override
  String toString() {
    return 'AgeLimit{ageGTE: $ageGTE, ageLTE: $ageLTE}';
  }

  @override
  List<Object?> get props => [ageLTE, ageGTE];
}
