class BankAccount
  attr_reader :balance

  def initialize(account_number, client, balance)
    @account_number = account_number
    @client = client
    @balance = balance
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0
      # success = (self.balance -= amount)
      puts "The return on line 21: #{self.balance -= amount}"
    else
      success = false
    end

    if success
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    puts "argument: #{new_balance}"
    if valid_transaction?(new_balance)
      @balance = new_balance
      true
    else
      false
    end
  end

  def valid_transaction?(new_balance)
    puts "argument in valid_transaction?: #{new_balance}"
    puts "#{new_balance >= 0}"
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve', 50)

                          # Expected output:
# p account.balance         # => 0
# p account.deposit(50)     # => $50 deposited. Total balance is $50.
# p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
                          # Actual output: $80 withdrawn. Total balance is $50.
p account.balance         # => 50