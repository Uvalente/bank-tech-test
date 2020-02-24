# frozen_string_literal: true

class Transaction
  attr_reader :transaction

  def initialize(balance)
    @balance = balance
    @transaction = {}
  end

  def credit(value)
    @transaction[:date] = Date.today
    @transaction[:credit] = value
    @transaction[:balance] = value + @balance
  end
end
