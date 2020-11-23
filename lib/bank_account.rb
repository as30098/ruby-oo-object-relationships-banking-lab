class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amount)
    self.balance += deposit_amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def close_account
    self.status = "closed"
  end

  def valid?
    self.balance > 0 && self.status == "open"
  end
  #somewhere under the hood, balance and status will check for those variables within this class
end

# require 'pry'
# class BankAccount

#     attr_reader :name
#     attr_accessor :balance, :status

#     def initialize(name)
#       @name = name
#       @balance = 1000
#       @status = "open"
#     end

#     def deposit(user_deposit)
#       self.balance += user_deposit
#     end

#     def display_balance
#       "Your balance is $#{self.balance}."
#     end

#     def valid?
#       status == "open" && balance > 0
#     end

#     def close_account
#         self.status = "closed"
#     end

# end
