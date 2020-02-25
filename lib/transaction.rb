# frozen_string_literal: true

require 'date'

# Responsible of instantiating a instance of Transaction
class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(date: Date.today, credit: nil, debit: nil, balance:)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance + credit if credit
    @balance = balance - debit if debit
  end
end
