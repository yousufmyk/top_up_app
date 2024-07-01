class Beneficiary {
  final String nickname;
  final String phoneNumber;
  double monthlyTopUpAmount;

  Beneficiary({
    required this.nickname,
    required this.phoneNumber,
    this.monthlyTopUpAmount = 0,
  });
}