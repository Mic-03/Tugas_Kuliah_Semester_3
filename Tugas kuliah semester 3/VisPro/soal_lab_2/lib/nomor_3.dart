class ATM {

  double _balance;
  ATM() : _balance = 0.0;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Successfully deposited: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Deposit amount must be positive.');
    }
  }
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Successfully withdrew: \$${amount.toStringAsFixed(2)}');
    } else if (amount > _balance) {
      print('Insufficient balance to withdraw \$${amount.toStringAsFixed(2)}.');
    } else {
      print('Withdraw amount must be positive.');
    }
  }
  void checkBalance() {
    print('Current Balance: \$${_balance.toStringAsFixed(2)}');
  }
}

