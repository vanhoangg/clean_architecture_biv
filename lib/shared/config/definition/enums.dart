enum Gender {
  male,
  female,
  total;

  int getRawValue() {
    switch (this) {
      case male:
        return 0;
      case female:
        return 1;
      case total:
        return 2;
    }
  }
}

enum PaymentMethod {
  cash,
  wallet,
}

enum UserType { client, staff, admin }

extension UserTypeX on UserType {
  bool get isStaff => this == UserType.staff;
}

enum TransactionType { expense, receive }

enum StaffSortType {
  nearest,
  newest,
  bestRate,
  foreignLanguage,
}

enum ServiceType { defaultService, vip, interest }

enum BookingStatus {
  statusDefault,
  statusSearchForStaff,
  statusNewAndWaitForAccepting,
  statusWaitingAfterDurationExtended,
  statusCancelled,
  statusReadyAndWaitForComing,
  statusStartedByStaff,
  statusExtendedDuration,
  statusCompleted,
  statusRated,
  statusCancelledDurationExtension,
  statusEdited,
  statusNewFromInterestAndWaitForAccepting
}

enum ResponseOTP {
  verified,
  nonError,
}

enum ChannelType { privateChat, bookingChat }

enum FeedbackType { common, message, imageSharing, user, block }
