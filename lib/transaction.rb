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
    @transaction[:balance] = @balance + value
  end

  def debit(value)
    @transaction[:date] = Date.today
    @transaction[:debit] = value
    @transaction[:balance] = @balance - value
  end
end
