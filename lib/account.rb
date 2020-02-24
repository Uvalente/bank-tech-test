# frozen_string_literal: true

require_relative 'transaction_history'

INITIAL_BALANCE = 0

class Account
  attr_reader :balance, :statement

  def initialize(balance = INITIAL_BALANCE, statement = TransactionHistory.new)
    @balance = balance
    @statement = statement
  end

  def deposit(value)
    @statement.deposit(@balance, value)
    @balance += value
  end

  def withdraw(value)
    @statement.withdraw(@balance, value)
    @balance -= value
  end
end
