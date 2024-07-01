class User {
  bool isVerified;
  double balance;
  double totalMonthlyTopUp;

  User({
    required this.isVerified,
    required this.balance,
    this.totalMonthlyTopUp = 0,
  });
}