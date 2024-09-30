class BankAccount {

  double _balance;

  BankAccount(this._balance);

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Deposit amount must be positive.');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdrew: \$${amount.toStringAsFixed(2)}');
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

class SavingsAccount extends BankAccount {

  SavingsAccount(double initialBalance) : super(initialBalance);

  void applyInterest(double interestRate) {
    if (interestRate > 0) {
      double interest = _balance * (interestRate / 100);
      deposit(interest);
      print('Interest of \$${interest.toStringAsFixed(2)} applied at rate $interestRate%.');
    } else {
      print('Interest rate must be positive.');
    }
  }
}

