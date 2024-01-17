class UserQuery {
  String? name;
  int? ageGTE;
  int? ageLTE;
  int? page;

  UserQuery({
    this.name,
    this.ageGTE,
    this.ageLTE,
    this.page,
  });

  @override
  String toString() {
    return 'UserQuery{name: $name, ageGTE: $ageGTE, ageLTE: $ageLTE, page: $page}';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name ?? '',
      'age__gte': ageGTE ?? '',
      'age__lte': ageLTE ?? '',
      'page': page ?? '',
    };
  }

  factory UserQuery.fromMap(Map<String, dynamic> map) {
    return UserQuery(
      name: map['name'],
      ageGTE: map['age__gte'],
      ageLTE: map['age__lte'],
      page: map['page'],
    );
  }
}

class UsersData {
  String? next;
  dynamic previous;
  int? count;
  List<User>? usersList;

  UsersData({
    this.next,
    this.previous,
    this.count,
    this.usersList,
  });

  @override
  String toString() {
    return 'UsersData{next: $next, previous: $previous, count: $count, usersList: $usersList}';
  }

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
        next: json["next"],
        previous: json["previous"],
        count: json["count"],
        usersList: json["results"] == null
            ? []
            : List<User>.from(json["results"]!.map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "next": next,
        "previous": previous,
        "count": count,
        "results": usersList == null
            ? []
            : List<dynamic>.from(usersList!.map((x) => x.toJson())),
      };
}

class User {
  String? firstName;
  String? lastName;
  String? usaBoxingId;
  String? gender;
  String? weight;
  DateTime? dateOfBirth;
  int? numberOfFights;
  int? teamId;
  String? gymName;
  String? pictureThumb;
  bool? isBoxer;
  bool? isCoach;
  bool? isOfficial;
  bool? isMatchmaker;
  bool? isManagedAccount;
  int? id;
  int? age;
  GymLocationFull? gymLocationFull;

  User({
    this.firstName,
    this.lastName,
    this.usaBoxingId,
    this.gender,
    this.weight,
    this.dateOfBirth,
    this.numberOfFights,
    this.teamId,
    this.gymName,
    this.pictureThumb,
    this.isBoxer,
    this.isCoach,
    this.isOfficial,
    this.isMatchmaker,
    this.isManagedAccount,
    this.id,
    this.age,
    this.gymLocationFull,
  });

  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, usaBoxingId: $usaBoxingId, gender: $gender, weight: $weight, dateOfBirth: $dateOfBirth, numberOfFights: $numberOfFights, teamId: $teamId, gymName: $gymName, pictureThumb: $pictureThumb, isBoxer: $isBoxer, isCoach: $isCoach, isOfficial: $isOfficial, isMatchmaker: $isMatchmaker, isManagedAccount: $isManagedAccount, id: $id, age: $age, gymLocationFull: $gymLocationFull}';
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        usaBoxingId: json["usa_boxing_id"],
        gender: json["gender"],
        weight: json["weight"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        numberOfFights: json["number_of_fights"],
        teamId: json["team_id"],
        gymName: json["gym_name"],
        pictureThumb: json["picture_thumb"],
        isBoxer: json["is_boxer"],
        isCoach: json["is_coach"],
        isOfficial: json["is_official"],
        isMatchmaker: json["is_matchmaker"],
        isManagedAccount: json["is_managed_account"],
        id: json["id"],
        age: json["age"],
        gymLocationFull: json["gym_location_full"] == null
            ? null
            : GymLocationFull.fromJson(json["gym_location_full"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "usa_boxing_id": usaBoxingId,
        "gender": gender,
        "weight": weight,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "number_of_fights": numberOfFights,
        "team_id": teamId,
        "gym_name": gymName,
        "picture_thumb": pictureThumb,
        "is_boxer": isBoxer,
        "is_coach": isCoach,
        "is_official": isOfficial,
        "is_matchmaker": isMatchmaker,
        "is_managed_account": isManagedAccount,
        "id": id,
        "age": age,
        "gym_location_full": gymLocationFull?.toJson(),
      };
}

class GymLocationFull {
  String? locality;
  String? state;
  String? stateCode;
  String? country;
  String? countryCode;
  String? raw;

  GymLocationFull({
    this.locality,
    this.state,
    this.stateCode,
    this.country,
    this.countryCode,
    this.raw,
  });

  @override
  String toString() {
    return 'GymLocationFull{locality: $locality, state: $state, stateCode: $stateCode, country: $country, countryCode: $countryCode, raw: $raw}';
  }

  factory GymLocationFull.fromJson(Map<String, dynamic> json) =>
      GymLocationFull(
        locality: json["locality"],
        state: json["state"],
        stateCode: json["state_code"],
        country: json["country"],
        countryCode: json["country_code"],
        raw: json["raw"],
      );

  Map<String, dynamic> toJson() => {
        "locality": locality,
        "state": state,
        "state_code": stateCode,
        "country": country,
        "country_code": countryCode,
        "raw": raw,
      };
}
