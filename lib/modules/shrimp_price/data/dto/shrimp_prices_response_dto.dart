import 'package:jala_test/modules/shrimp_price/data/dto/regions_response_dto.dart';
import 'package:jala_test/shared/utils/logger.dart';

final class ShrimpPricesResponseDto {
  final List<Datum> data;
  final Links? links;
  final Meta? meta;

  const ShrimpPricesResponseDto({
    required this.data,
    this.links,
    this.meta,
  });

  @override
  String toString() {
    return 'ShrimpPricesResponseDto(data: $data, links: $links, meta: $meta)';
  }

  factory ShrimpPricesResponseDto.fromJson(Map<String, dynamic> json) {
    return ShrimpPricesResponseDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        // 'data': data.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
      };
}

final class Datum {
  final int id;
  final int speciesId;
  final String date;
  final int? size20;
  final int? size30;
  final int? size40;
  final int? size50;
  final int? size60;
  final int? size70;
  final int? size80;
  final int? size90;
  final int? size100;
  final int? size110;
  final int? size120;
  final int? size130;
  final int? size140;
  final int? size150;
  final int? size160;
  final int? size170;
  final int? size180;
  final int? size190;
  final int? size200;
  final String? remark;
  final int? createdBy;
  final int? updatedBy;
  final String createdAt;
  final String updatedAt;
  final String? regionId;
  final String? contact;
  final String? countryId;
  final String? currencyId;
  final dynamic private;
  final int? week;
  final String? dateRegionFullName;
  final String? provinceId;
  final String? regencyId;
  final String? districtId;
  final String? villageId;
  final Region region;
  final Creator creator;

  const Datum({
    required this.id,
    required this.speciesId,
    required this.date,
    this.size20,
    this.size30,
    this.size40,
    this.size50,
    this.size60,
    this.size70,
    this.size80,
    this.size90,
    this.size100,
    this.size110,
    this.size120,
    this.size130,
    this.size140,
    this.size150,
    this.size160,
    this.size170,
    this.size180,
    this.size190,
    this.size200,
    this.remark,
    this.createdBy,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.regionId,
    this.contact,
    this.countryId,
    this.currencyId,
    this.private,
    this.week,
    this.dateRegionFullName,
    this.provinceId,
    this.regencyId,
    this.districtId,
    this.villageId,
    required this.region,
    required this.creator,
  });

  @override
  String toString() {
    return 'Datum(id: $id, speciesId: $speciesId, date: $date, size20: $size20, size30: $size30, size40: $size40, size50: $size50, size60: $size60, size70: $size70, size80: $size80, size90: $size90, size100: $size100, size110: $size110, size120: $size120, size130: $size130, size140: $size140, size150: $size150, size160: $size160, size170: $size170, size180: $size180, size190: $size190, size200: $size200, remark: $remark, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt, regionId: $regionId, contact: $contact, countryId: $countryId, currencyId: $currencyId, private: $private, week: $week, dateRegionFullName: $dateRegionFullName, provinceId: $provinceId, regencyId: $regencyId, districtId: $districtId, villageId: $villageId, region: $region, creator: $creator)';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int,
        speciesId: json['species_id'] as int,
        date: json['date'] as String,
        size20: json['size_20'] as int?,
        size30: json['size_30'] as int?,
        size40: json['size_40'] as int?,
        size50: json['size_50'] as int?,
        size60: json['size_60'] as int?,
        size70: json['size_70'] as int?,
        size80: json['size_80'] as int?,
        size90: json['size_90'] as int?,
        size100: json['size_100'] as int?,
        size110: json['size_110'] as int?,
        size120: json['size_120'] as int?,
        size130: json['size_130'] as int?,
        size140: json['size_140'] as int?,
        size150: json['size_150'] as int?,
        size160: json['size_160'] as int?,
        size170: json['size_170'] as int?,
        size180: json['size_180'] as int?,
        size190: json['size_190'] as int?,
        size200: json['size_200'] as int?,
        remark: json['remark'] as String?,
        createdBy: json['created_by'] as int?,
        updatedBy: json['updated_by'] as int?,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
        regionId: json['region_id'] as String?,
        contact: json['contact'] as String?,
        countryId: json['country_id'] as String?,
        currencyId: json['currency_id'] as String?,
        private: json['private'] as dynamic,
        week: json['week'] as int?,
        dateRegionFullName: json['date_region_full_name'] as String?,
        provinceId: json['province_id'] as String?,
        regencyId: json['regency_id'] as String?,
        districtId: json['district_id'] as dynamic,
        villageId: json['village_id'] as dynamic,
        region: Region.fromJson(json['region'] as Map<String, dynamic>),
        creator: Creator.fromJson(json['creator'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'species_id': speciesId,
        'date': date,
        'size_20': size20,
        'size_30': size30,
        'size_40': size40,
        'size_50': size50,
        'size_60': size60,
        'size_70': size70,
        'size_80': size80,
        'size_90': size90,
        'size_100': size100,
        'size_110': size110,
        'size_120': size120,
        'size_130': size130,
        'size_140': size140,
        'size_150': size150,
        'size_160': size160,
        'size_170': size170,
        'size_180': size180,
        'size_190': size190,
        'size_200': size200,
        'remark': remark,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'region_id': regionId,
        'contact': contact,
        'country_id': countryId,
        'currency_id': currencyId,
        'private': private,
        'week': week,
        'date_region_full_name': dateRegionFullName,
        'province_id': provinceId,
        'regency_id': regencyId,
        'district_id': districtId,
        'village_id': villageId,
        'region': region.toJson(),
        'creator': creator.toJson(),
      };
}

final class Creator {
  final int id;
  final int roleId;
  final String name;
  final String email;
  final String avatar;
  final bool? emailVerified;
  final int? subscriptionTypeId;
  final Settings? settings;
  final String? createdAt;
  final String? updatedAt;
  final dynamic regionId;
  final dynamic address;
  final String? lastLoginAt;
  final bool? deactivated;
  final dynamic expiredAt;
  final String? phone;
  final bool? phoneVerified;
  final int? gender;
  final String? occupation;
  final dynamic idNumber;
  final dynamic idScan;
  final dynamic tinNumber;
  final dynamic tinScan;
  final dynamic birthdate;
  final dynamic company;
  final dynamic companyAddress;
  final dynamic position;
  final dynamic monthlyIncome;
  final dynamic incomeSource;
  final bool? buyer;
  final String? phoneCountry;
  final dynamic country;
  final String? interest;
  final dynamic unsubscribeEmailAt;
  final dynamic freshchatRestoreId;
  final bool? allowCreateClient;
  final bool? allowCreateToken;
  final List<dynamic>? interests;
  final State? state;
  final dynamic familyCardNumber;
  final dynamic familyCardScan;
  final dynamic telegramId;
  final String? genderName;
  final dynamic expiredDate;
  final dynamic expiredTime;
  final dynamic upcomingBirthdate;

  const Creator({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.avatar,
    this.emailVerified,
    this.subscriptionTypeId,
    this.settings,
    this.createdAt,
    this.updatedAt,
    this.regionId,
    this.address,
    this.lastLoginAt,
    this.deactivated,
    this.expiredAt,
    this.phone,
    this.phoneVerified,
    this.gender,
    this.occupation,
    this.idNumber,
    this.idScan,
    this.tinNumber,
    this.tinScan,
    this.birthdate,
    this.company,
    this.companyAddress,
    this.position,
    this.monthlyIncome,
    this.incomeSource,
    this.buyer,
    this.phoneCountry,
    this.country,
    this.interest,
    this.unsubscribeEmailAt,
    this.freshchatRestoreId,
    this.allowCreateClient,
    this.allowCreateToken,
    this.interests,
    this.state,
    this.familyCardNumber,
    this.familyCardScan,
    this.telegramId,
    this.genderName,
    this.expiredDate,
    this.expiredTime,
    this.upcomingBirthdate,
  });

  @override
  String toString() {
    return 'Creator(id: $id, roleId: $roleId, name: $name, email: $email, avatar: $avatar, emailVerified: $emailVerified, subscriptionTypeId: $subscriptionTypeId, settings: $settings, createdAt: $createdAt, updatedAt: $updatedAt, regionId: $regionId, address: $address, lastLoginAt: $lastLoginAt, deactivated: $deactivated, expiredAt: $expiredAt, phone: $phone, phoneVerified: $phoneVerified, gender: $gender, occupation: $occupation, idNumber: $idNumber, idScan: $idScan, tinNumber: $tinNumber, tinScan: $tinScan, birthdate: $birthdate, company: $company, companyAddress: $companyAddress, position: $position, monthlyIncome: $monthlyIncome, incomeSource: $incomeSource, buyer: $buyer, phoneCountry: $phoneCountry, country: $country, interest: $interest, unsubscribeEmailAt: $unsubscribeEmailAt, freshchatRestoreId: $freshchatRestoreId, allowCreateClient: $allowCreateClient, allowCreateToken: $allowCreateToken, interests: $interests, state: $state, familyCardNumber: $familyCardNumber, familyCardScan: $familyCardScan, telegramId: $telegramId, genderName: $genderName, expiredDate: $expiredDate, expiredTime: $expiredTime, upcomingBirthdate: $upcomingBirthdate)';
  }

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json['id'] as int,
        roleId: json['role_id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        avatar: json['avatar'] as String,
        emailVerified: json['email_verified'] as bool?,
        subscriptionTypeId: json['subscription_type_id'] as int?,
        settings: json['settings'] == null
            ? null
            : Settings.fromJson(json['settings'] as Map<String, dynamic>),
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        regionId: json['region_id'] as dynamic,
        address: json['address'] as dynamic,
        lastLoginAt: json['last_login_at'] as String?,
        deactivated: json['deactivated'] as bool?,
        expiredAt: json['expired_at'] as dynamic,
        phone: json['phone'] as String?,
        phoneVerified: json['phone_verified'] as bool?,
        gender: json['gender'] as int?,
        occupation: json['occupation'] as String?,
        idNumber: json['id_number'] as dynamic,
        idScan: json['id_scan'] as dynamic,
        tinNumber: json['tin_number'] as dynamic,
        tinScan: json['tin_scan'] as dynamic,
        birthdate: json['birthdate'] as dynamic,
        company: json['company'] as dynamic,
        companyAddress: json['company_address'] as dynamic,
        position: json['position'] as dynamic,
        monthlyIncome: json['monthly_income'] as dynamic,
        incomeSource: json['income_source'] as dynamic,
        buyer: json['buyer'] as bool?,
        phoneCountry: json['phone_country'] as String?,
        country: json['country'] as dynamic,
        interest: json['interest'] as String?,
        unsubscribeEmailAt: json['unsubscribe_email_at'] as dynamic,
        freshchatRestoreId: json['freshchat_restore_id'] as dynamic,
        allowCreateClient: json['allow_create_client'] as bool?,
        allowCreateToken: json['allow_create_token'] as bool?,
        interests: json['interests'] as List<dynamic>?,
        state: json['state'] == null
            ? null
            : State.fromJson(json['state'] as Map<String, dynamic>),
        familyCardNumber: json['family_card_number'] as dynamic,
        familyCardScan: json['family_card_scan'] as dynamic,
        telegramId: json['telegram_id'] as dynamic,
        genderName: json['gender_name'] as String?,
        expiredDate: json['expired_date'] as dynamic,
        expiredTime: json['expired_time'] as dynamic,
        upcomingBirthdate: json['upcoming_birthdate'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'role_id': roleId,
        'name': name,
        'email': email,
        'avatar': avatar,
        'email_verified': emailVerified,
        'subscription_type_id': subscriptionTypeId,
        'settings': settings?.toJson(),
        'created_at': createdAt,
        'updated_at': updatedAt,
        'region_id': regionId,
        'address': address,
        'last_login_at': lastLoginAt,
        'deactivated': deactivated,
        'expired_at': expiredAt,
        'phone': phone,
        'phone_verified': phoneVerified,
        'gender': gender,
        'occupation': occupation,
        'id_number': idNumber,
        'id_scan': idScan,
        'tin_number': tinNumber,
        'tin_scan': tinScan,
        'birthdate': birthdate,
        'company': company,
        'company_address': companyAddress,
        'position': position,
        'monthly_income': monthlyIncome,
        'income_source': incomeSource,
        'buyer': buyer,
        'phone_country': phoneCountry,
        'country': country,
        'interest': interest,
        'unsubscribe_email_at': unsubscribeEmailAt,
        'freshchat_restore_id': freshchatRestoreId,
        'allow_create_client': allowCreateClient,
        'allow_create_token': allowCreateToken,
        'interests': interests,
        'state': state?.toJson(),
        'family_card_number': familyCardNumber,
        'family_card_scan': familyCardScan,
        'telegram_id': telegramId,
        'gender_name': genderName,
        'expired_date': expiredDate,
        'expired_time': expiredTime,
        'upcoming_birthdate': upcomingBirthdate,
      };
}

final class Links {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  const Links({this.first, this.last, this.prev, this.next});

  @override
  String toString() {
    return 'Links(first: $first, last: $last, prev: $prev, next: $next)';
  }

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json['first'] as String?,
        last: json['last'] as String?,
        prev: json['prev'] as String?,
        next: json['next'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'first': first,
        'last': last,
        'prev': prev,
        'next': next,
      };
}

final class Settings {
  final String? locale;

  const Settings({this.locale});

  @override
  String toString() => 'Settings(locale: $locale)';

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        locale: json['locale'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'locale': locale,
      };
}

final class State {
  final String? knowJalaFrom;
  final String? phoneVerificationExpiredAt;
  final dynamic phoneVerificationOtpSent;
  final String? phoneUpdatedAt;
  final bool? partner;
  final dynamic oneSignalFarmId;
  final dynamic homeCoachmarkShown;
  final dynamic homeNewFeatureCoachmarkShown;
  final dynamic mailjetId;

  const State({
    this.knowJalaFrom,
    this.phoneVerificationExpiredAt,
    this.phoneVerificationOtpSent,
    this.phoneUpdatedAt,
    this.partner,
    this.oneSignalFarmId,
    this.homeCoachmarkShown,
    this.homeNewFeatureCoachmarkShown,
    this.mailjetId,
  });

  @override
  String toString() {
    return 'State(knowJalaFrom: $knowJalaFrom, phoneVerificationExpiredAt: $phoneVerificationExpiredAt, phoneVerificationOtpSent: $phoneVerificationOtpSent, phoneUpdatedAt: $phoneUpdatedAt, partner: $partner, oneSignalFarmId: $oneSignalFarmId, homeCoachmarkShown: $homeCoachmarkShown, homeNewFeatureCoachmarkShown: $homeNewFeatureCoachmarkShown, mailjetId: $mailjetId)';
  }

  factory State.fromJson(Map<String, dynamic> json) => State(
        knowJalaFrom: json['know_jala_from'] as String?,
        phoneVerificationExpiredAt:
            json['phone_verification_expired_at'] as String?,
        phoneVerificationOtpSent:
            json['phone_verification_otp_sent'] as dynamic,
        phoneUpdatedAt: json['phone_updated_at'] as String?,
        partner: json['partner'] as bool?,
        oneSignalFarmId: json['one_signal_farm_id'] as dynamic,
        homeCoachmarkShown: json['home_coachmark_shown'] as dynamic,
        homeNewFeatureCoachmarkShown:
            json['home_new_feature_coachmark_shown'] as dynamic,
        mailjetId: json['mailjet_id'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'know_jala_from': knowJalaFrom,
        'phone_verification_expired_at': phoneVerificationExpiredAt,
        'phone_verification_otp_sent': phoneVerificationOtpSent,
        'phone_updated_at': phoneUpdatedAt,
        'partner': partner,
        'one_signal_farm_id': oneSignalFarmId,
        'home_coachmark_shown': homeCoachmarkShown,
        'home_new_feature_coachmark_shown': homeNewFeatureCoachmarkShown,
        'mailjet_id': mailjetId,
      };
}

final class Meta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final String? path;
  final String? perPage;
  final int? to;
  final int? total;

  const Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  @override
  String toString() {
    return 'Meta(currentPage: $currentPage, from: $from, lastPage: $lastPage, path: $path, perPage: $perPage, to: $to, total: $total)';
  }

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json['current_page'] as int?,
        from: json['from'] as int?,
        lastPage: json['last_page'] as int?,
        path: json['path'] as String?,
        perPage: json['per_page'] as String?,
        to: json['to'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'from': from,
        'last_page': lastPage,
        'path': path,
        'per_page': perPage,
        'to': to,
        'total': total,
      };
}
