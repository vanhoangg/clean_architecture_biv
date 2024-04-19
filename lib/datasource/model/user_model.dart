import '../../shared/config/definition/enums.dart';

class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final double? latitude;
  final double? longitude;
  final int? typeId;
  final String? country;
  final String? height;
  final String? birthday;
  final Gender? gender;
  final double? score;
  final String? codeUser;
  final String? ageDisplay;
  final int? confirmed;
  final String? language;
  final int? isActive;
  final String? partnerCode;
  final String? currentJob;
  final int? requestedBookingTip;
  final int? canUseVip;
  final int? parentPartnerId;
  final int? online;
  final String? identityNumber;
  final String? avatarUrl;
  final dynamic consecutiveBookCancelling;
  final String? socialStatus;
  final String? socialStatusMediaUrl;
  final dynamic ownedStock;
  final int? hasBooking;
  final int? hasForeignLangSkill;
  final List<String>? listPortrait;
  final int? likeCount;
  final double? distance;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.latitude,
    this.longitude,
    this.typeId,
    this.country,
    this.height,
    this.birthday,
    this.gender,
    this.score,
    this.codeUser,
    this.ageDisplay,
    this.confirmed,
    this.language,
    this.isActive,
    this.partnerCode,
    this.currentJob,
    this.requestedBookingTip,
    this.canUseVip,
    this.parentPartnerId,
    this.online,
    this.identityNumber,
    this.avatarUrl,
    this.consecutiveBookCancelling,
    this.socialStatus,
    this.socialStatusMediaUrl,
    this.ownedStock,
    this.hasBooking,
    this.hasForeignLangSkill,
    this.listPortrait,
    this.likeCount,
    this.distance,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'latitude': latitude,
      'longitude': longitude,
      'type_id': typeId,
      'country': country,
      'height': height,
      'birthday': birthday,
      'gender': gender?.toString().split('.').last,
      'score': score,
      'code_user': codeUser,
      'age_display': ageDisplay,
      'confirmed': confirmed,
      'language': language,
      'is_active': isActive,
      'partner_code': partnerCode,
      'current_job': currentJob,
      'requested_booking_tip': requestedBookingTip,
      'can_use_vip': canUseVip,
      'parent_partner_id': parentPartnerId,
      'online': online,
      'identity_number': identityNumber,
      'avatar_url': avatarUrl,
      'consecutive_book_cancelling': consecutiveBookCancelling,
      'social_status': socialStatus,
      'social_status_media_url': socialStatusMediaUrl,
      'owned_stock': ownedStock,
      'has_booking': hasBooking,
      'has_foreign_lang_skill': hasForeignLangSkill,
      'list_portrait': listPortrait,
      'like_count': likeCount,
      'distance': distance,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      typeId: json['type_id'],
      country: json['country'],
      height: json['height'],
      birthday: json['birthday'],
      gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
      score: json['score'],
      codeUser: json['code_user'],
      ageDisplay: json['age_display'],
      confirmed: json['confirmed'],
      language: json['language'],
      isActive: json['is_active'],
      partnerCode: json['partner_code'],
      currentJob: json['current_job'],
      requestedBookingTip: json['requested_booking_tip'],
      canUseVip: json['can_use_vip'],
      parentPartnerId: json['parent_partner_id'],
      online: json['online'],
      identityNumber: json['identity_number'],
      avatarUrl: json['avatar_url'],
      consecutiveBookCancelling: json['consecutive_book_cancelling'],
      socialStatus: json['social_status'],
      socialStatusMediaUrl: json['social_status_media_url'],
      ownedStock: json['owned_stock'],
      hasBooking: json['has_booking'],
      hasForeignLangSkill: json['has_foreign_lang_skill'],
      listPortrait: json['list_portrait'] != null
          ? List<String>.from(json['list_portrait'])
          : null,
      likeCount: json['like_count'],
      distance: json['distance'],
    );
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    double? latitude,
    double? longitude,
    int? typeId,
    String? country,
    String? height,
    String? birthday,
    Gender? gender,
    double? score,
    String? codeUser,
    String? ageDisplay,
    int? confirmed,
    String? language,
    int? isActive,
    String? partnerCode,
    String? currentJob,
    int? requestedBookingTip,
    int? canUseVip,
    int? parentPartnerId,
    int? online,
    String? identityNumber,
    String? avatarUrl,
    dynamic consecutiveBookCancelling,
    String? socialStatus,
    String? socialStatusMediaUrl,
    dynamic ownedStock,
    int? hasBooking,
    int? hasForeignLangSkill,
    List<String>? listPortrait,
    int? likeCount,
    double? distance,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      typeId: typeId ?? this.typeId,
      country: country ?? this.country,
      height: height ?? this.height,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      score: score ?? this.score,
      codeUser: codeUser ?? this.codeUser,
      ageDisplay: ageDisplay ?? this.ageDisplay,
      confirmed: confirmed ?? this.confirmed,
      language: language ?? this.language,
      isActive: isActive ?? this.isActive,
      partnerCode: partnerCode ?? this.partnerCode,
      currentJob: currentJob ?? this.currentJob,
      requestedBookingTip: requestedBookingTip ?? this.requestedBookingTip,
      canUseVip: canUseVip ?? this.canUseVip,
      parentPartnerId: parentPartnerId ?? this.parentPartnerId,
      online: online ?? this.online,
      identityNumber: identityNumber ?? this.identityNumber,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      consecutiveBookCancelling:
          consecutiveBookCancelling ?? this.consecutiveBookCancelling,
      socialStatus: socialStatus ?? this.socialStatus,
      socialStatusMediaUrl: socialStatusMediaUrl ?? this.socialStatusMediaUrl,
      ownedStock: ownedStock ?? this.ownedStock,
      hasBooking: hasBooking ?? this.hasBooking,
      hasForeignLangSkill: hasForeignLangSkill ?? this.hasForeignLangSkill,
      listPortrait: listPortrait ?? this.listPortrait,
      likeCount: likeCount ?? this.likeCount,
      distance: distance ?? this.distance,
    );
  }

  UserType getType() {
    switch (typeId) {
      case 2:
        return UserType.staff;
      // case 3:
      //   return UserType.client;
      default:
        return UserType.client;
    }
  }
}

enum UserType {
  staff,
  client,
}

T? _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => MapEntry<T, dynamic>(unknownValue as T, null))
      .key;
}

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
