# frozen_string_literal: true

require 'date'

class Transaction
  attr_reader :transaction

  def deposit(balance, value)
    @transaction = {}
    @transaction[:date] = Date.today
    @transaction[:credit] = value
    @transaction[:balance] = balance + value
    @transaction
  end

  def withdraw(balance, value)
    @transaction = {}
    @transaction[:date] = Date.today
    @transaction[:debit] = value
    @transaction[:balance] = balance - value
    @transaction
  end
end
