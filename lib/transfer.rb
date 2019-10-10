require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :transfer
  
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @transfer = transfer
    @status = 'pending'
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  
  
  def execute_transaction
    if @sender.valid? && status == "pending"
      if amount < self.sender.balance
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance"
      end
    end
  end 
    def reverse_transfer
      if @status == "complete"
        @sender.deposit( @amount )
        @receiver.deposit( @amount * -1 )
        @status = "reversed"
      end
   end
end