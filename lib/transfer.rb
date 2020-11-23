class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end
# transaction1 = Transfer.new(Erwin, Alex, 30)
# transaction1.execute_transaction
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end


# class Transfer


#   attr_accessor :status, :amount, :sender, :receiver

#   def initialize(sender, receiver, amount)
#     @status = "pending"
#     @sender = sender
#     @receiver = receiver
#     @amount = amount
#   end

#   def valid?
#     sender.valid? && receiver.valid?
#   # (sender.status == "open" && sender.balance > 0) && (receiver.status == "open" && receiver.balance > 0)
#   # sender.valid? && receiver.valid?
#   end

#   def execute_transaction
#     if valid? && sender.balance > amount && self.status == “pending”
#       sender.balance -= amount
#       receiver.balance += amount
#       self.status = "complete"
#     else
#       reject_transfer
#         #self.status = "rejected"
#       # "Transaction rejected. Please check your account balance."
#     end
#   end

#   def reverse_transfer
#     if valid? && receiver.balance > amount && self.status == “complete”
#       receiver.balance -= amount
#       sender.balance += amount
#       self.status = "reversed"
#     else
#       reject_transfer
#       #self.status = "rejected"
#       # "Transaction rejected. Please check your account balance."
#     end
#   end

#   def reject_transfer
#     self.status = "rejected"
#     "Transaction rejected. Please check your account balance."
#   end
# end

# # if sender.valid?
# #   receiver.balance += amount

# #   Edge case: if the sender does not have enough funds (does not have a valid account)
# #     adding amount of sender to receiver balance