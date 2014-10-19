module TransactionHelper

  #This helper allows user to enter in transaction data intuitively.
  #i.e. user can enter $100 as an expense and it be stored as negative in database
  #This helper simply corrects any potential problems related to that.
  def type_correction
    if type == "Expense"
        self.amount = -(self.amount) if self.amount > 0
    else
        self.amount = -(self.amount) if self.amount < 0
    end
  end

end
