# frozen_string_literal: true

class Transaction
  attr_reader :transaction

  def initialize
    @transaction = {}
  end

  def credit(value)
    @transaction[:date] = Date.today
    @transaction[:credit] = value
    @transaction[:balance] = value
  end
end
